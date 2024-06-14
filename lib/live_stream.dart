// import 'dart:async';
// import 'dart:typed_data';
// import 'package:http/http.dart' as http;
// import 'package:image/image.dart' as img;
// import 'package:flutter/material.dart';
// import 'package:image/image.dart' as img;
// import 'dart:typed_data';
// import 'package:flutter/services.dart';
//
//
// final StreamController<Uint8List> _streamController = StreamController<Uint8List>();
//
// class ImageService {
//   final String apiUrl = 'http://192.168.0.108/livestream';
//
//   Future<img.Image?> fetchImageFrame() async {
//     try {
//
//       final response = await http.get(
//           Uri.parse(apiUrl),
//
//         headers: {
//             'Content-Type':'multipart/x-mixed-replace;boundary=123456789000000000000987654321'
//           }
//       );
//
//
//       debugPrint(response.body);
//
//
//       if (response.statusCode == 200) {
//         // response.body;
//         // while(true){
//           Uint8List bytes = response.bodyBytes;
//           debugPrint(bytes.toString());
//           img.Image? image = img.decodeImage(bytes);
//           return image;
//         // }
//
//       } else {
//         throw Exception('Failed to load image frame');
//       }
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }
// }
//
//
// class ImageFrameDisplayHttp extends StatefulWidget {
//   @override
//   _ImageFrameDisplayHttpState createState() => _ImageFrameDisplayHttpState();
// }
//
// class _ImageFrameDisplayHttpState extends State<ImageFrameDisplayHttp> {
//   // final StreamController<Uint8List> _streamController = StreamController<Uint8List>();
//   ImageService _imageService = ImageService();
//   img.Image? _imageFrame;
//
//   @override
//   void initState() {
//     super.initState();
//     _loadImageFrame();
//   }
//
//   Future<void> _loadImageFrame() async {
//     img.Image? image = await _imageService.fetchImageFrame();
//     setState(() {
//       _imageFrame = image;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Image Frame Display'),
//       ),
//       body: Center(
//         child: _imageFrame != null
//             ? Image.memory(Uint8List.fromList(img.encodePng(_imageFrame!)))
//             : CircularProgressIndicator(),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _loadImageFrame,
//         child: Icon(Icons.refresh),
//       ),
//     );
//   }
// }
