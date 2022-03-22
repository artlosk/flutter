import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'dart:io';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter browser'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ChromeSafariBrowser _chromeSafariBrowser = ChromeSafariBrowser();
  late InAppWebViewController _webViewController;
  final InAppLocalhostServer _localhostServer = InAppLocalhostServer();
  final TextEditingController _textController = TextEditingController();
  late PullToRefreshController pullToRefreshController;
  String url = "";
  double progress = 0;
  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
      ),
      android: AndroidInAppWebViewOptions(useHybridComposition: true),
      ios: IOSInAppWebViewOptions(allowsInlineMediaPlayback: true));

  @override
  void initState() {
    super.initState();
    _localhostServer.start();
    pullToRefreshController = PullToRefreshController(
      options: PullToRefreshOptions(
        color: Colors.blue,
      ),
      onRefresh: () async {
        if (Platform.isAndroid) {
          _webViewController.reload();
        } else if (Platform.isIOS) {
          _webViewController.loadUrl(
              urlRequest: URLRequest(url: await _webViewController.getUrl()));
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              children: [
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: <Widget>[

                        IconButton(
                          constraints: const BoxConstraints(maxWidth: 20),
                          icon: const Icon(Icons.arrow_back),
                          iconSize: 14,
                          onPressed: () async {
                            if (await _webViewController.canGoBack()) {
                              _webViewController.goBack();
                            } else {
                              return;
                            }
                          },
                        ),
                    IconButton(
                      constraints: const BoxConstraints(maxWidth: 20),
                      icon: const Icon(Icons.arrow_forward),
                      iconSize: 14,
                      onPressed: () async {
                        await _webViewController.canGoForward()
                            ? _webViewController.goForward()
                            : null;
                      },
                    ),
                    progress < 1.0
                        ? IconButton(
                      constraints: const BoxConstraints(maxWidth: 20),
                      icon: const Icon(Icons.highlight_remove_rounded),
                      iconSize: 14,
                      onPressed: () {
                        _webViewController.stopLoading();
                      },
                    )
                        : IconButton(
                      constraints: const BoxConstraints(maxWidth: 20),
                      icon: const Icon(Icons.refresh),
                      iconSize: 14,
                      onPressed: () {
                        _webViewController.reload();
                      },
                    ),
                  ],
                ),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(left: 20)),
                    controller: _textController,
                    keyboardType: TextInputType.url,
                    onSubmitted: (value) {
                      var url = Uri.parse(value);
                      if (url.scheme.isEmpty) {
                        url = Uri.parse(
                            "https://www.google.com/search?q=" + value);
                      }
                      _webViewController.loadUrl(
                          urlRequest: URLRequest(url: url));
                    },
                    onTap: () {
                      _textController.clear();
                    },
                  ),
                ),
              ],
            ),
            Expanded(
              child: Stack(
                children: [
                  InAppWebView(
                    key: webViewKey,
                    onWebViewCreated: (controller) {
                      _webViewController = controller;
                    },
                    onLoadStart: (controller, url) {
                      setState(() {
                        this.url = url.toString();
                        _textController.text = this.url;
                      });
                    },
                    initialOptions: options,
                    initialUrlRequest: URLRequest(
                      url: Uri.parse("about:blank"),
                    ),
                    pullToRefreshController: pullToRefreshController,
                    androidOnPermissionRequest:
                        (controller, origin, resources) async {
                      return PermissionRequestResponse(
                          resources: resources,
                          action: PermissionRequestResponseAction.GRANT);
                    },
                    onLoadStop: (controller, url) async {
                      pullToRefreshController.endRefreshing();
                      setState(() {
                        this.url = url.toString();
                        _textController.text = this.url;
                      });
                    },
                    onLoadError: (controller, url, code, message) {
                      pullToRefreshController.endRefreshing();
                    },
                    onProgressChanged: (controller, progress) {
                      if (progress == 100) {
                        pullToRefreshController.endRefreshing();
                      }
                      setState(() {
                        this.progress = progress / 100;
                        _textController.text = url;
                      });
                    },
                    onUpdateVisitedHistory: (controller, url, androidIsReload) {
                      setState(() {
                        this.url = url.toString();
                        _textController.text = this.url;
                      });
                    },
                  ),
                  progress < 1.0
                      ? LinearProgressIndicator(value: progress)
                      : Container(),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _loadUrl();
          // _loadLocalUrl();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  // void _loadLocalUrl() {
  //   _webViewController.loadUrl(
  //     urlRequest: URLRequest(url: Uri.parse("http://dsf.local"))
  //   );
  // }

  void _loadUrl() {
    _webViewController.loadUrl(
        urlRequest: URLRequest(url: Uri.parse("https://github.com")));
  }

// void _openRealBrowser() {
//   _chromeSafariBrowser.open(url: Uri.parse("https://yandex.ru"));
// }
}
