import 'package:get/get.dart';
import 'package:web_booking/resources/langs/st_en_US.dart';
import 'package:web_booking/resources/langs/st_vi_VN.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en,
        'vi_VN': vi,
      };
}
