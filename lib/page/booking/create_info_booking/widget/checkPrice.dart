import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/booking/model_get_ref.dart';
import 'package:web_booking/model/booking/storage_controller/create_booking_controller.dart';

int checkPrice(
    // {required String ref_check,
    // required String size_check,
    // required String type_check,
    // required String status_check}
    ) {
  List<GetRef> listRef = box.read(ref_booking);
  // print(ref_check);
  // print(size_check);
  // print(type_check);
  // print(status_check);
  for (var ref in listRef) {
    if (createBookingController.refId.value == ref.refId!.trim() &&
        createBookingController.size.value == ref.size!.trim() &&
        createBookingController.type.value == ref.type!.trim() &&
        createBookingController.status.value == ref.status!.trim()) {
      return ref.price ?? 0;
    }
  }
  return 0;
}
