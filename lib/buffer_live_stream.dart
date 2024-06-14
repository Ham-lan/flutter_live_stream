// // import 'dart:async';
// // import 'dart:convert';
// // import 'dart:typed_data';
// // import 'package:dio/dio.dart';
// // import 'package:dio/io.dart';
// // import 'package:image/image.dart' as img;
// // import 'dart:io';
// //
// // import 'package:flutter/material.dart';
// // import 'package:image/image.dart' as img;
// // import 'dart:typed_data';
// // // import 'image_service.dart'; // Import the service
// //
// //
// // class ImageService {
// //   final String apiUrl = 'http://192.168.0.108/livestream';
// //   static const String boundary = '123456789000000000000987654321';
// //   static const String partBoundary = '--$boundary';
// //
// //   Dio _dio = Dio();
// //
// //   ImageService() {
// //     _dio = Dio();
// //     (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
// //       client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
// //       return client;
// //     };
// //   }
// //
// //   Stream<img.Image?> getImageStream() async* {
// //     try {
// //       final response = await _dio.get(
// //         //   apiUrl, options: Options(
// //         // responseType: ResponseType.stream,
// //         // headers: {
// //         //   'Content-Type':'multipart/x-mixed-replace;boundary=123456789000000000000987654321'
// //         // },
// //         apiUrl,
// //         options: Options(
// //           responseType: ResponseType.stream,
// //           headers: {
// //             'Accept': 'multipart/x-mixed-replace;boundary=$boundary',
// //             'Content-type':'Jpeg'
// //           },
// //         ),
// //       );
// //
// //
// //       debugPrint('STREAM IS ');
// //       debugPrint( response.data.toString());
// //
// //       final stream = response.data.stream;
// //
// //
// //       // Timer to stop the stream after 10 seconds
// //       Timer timer = Timer(Duration(seconds: 10), () {
// //         response.data.close(); // Close the stream after 10 seconds
// //       });
// //
// //       await for (var data in stream) {
// //         List<int> buffer = [];
// //         buffer.addAll(data);
// //
// //         // Find the boundary and split parts
// //         String content = utf8.decode(buffer);
// //         List<String> parts = content.split(partBoundary);
// //
// //         for (String part in parts) {
// //           if (part.contains('Content-Length:')) {
// //             int contentLength = int.parse(
// //                 RegExp(r'Content-Length: (\d+)').firstMatch(part)!.group(1)!);
// //             int startIndex = part.indexOf('\r\n\r\n') + 4;
// //             Uint8List imageBytes = Uint8List.fromList(
// //                 utf8.encode(part.substring(startIndex, startIndex + contentLength)));
// //
// //             img.Image? image = img.decodeJpg(imageBytes);
// //             yield image;
// //           }
// //         }
// //
// //         if (timer.isActive) {
// //           timer.cancel(); // Cancel the timer if still active
// //         }
// //       }
// //     } catch (e) {
// //       print(e);
// //       yield null;
// //     }
// //   }
// // }
// //
// //
// // class ImageStreamDisplayBuffer extends StatefulWidget {
// //   @override
// //   _ImageStreamDisplayBufferState createState() => _ImageStreamDisplayBufferState();
// // }
// //
// // class _ImageStreamDisplayBufferState extends State<ImageStreamDisplayBuffer> {
// //   ImageService _imageService = ImageService();
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Live Image Stream'),
// //       ),
// //       body: Center(
// //         child: StreamBuilder<img.Image?>(
// //           stream: _imageService.getImageStream(),
// //           builder: (context, snapshot) {
// //             if (snapshot.connectionState == ConnectionState.waiting) {
// //               return CircularProgressIndicator();
// //             } else if (snapshot.hasError) {
// //               return Text('Error: ${snapshot.error}');
// //             } else if (!snapshot.hasData) {
// //               return Text('No data');
// //             } else {
// //               return Image.memory(Uint8List.fromList(img.encodeJpg(snapshot.data!)));
// //             }
// //           },
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// // void main() {
// //   runApp(MaterialApp(
// //     home: ImageStreamDisplayBuffer(),
// //   ));
// // }
//
//
// import 'dart:async';
// import 'dart:convert';
// import 'dart:typed_data';
// import 'package:dio/dio.dart';
// import 'package:dio/io.dart';
// import 'package:image/image.dart' as img;
// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:image/image.dart' as img;
// import 'dart:typed_data';
// // import 'image_service.dart'; // Import the service
//
//
// class ImageService {
//   final String apiUrl = 'http://192.168.0.108/livestream';
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
//         options: Options(
//           responseType: ResponseType.stream,
//           headers: {
//           'Content-Type':'multipart/x-mixed-replace;boundary=123456789000000000000987654321'
//         },
//           // headers: {
//           //   'Accept': 'multipart/x-mixed-replace;boundary=$boundary',
//           // },
//         ),
//       );
//
//       final stream = response.data.stream;
//
//
//       debugPrint(stream.toString());
//
//
//       // Timer to stop the stream after 10 seconds
//       // Timer timer = Timer(Duration(seconds: 10), () {
//       //   response.data.close(); // Close the stream after 10 seconds
//       // });
//
//       List<int> buffer = [];
//       await for (var data in stream) {
//         buffer.addAll(data);
//
//         while (true) {
//           String content = utf8.decode(buffer);
//           int boundaryIndex = content.indexOf(partBoundary);
//
//           if (boundaryIndex == -1) break;
//
//           int contentLengthIndex = content.indexOf('Content-Length: ', boundaryIndex);
//           int startIndex = content.indexOf('\r\n\r\n', contentLengthIndex) + 4;
//
//           if (contentLengthIndex == -1 || startIndex == -1) break;
//
//           int contentLengthEndIndex = content.indexOf('\r\n', contentLengthIndex);
//           int contentLength = int.parse(content.substring(contentLengthIndex + 16, contentLengthEndIndex).trim());
//
//           int endIndex = startIndex + contentLength;
//           if (buffer.length < endIndex) break;
//
//           Uint8List imageBytes = Uint8List.fromList(buffer.sublist(startIndex, endIndex));
//           img.Image? image = img.decodeJpg(imageBytes);
//           yield image;
//
//           buffer = buffer.sublist(endIndex);
//         }
//       }
//
//       // if (timer.isActive) {
//       //   timer.cancel(); // Cancel the timer if still active
//       // }
//     } catch (e) {
//       print(e);
//       yield null;
//     }
//   }
// }
//
//
// class ImageStreamDisplayBuffer extends StatefulWidget {
//   @override
//   _ImageStreamDisplayBufferState createState() => _ImageStreamDisplayBufferState();
// }
//
// class _ImageStreamDisplayBufferState extends State<ImageStreamDisplayBuffer> {
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
//     home: ImageStreamDisplayBuffer(),
//   ));
// }
