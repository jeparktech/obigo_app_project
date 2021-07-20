import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../providers/new_image_provider.dart';
import '../pages/fuel_info_page.dart';

class ImagePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newImage = Provider.of<NewImage>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
              leading: Icon(Icons.photo),
              title: Text("Photos"),
              onTap: () {
                newImage.getPhoto(ImageSource.gallery, context);
              }),
          ListTile(
              leading: Icon(Icons.camera),
              title: Text("Camera"),
              onTap: () {
                newImage.getPhoto(ImageSource.camera, context);
              }),
        ],
      ),
    );
  }
}
