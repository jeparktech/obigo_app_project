import 'package:flutter/material.dart';

class ImagePicker extends StatefulWidget {
 @override
  _ImagePickerState createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePicker> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
              leading: Icon(Icons.photo),
              title: Text("Photos"),
              onTap: () {
                //getPhoto(ImageSource.gallery, context);
              }),
          ListTile(
              leading: Icon(Icons.camera),
              title: Text("Camera"),
              onTap: () {
                //getPhoto(ImageSource.camera, context);
              }),
        ],
      ),
    );
  }
}