part of '../screen/pomodoro_page.dart';

class _SphereShaderWidget extends StatefulWidget {
  const _SphereShaderWidget({required this.total, required this.current});

  final int total;
  final int current;

  @override
  State<_SphereShaderWidget> createState() => _SphereShaderWidgetState();
}

class _SphereShaderWidgetState extends State<_SphereShaderWidget> {
  late FragmentProgram _fragmentProgram;
  bool _shaderLoaded = false;

  @override
  void initState() {
    _loadShader();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final percentage = (widget.current / widget.total).clamp(0.0, 1.0);

    return _shaderLoaded
        ? CustomPaint(
          painter: _SphereShaderPainter(
            shader: _fragmentProgram.fragmentShader(),
            percentage: percentage,
            time: widget.current.toDouble(),
          ),
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

  static Color get filledColor => Colors.teal;
  static Color get unfilledColor => Colors.lightBlue;

  _SphereShaderPainter({
    required this.shader,
    required this.percentage,
    required this.time,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Set uniforms. The order must match the GLSL file.
    shader.setFloat(0, percentage); // uPercentage
    shader.setFloat(1, time); // uTime
    shader.setFloat(2, size.width); // uResolution.x
    shader.setFloat(3, size.height); // uResolution.y

    // uFilledColor (vec4: r, g, b, a)
    shader.setFloat(4, filledColor.r / 255.0 * filledColor.a);
    shader.setFloat(5, filledColor.g / 255.0 * filledColor.a);
    shader.setFloat(6, filledColor.b / 255.0 * filledColor.a);
    shader.setFloat(7, filledColor.a);

    // uUnfilledColor (vec4: r, g, b, a)
    shader.setFloat(8, unfilledColor.r / 255.0 * unfilledColor.a);
    shader.setFloat(9, unfilledColor.g / 255.0 * unfilledColor.a);
    shader.setFloat(10, unfilledColor.b / 255.0 * unfilledColor.a);
    shader.setFloat(11, unfilledColor.a);

    // Draw a rectangle covering the entire canvas, using the shader
    canvas.drawRect(Offset.zero & size, Paint()..shader = shader);
  }

  @override
  bool shouldRepaint(_SphereShaderPainter oldDelegate) {
    return oldDelegate.percentage != percentage || oldDelegate.time != time;
  }
}
