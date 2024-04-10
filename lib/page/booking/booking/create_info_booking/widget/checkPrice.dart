import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/booking/model_get_ref.dart';
import 'package:web_booking/model/booking/storage_controller/create_booking_controller.dart';

int checkPrice() {
  List<GetRef> listRef = box.read(ref_booking);
  String? type;
  switch (createBookingController.type.value) {
    case 'GP':
      type = 'DC';
      break;
    case 'HQ':
      type = 'HC';
      break;
    case 'HR':
      type = 'RF';
      break;
    default:
      type = createBookingController.type.value;
      break;
  }
  for (var ref in listRef) {
    if (createBookingController.refId.value == ref.refId!.trim() &&
        createBookingController.coc.value == ref.coc! &&
        createBookingController.size.value == ref.size!.trim() &&
        type == ref.type!.trim() &&
        createBookingController.status.value == ref.status!.trim() &&
        createBookingController.dg.value == ref.dg!) {
      return ref.price ?? 0;
    }
  }
  return 0;
}
