import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sso_example/app/features/autentication/controller/autentication_controller.dart';

class AutenticationPage extends StatelessWidget {
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
