import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:web_booking/constants/global.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/screen/home/homepage_screen.dart';

class ImportStock {
  Future<void> UploadFileImport(
      String tudong, String dendong, PlatformFile file) async {
    if (tudong.isNotEmpty && dendong.isNotEmpty) {
      var url =
          '$SERVER/ContainerStock/ImportTour?tuDong=$tudong&denDong=$dendong';
      var request = MultipartRequest('POST', Uri.parse(url));
      Map<String, String> headers = {
        "Content-Type": "multipart/form-data",
        "Authorization": "Bearer $tokenAuthorize",
      };
      //Add file
      if (file.bytes == null || file.bytes!.isEmpty) {
        print('Error: File bytes are null or emmty');
        return;
      }
      var fileStream = ByteStream.fromBytes(file.bytes!);
      var length = file.size;
      var multipartFile = MultipartFile('upload', fileStream, length,
          filename: file.name,
          contentType: MediaType('multipart', 'form-data'));

      request.files.add(multipartFile);
      request.headers.addAll(headers);

      //can add additional fields to the request if need
      // request.fields['key'] = 'value';

      try {
        var response = await request.send();
        if (response.statusCode == 200) {
          // print('File uploaded success');
          sideBarController.index.value = 11;
        } else {
          print('Failed ti updaload file. Status code: ${response.statusCode}');
        }
      } catch (e) {
        print('Error upload file: $e');
      }
    } else {
      print('Please input both tudong dendong');
    }
  }
}
