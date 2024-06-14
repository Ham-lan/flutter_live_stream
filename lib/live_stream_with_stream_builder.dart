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
//
// import 'dart:async';
// import 'dart:typed_data';
// import 'package:http/http.dart' as http;
// import 'package:image/image.dart' as img;
// import 'dart:io';
//
// class ImageService {
//   final String apiUrl = 'https://192.168.0.204:5000/livestream?username=user123&password=password123&shared_key=secret';
//   static const String boundary = '123456789000000000000987654321';
//   static const String partBoundary = '--$boundary';
//
//   Stream<img.Image?> getImageStream() async* {
//     final client = http.Client();
//     try {
//       final request = http.Request('GET', Uri.parse(apiUrl));
//       final response = await client.send(request);
//
//       if (response.statusCode == 200) {
//         final boundaryStream = response.stream
//             .transform( Utf8Decoder() )
//             .transform( LineSplitter() )
//             .asBroadcastStream();
//
//         await for (String line in boundaryStream) {
//           if (line.contains(partBoundary)) {
//             // Skip headers until the Content-Length header
//             String contentLengthHeader = await boundaryStream.firstWhere(
//                     (header) => header.startsWith('Content-Length:'));
//             int contentLength = int.parse(
//                 contentLengthHeader.split(': ')[1].trim());
//
//             // Read the content bytes
//             List<int> contentBytes = [];
//             await for (String contentLine in boundaryStream) {
//               if (contentLine.contains(partBoundary)) {
//                 break;
//               }
//               contentBytes.addAll(Utf8Encoder().convert(contentLine + '\n'));
//               if (contentBytes.length >= contentLength) {
//                 break;
//               }
//             }
//
//             Uint8List imageBytes = Uint8List.fromList(contentBytes);
//             img.Image? image = img.decodeJpg(imageBytes);
//             yield image;
//           }
//         }
//       } else {
//         throw Exception('Failed to load image stream');
//       }
//     } catch (e) {
//       print(e);
//       yield null;
//     } finally {
//       client.close();
//     }
//   }
// }
//
//
//
// class ImageStreamDisplayStreamBuilder extends StatefulWidget {
//   @override
//   _ImageStreamDisplayStreamBuilderState createState() => _ImageStreamDisplayStreamBuilderState();
// }
//
// class _ImageStreamDisplayStreamBuilderState extends State<ImageStreamDisplayStreamBuilder> {
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
//
//               return CircularProgressIndicator();
//             } else if (snapshot.hasError) {
//               return Text('Error: ${snapshot.error}');
//             } else if (!snapshot.hasData) {
//               return Text('No data');
//             } else {
//               return Image.memory(Uint8List.fromList(img.encodePng(snapshot.data!)));
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
