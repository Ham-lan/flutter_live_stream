// import 'dart:async';
// import 'dart:ffi';
// import 'dart:typed_data';
// import 'package:dio/dio.dart';
// import 'package:dio/io.dart';
// import 'package:image/image.dart' as img;
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image/image.dart' as img;
// import 'dart:typed_data';
//
//
// final StreamController<img.Image> _streamController = StreamController<img.Image>();
//
// class ImageService {
//   final String apiUrl = 'http://192.168.0.108/livestream';
//
//   fetchImageFrame() async {
//     try {
//       Dio dio = Dio();
//
//       // Disable SSL verification
//       // ignore: deprecated_member_use
//       (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
//         client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
//         return client;
//       };
//
//       Response response = await dio.get(
//           apiUrl, options: Options(
//           responseType: ResponseType.stream,
//           headers: {
//             'Content-Type':'multipart/x-mixed-replace;boundary=123456789000000000000987654321',
//             'Transfer-Encoding':'chunked'
//           }
//       ),
//
//       );
//
//       debugPrint(response.statusCode.toString() );
//
//       // img.Image image = response.data as  ;
//
//       // debugPrint(image.toString());
//
//       // response.
//
//       if (response.statusCode == 200) {
//
//
//         // _streamController = response.data as List<Int>;
//
//         // _streamController.add(img.decodeImage(Uint8List.fromList(response.data as List<int> )  )! );
//
//
//         // Uint8List bytes = Uint8List.fromList(response.data);
//         // debugPrint(bytes.toString());
//         // img.Image? image = img.decodeImage(bytes);
//         // return image;
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
// class ImageFrameDisplayDio extends StatefulWidget {
//   @override
//   _ImageFrameDisplayDioState createState() => _ImageFrameDisplayDioState();
// }
//
// class _ImageFrameDisplayDioState extends State<ImageFrameDisplayDio> {
//   ImageService _imageService = ImageService();
//   img.Image? _imageFrame;
//   img.Image? _currentImage;
//
//
//   @override
//   void initState() {
//     super.initState();
//     _loadImageFrame();
//   }
//
//   Future<void> _loadImageFrame() async {
//     _imageFrame = await _imageService.fetchImageFrame();
//
//
//     // setState(() {
//     //   _imageFrame = image;
//     // });
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Image Frame Display'),
//       ),
//       body:
//
//       // Center(
//       //   child: _imageFrame != null
//       //       ? Image.memory(Uint8List.fromList(img.encodePng(_imageFrame!)))
//       //       : CircularProgressIndicator(),
//       // ),
//       Center(
//         child: StreamBuilder<img.Image>(
//           stream: _streamController.stream,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Center(child: CircularProgressIndicator());
//             } else if (snapshot.hasError) {
//               return Center(child: Text('Error: ${snapshot.error}'));
//             } else if (snapshot.hasData) {
//               _currentImage = snapshot.data;
//               return Container(
//                 width: 400,
//                 height: 600,
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.black),
//                 ),
//                 child: _currentImage != null
//                     ? Image.memory(Uint8List.fromList( img.encodePng(_currentImage!) ))
//                     : Center(child: CircularProgressIndicator()),
//               );
//             } else {
//               return Center(child: Text('No image yet'));
//             }
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _loadImageFrame,
//         child: Icon(Icons.refresh),
//       ),
//     );
//   }
// }
