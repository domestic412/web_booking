import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/booking/model_get_ref.dart';
import 'package:web_booking/model/booking/storage_controller/create_booking_controller.dart';

int checkPrice() {
  List<GetRef> listRef = box.read(ref_booking);
  String? type;
  int? weight = int.parse(createBookingController.weight_controller.value.text);
  String? weightCondition;
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
  if (weight == 0) {
    // weightCondition = 'STD';
    weightCondition == 'STD';
  } else if (weight <= 10000) {
    weightCondition = '<=10';
  } else if (weight <= 15000) {
    weightCondition = '<=15';
  } else {
    // weightCondition = 'STD';
    weightCondition = 'STD';
  }
  for (var ref in listRef) {
    switch (createBookingController.refId.value) {
      case '00000000-0000-0000-0000-000000000000':
        weightCondition = "MNG";
      default:
    }
    if (createBookingController.refId.value == ref.refId!.trim() &&
        createBookingController.coc.value == ref.coc! &&
        createBookingController.size.value == ref.size!.trim() &&
        type == ref.type!.trim() &&
        createBookingController.status.value == ref.status!.trim() &&
        weightCondition == ref.weightCondition!.trim() &&
        createBookingController.dg.value == ref.dg!) {
      return ref.price ?? 0;
    }
  }
  return 0;
}
