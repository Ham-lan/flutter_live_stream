import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
import 'package:http/http.dart' as http;


void main() => runApp(const MaterialApp(home: WebViewNew()));

class WebViewNew extends StatefulWidget {
  const WebViewNew({super.key});

  @override
  State<WebViewNew> createState() => _WebViewNewState();
}

class _WebViewNewState extends State<WebViewNew> {
  late final WebViewController _controller;

  getLiveStream() async {
    final response = await http.get(
        Uri.parse('http://192.168.0.108/capture'),

        headers: {
          'Content-Type':'multipart/x-mixed-replace;boundary=123456789000000000000987654321'
        }
    );


  }

  @override
  void initState() {
    super.initState();

    // getLiveStream();

    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller = WebViewController.fromPlatformCreationParams(params);

    String url ='';

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
          Uri.parse(url));



    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }

    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter WebView Example'),
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
