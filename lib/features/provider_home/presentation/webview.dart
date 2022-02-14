import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
<<<<<<< HEAD

class WebViewPrivacy extends StatefulWidget {
=======
class WebViewPrivacy extends StatefulWidget {

>>>>>>> b97480d9783e56d23a544ec0d168ea94f68a671a
  @override
  _WebViewPrivacyState createState() => _WebViewPrivacyState();
}

class _WebViewPrivacyState extends State<WebViewPrivacy> {
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return const Scaffold(
      body: WebView(
        initialUrl: 'https://maru-frontend.vercel.app/terms',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

class WebViewPolicy extends StatefulWidget {
  @override
  _WebViewPolicyState createState() => _WebViewPolicyState();
}

class _WebViewPolicyState extends State<WebViewPolicy> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WebView(
        initialUrl: 'https://maru-frontend.vercel.app/policy',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

class AchInformationWebView extends StatefulWidget {
  @override
  _AchInformationWebViewState createState() => _AchInformationWebViewState();
}

class _AchInformationWebViewState extends State<AchInformationWebView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WebView(
        initialUrl: 'https://maru-frontend.vercel.app',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
class ProviderWebViewSignup extends StatefulWidget {
  @override
  _ProviderWebViewSignupState createState() => _ProviderWebViewSignupState();
}

class _ProviderWebViewSignupState extends State<ProviderWebViewSignup> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WebView(
        initialUrl: 'https://maru-frontend.vercel.app/auth/register',
        javascriptMode: JavascriptMode.unrestricted,
=======
    return Scaffold(
      body:WebView(
initialUrl: 'https://www.google.com/B',
        javascriptMode: JavascriptMode.unrestricted,

>>>>>>> b97480d9783e56d23a544ec0d168ea94f68a671a
      ),
    );
  }
}
