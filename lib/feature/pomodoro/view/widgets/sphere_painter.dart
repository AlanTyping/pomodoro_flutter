part of '../screen/pomodoro_page.dart';

class _SphereShaderWidget extends StatefulWidget {
  const _SphereShaderWidget({
    required this.total,
    required this.current,
    this.fillColor,
    this.unFillColor,
  });

  final int total;
  final int current;
  final Color? fillColor;
  final Color? unFillColor;

  @override
  State<_SphereShaderWidget> createState() => _SphereShaderWidgetState();
}

class _SphereShaderWidgetState extends State<_SphereShaderWidget>
    with SingleTickerProviderStateMixin {
  late FragmentProgram _fragmentProgram;
  bool _shaderLoaded = false;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _loadShader();

    // Create an animation controller that loops continuously
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10), // Adjust duration as needed
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final percentage = (widget.current / widget.total).clamp(0.0, 1.0);

    return _shaderLoaded
        ? AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return CustomPaint(
              painter: _SphereShaderPainter(
                shader: _fragmentProgram.fragmentShader(),
                percentage: percentage,
                color: widget.fillColor ?? Theme.of(context).primaryColor,
                backgroundColor:
                    widget.unFillColor ??
                    Theme.of(context).colorScheme.surfaceContainer,
                time: _animationController.value * 10, // Scale as needed
              ),
            );
          },
        )
        : const Center(child: CircularProgressIndicator.adaptive());
  }

  Future<void> _loadShader() async {
    try {
      _fragmentProgram = await FragmentProgram.fromAsset(
        'assets/shaders/sphere_fill.frag',
      );

      setState(() => _shaderLoaded = true);
    } catch (e) {
      debugPrint('Error loading the shader: $e');
    }
  }
}

class _SphereShaderPainter extends CustomPainter {
  final FragmentShader shader;
  final double percentage;
  final double time;
  final Color color;
  final Color backgroundColor;

  _SphereShaderPainter({
    required this.shader,
    required this.percentage,
    required this.time,
    required this.color,
    required this.backgroundColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Set uniforms. The order must match the GLSL file.
    shader.setFloat(0, percentage); // uPercentage
    shader.setFloat(1, time); // uTime
    shader.setFloat(2, size.width); // uResolution.x
    shader.setFloat(3, size.height); // uResolution.y

    // uFilledColor (vec4: r, g, b, a)
    shader.setFloat(4, color.r);
    shader.setFloat(5, color.g);
    shader.setFloat(6, color.b);
    shader.setFloat(7, color.a);

    // uFilledColor (vec4: r, g, b, a)
    shader.setFloat(8, backgroundColor.r);
    shader.setFloat(9, backgroundColor.g);
    shader.setFloat(10, backgroundColor.b);
    shader.setFloat(11, backgroundColor.a);

    // Draw a rectangle covering the entire canvas, using the shader
    canvas.drawRect(Offset.zero & size, Paint()..shader = shader);
  }

  @override
  bool shouldRepaint(_SphereShaderPainter oldDelegate) {
    return oldDelegate.percentage != percentage ||
        oldDelegate.time != time ||
        oldDelegate.color != color;
  }
}
