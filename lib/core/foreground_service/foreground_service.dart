// // The callback function should always be a top-level or static function.
// import 'package:flutter_foreground_task/flutter_foreground_task.dart';

// @pragma('vm:entry-point')
// void startCallback() {
//   FlutterForegroundTask.setTaskHandler(MyTaskHandler());
// }

// class MyTaskHandler extends TaskHandler {
//   // Called when the task is started.
//   @override
//   Future<void> onStart(DateTime timestamp, TaskStarter starter) async {
//     print('onStart(starter: ${starter.name})');
//   }

//   // Called based on the eventAction set in ForegroundTaskOptions.
//   @override
//   void onRepeatEvent(DateTime timestamp) {
//     // Send data to main isolate.
//     final Map<String, dynamic> data = {
//       "timestampMillis": timestamp.millisecondsSinceEpoch,
//     };
//     FlutterForegroundTask.sendDataToMain(data);
//   }

//   // Called when the task is destroyed.
//   @override
//   Future<void> onDestroy(DateTime timestamp, bool isTimeout) async {
//     print('onDestroy(isTimeout: $isTimeout)');
//   }

//   // Called when data is sent using `FlutterForegroundTask.sendDataToTask`.
//   @override
//   void onReceiveData(Object data) {
//     print('onReceiveData: $data');
//   }

//   // Called when the notification button is pressed.
//   @override
//   void onNotificationButtonPressed(String id) {
//     print('onNotificationButtonPressed: $id');
//   }

//   // Called when the notification itself is pressed.
//   @override
//   void onNotificationPressed() {
//     print('onNotificationPressed');
//   }

//   // Called when the notification itself is dismissed.
//   @override
//   void onNotificationDismissed() {
//     print('onNotificationDismissed');
//   }

//   void _onReceiveTaskData(Object data) {
//     if (data is Map<String, dynamic>) {
//       final dynamic timestampMillis = data["timestampMillis"];
//       if (timestampMillis != null) {
//         final DateTime timestamp = DateTime.fromMillisecondsSinceEpoch(
//           timestampMillis,
//           isUtc: true,
//         );
//         print('timestamp: ${timestamp.toString()}');
//       }
//     }
//   }
// }
