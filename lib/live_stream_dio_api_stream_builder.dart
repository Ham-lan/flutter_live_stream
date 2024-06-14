// import 'dart:async';
// import 'dart:convert';
// import 'dart:typed_data';
// import 'package:dio/dio.dart';
// import 'package:dio/io.dart';
// import 'package:image/image.dart' as img;
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image/image.dart' as img;
// import 'dart:typed_data';
// // import 'image_service.dart'; // Import the service
//
// class ImageService {
//   final String apiUrl = 'https://192.168.0.204:5000/livestream?username=user123&password=password123&shared_key=secret';
//   static const String boundary = '123456789000000000000987654321';
//   static const String partBoundary = '--$boundary';
//
//   Dio _dio = Dio();
//
//   ImageService() {
//     _dio = Dio();
//     (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
//       client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
//       return client;
//     };
//   }
//
//   Stream<img.Image?> getImageStream() async* {
//     try {
//       final response = await _dio.get(
//         apiUrl,
//         options: Options(responseType: ResponseType.stream),
//       );
//
//       final stream = response.data.stream.transform(Utf8Decoder()).transform(LineSplitter());
//
//       await for (String line in stream) {
//         if (line.contains(partBoundary)) {
//           String contentLengthHeader = await stream.firstWhere((header) => header.startsWith('Content-Length:'));
//           int contentLength = int.parse(contentLengthHeader.split(': ')[1].trim());
//
//           // Read the content bytes
//           List<int> contentBytes = [];
//           await for (String contentLine in stream) {
//             if (contentLine.contains(partBoundary)) {
//               break;
//             }
//             contentBytes.addAll(Utf8Encoder().convert(contentLine + '\n'));
//             if (contentBytes.length >= contentLength) {
//               break;
//             }
//           }
//
//           Uint8List imageBytes = Uint8List.fromList(contentBytes);
//           img.Image? image = img.decodeJpg(imageBytes);
//           yield image;
//         }
//       }
//     } catch (e) {
//       print(e);
//       yield null;
//     }
//   }
// }
//
//
// class ImageStreamDisplayNew extends StatefulWidget {
//   @override
//   _ImageStreamDisplayNewState createState() => _ImageStreamDisplayNewState();
// }
//
// class _ImageStreamDisplayNewState extends State<ImageStreamDisplayNew> {
//   ImageService _imageService = ImageService();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Live Image Stream'),
//       ),
//       body: Center(
//         child: StreamBuilder<img.Image?>(
//           stream: _imageService.getImageStream(),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return CircularProgressIndicator();
//             } else if (snapshot.hasError) {
//               return Text('Error: ${snapshot.error}');
//             } else if (!snapshot.hasData) {
//               return Text('No data');
//             } else {
//               return Image.memory(Uint8List.fromList(img.encodeJpg(snapshot.data!)));
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(MaterialApp(
//     home: ImageStreamDisplayNew(),
//   ));
// }
