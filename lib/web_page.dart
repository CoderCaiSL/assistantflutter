import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:assistantflutter/util/app_navigator.dart';
import 'package:assistantflutter/widgets/common_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage extends StatefulWidget {
  final String url;
  final bool hideTitle;

  const WebPage({Key key, this.url, this.hideTitle = false}) : super(key: key);
  @override
  WebPageState createState() => new WebPageState();
}

class WebPageState extends State<WebPage> with AutomaticKeepAliveClientMixin {
  String title = '网页加载';
  final Completer<WebViewController> _controller =
  Completer<WebViewController>();
  WebViewController  instanceWebController;

  @override
  Widget build(BuildContext context) {
    _controller.future.then((data) {
      instanceWebController = data;
    });
    return WillPopScope(
      // ignore: missing_return
      onWillPop: () async {
        instanceWebController.canGoBack().then((value){
          if (value) {
            instanceWebController.goBack();
          }  else{
            AppNavigator.goBack(context);
          }
        });
      },
      child: widget.hideTitle?
      _getWebWidget():
      new Scaffold(
        appBar: CommonAppBar(title: title,),
        body: _getWebWidget(),
      ),
    );
  }
  Widget _getWebWidget() {
   return WebView(
      initialUrl: widget.url,
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (controller) {
        _controller.complete(controller);
      },
      navigationDelegate: (NavigationRequest request) {
        if (!request.url.startsWith(new RegExp(r'http[s]:\/\/'))) {
          print('blocking navigation to $request}');
          return NavigationDecision.prevent;
        }
        print('allowing navigation to $request');
        return NavigationDecision.navigate;
      },
      onPageFinished: (url) {
        instanceWebController.getTitle().then((value) {
          setState(() {
            title = value;
          });
        });
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didUpdateWidget(WebPage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

