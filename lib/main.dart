import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lostpeople/Gui/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Login(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   File _image;
//   Future getImage() async {
//     var image = await ImagePicker.pickImage(source: ImageSource.gallery);

//     setState(() {
//       _image = image;
//     });
//   }
// // final File imageFile = getImage();
// final FirebaseVisionImage visionImage = FirebaseVisionImage.fromFile(getImage());
// final FaceDetector faceDetector = FirebaseVision.instance.faceDetector();
// final List<Face> faces = await faceDetector.processImage(visionImage);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Image Picker Example'),
//       ),
//       body: Center(
//         child: _image == null
//             ? Text('No image selected.')
//             : Image.file(_image),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: getImage,
//         tooltip: 'Pick Image',
//         child: Icon(Icons.add_a_photo),
//       ),
//     );
//   }
// }