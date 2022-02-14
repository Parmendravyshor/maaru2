import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPrivacy extends StatefulWidget {
  @override
  _WebViewPrivacyState createState() => _WebViewPrivacyState();
}

class _WebViewPrivacyState extends State<WebViewPrivacy> {
  @override
  Widget build(BuildContext context) {
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
      ),
    );
  }
}
