import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class WebViewPrivacy extends StatefulWidget {


  @override
  _WebViewPrivacyState createState() => _WebViewPrivacyState();
}

class _WebViewPrivacyState extends State<WebViewPrivacy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:WebView(
initialUrl: 'https://codeseasy.com',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
