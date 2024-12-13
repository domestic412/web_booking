import 'package:web_booking/utils/constant.dart';

Stream<int> watchCountNotify() async* {
  // Simulate a stream of notification counts
  await Future<void>.delayed(Duration(seconds: 1));
  yield 5; // Example value
}
