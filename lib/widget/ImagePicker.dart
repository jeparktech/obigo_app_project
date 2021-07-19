import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../providers/new_image_provider.dart';
import '../pages/fuel_info_page.dart';

class ImagePicker extends StatefulWidget {
  @override
  _ImagePickerState createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePicker> {
  @override
  Widget build(BuildContext context) {
    final newImage = Provider.of<NewImage>(context);
    var image = newImage.image;
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
               
Navigator.pushNamed(context, FuelInfoPage.routeName);
                
                
              }),
          ListTile(
              leading: Icon(Icons.camera),
              title: Text("Camera"),
              onTap: () {
                newImage.getPhoto(ImageSource.camera, context);
                if (image != null) {
Navigator.pushNamed(context, FuelInfoPage.routeName);
                }
              }),
        ],
      ),
    );
  }
}
