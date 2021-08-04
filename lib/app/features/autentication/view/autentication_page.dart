import 'dart:html';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sso_example/app/features/autentication/controller/autentication_controller.dart';

class AutenticationPage extends StatefulWidget {
  @override
  _AutenticationPageState createState() => _AutenticationPageState();
}

class _AutenticationPageState extends State<AutenticationPage> {
  final IFrameElement _iframeElement = IFrameElement();

  Widget _iframeWidget;

  @override
  void initState() {
    super.initState();
    _iframeElement.height = '500';
    _iframeElement.width = '500';
    _iframeElement.src =
        'https://dev-43408951.okta.com/home/dev-43408951_estudosamlsso_1/0oa1e8wfguuOk3U6p5d7/aln1e8zzfrzcqKxYJ5d7';
    _iframeElement.style.border = 'none';
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'iframeElement',
      (int viewId) => _iframeElement,
    );
    _iframeWidget = HtmlElementView(
      key: UniqueKey(),
      viewType: 'iframeElement',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AutenticationController>(
        builder: (_, autenticationController, __) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ElevatedButton(
                onPressed: () async {
                  await autenticationController.authenticate();
                },
                child: Text("Login with SSO"),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 32,
                ),
                child: SizedBox(
                  height: 700,
                  width: 500,
                  child: _iframeWidget,
                ),
              ),
              if (autenticationController.state ==
                  AutenticationState.loading) ...[
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(),
                ),
              ],
              if (autenticationController.state ==
                  AutenticationState.error) ...[
                Text(autenticationController.errorMsg),
              ],
            ],
          ),
        ),
      );
    });
  }
}
