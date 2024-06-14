// // import 'package:flutter/material.dart';
// // import 'dart:async';
// //
// // void main() => runApp(MyApp());
// //
// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: ImageStreamPage(),
// //     );
// //   }
// // }
// //
// // class ImageStreamPage extends StatefulWidget {
// //   @override
// //   _ImageStreamPageState createState() => _ImageStreamPageState();
// // }
// //
// // class _ImageStreamPageState extends State<ImageStreamPage> {
// //   final StreamController<String> _streamController = StreamController<String>();
// //   final List<String> _images = [];
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     _simulateImageStream();
// //   }
// //
// //   void _simulateImageStream() {
// //     // Simulate a continuous stream of image URLs
// //     Timer.periodic(Duration(seconds: 2), (timer) {
// //       final imageUrl = 'https://picsum.photos/200/300?random=${DateTime.now().millisecondsSinceEpoch}';
// //       _streamController.add(imageUrl);
// //     });
// //   }
// //
// //   @override
// //   void dispose() {
// //     _streamController.close();
// //     super.dispose();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Image Stream'),
// //       ),
// //       body: StreamBuilder<String>(
// //         stream: _streamController.stream,
// //         builder: (context, snapshot) {
// //           if (snapshot.connectionState == ConnectionState.waiting) {
// //             return Center(child: CircularProgressIndicator());
// //           } else if (snapshot.hasError) {
// //             return Center(child: Text('Error: ${snapshot.error}'));
// //           } else if (snapshot.hasData) {
// //             _images.add(snapshot.data!);
// //             return ListView.builder(
// //               itemCount: _images.length,
// //               itemBuilder: (context, index) {
// //                 return Padding(
// //                   padding: const EdgeInsets.all(8.0),
// //                   child: Image.network(_images[index]),
// //                 );
// //               },
// //             );
// //           } else {
// //             return Center(child: Text('No images yet'));
// //           }
// //         },
// //       ),
// //     );
// //   }
// // }
//
//
//
// import 'package:flutter/material.dart';
// import 'dart:async';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: ImageStreamPage(),
//     );
//   }
// }
//
// class ImageStreamPage extends StatefulWidget {
//   @override
//   _ImageStreamPageState createState() => _ImageStreamPageState();
// }
//
// class _ImageStreamPageState extends State<ImageStreamPage> {
//   final StreamController<String> _streamController = StreamController<String>();
//   String? _currentImage;
//
//   @override
//   void initState() {
//     super.initState();
//     _simulateImageStream();
//   }
//
//   void _simulateImageStream() {
//     // Simulate a continuous stream of image URLs
//     Timer.periodic(Duration(milliseconds: 1), (timer) {
//       final imageUrl = 'https://picsum.photos/400/600?random=${DateTime.now().millisecondsSinceEpoch}';
//       _streamController.add(imageUrl);
//     });
//   }
//
//   @override
//   void dispose() {
//     _streamController.close();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Image Stream as Video'),
//       ),
//       body: Center(
//         child: StreamBuilder<String>(
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
//                     ? Image.network(_currentImage!, fit: BoxFit.cover)
//                     : Center(child: CircularProgressIndicator()),
//               );
//             } else {
//               return Center(child: Text('No image yet'));
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
