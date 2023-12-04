import 'dart:io';
import 'package:image_picker/image_picker.dart';

class imagepicker {
  Future<File> uploadImage(String inputSource) async {
    final picker = imagepicker();
    final XFile? pickerImage = await picker.pickImage(
        Source:
            inputSource == 'camera' ? ImageSource.camera : ImageSource.gallery);
    File imagefile = File(pickerImage!.path);
    return imagefile;
  }
}
