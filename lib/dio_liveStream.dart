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
// class ImageService {
//   final String apiUrl = 'https://192.168.0.204:5000/livestream?username=user123&password=password123&shared_key=secret';
//
//   final String apiUrl1 = 'http://192.168.0.108/livestream';
//
//   Future<img.Image?> fetchImageFrame() async {
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
//
//
//       Response response = await dio.get(apiUrl1,
//           options: Options(responseType: ResponseType.bytes)
//       );
//
//
//       debugPrint('api hit');
//
//
//
//       debugPrint( response.data.toString() );
//       debugPrint( response.statusCode.toString() );
//       debugPrint( response.statusCode.toString() );
//       debugPrint( response.statusCode.toString() );
//       debugPrint( response.statusCode.toString() );
//       debugPrint( response.statusCode.toString() );
//       debugPrint( response.statusCode.toString() );
//       debugPrint( response.statusCode.toString() );
//       debugPrint( response.statusCode.toString() );
//       debugPrint( response.statusCode.toString() );
//       debugPrint( response.statusCode.toString() );
//       debugPrint( response.statusCode.toString() );
//       debugPrint( response.statusCode.toString() );
//       debugPrint( response.statusCode.toString() );
//       debugPrint( response.statusCode.toString() );
//       debugPrint( response.statusCode.toString() );
//       debugPrint( response.statusCode.toString() );
//       debugPrint( response.statusCode.toString() );
//       debugPrint( response.statusCode.toString() );
//       debugPrint( response.statusCode.toString() );
//       debugPrint(response.statusCode.toString() );
//
//
//       if (response.statusCode == 200) {
//
//
//
//         Uint8List bytes = Uint8List.fromList(response.data);
//         img.Image? image = img.decodeImage(bytes);
//         return image;
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
// class DioLiveStream extends StatefulWidget {
//   @override
//   _DioLiveStreamState createState() => _DioLiveStreamState();
// }
//
// class _DioLiveStreamState extends State<DioLiveStream> {
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
//     // img.Image? image
//
//     _imageFrame = await _imageService.fetchImageFrame();
//     // setState(() {
//     //   _imageFrame = image;
//     // });
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
