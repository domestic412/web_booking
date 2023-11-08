import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:file_picker/file_picker.dart';

FilePickerResult? pickedFile;

class Import {
  Future ImportExcel() async {
    try {
      pickedFile = await FilePickerWeb.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['xlsx'],
        allowMultiple: false,
      );
    } catch (e) {
      print(e);
    }
  }
}
