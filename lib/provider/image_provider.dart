import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart';

class ImagePickerService with ChangeNotifier {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _imageFile;

  XFile? get imageFile => _imageFile;

  Future<void> pickImage(ImageSource source) async {
    final image = await _imagePicker.pickImage(source: source);
    if (image != null) {
      _imageFile = image;
      notifyListeners();
    }
  }

  void clearImage() {
    _imageFile = null;
    notifyListeners();
  }
}
