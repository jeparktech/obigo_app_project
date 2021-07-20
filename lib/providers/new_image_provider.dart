import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

import '../pages/fuel_info_page.dart';

class NewImage with ChangeNotifier {
  File? _image;

  File get image {
    return _image!;
  }

  void getPhoto(ImageSource source, BuildContext ctx) async {
    final _picker = ImagePicker();
    XFile? f = await _picker.pickImage(
        source: source, maxWidth: 1024, maxHeight: 1024);
    if (f == null) {
      return;
    }
    _image = File(f.path);
    notifyListeners();
    Navigator.of(ctx).pushNamed(FuelInfoPage.routeName, arguments: _image);
  }
}
