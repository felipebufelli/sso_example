import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

enum AutenticationState { initial, loading, error, sucess }

class AutenticationController extends ChangeNotifier {
  AutenticationState _state = AutenticationState.initial;
  String errorMsg;

  set state(AutenticationState value) {
    _state = value;
    notifyListeners();
  }

  AutenticationState get state => _state;

  String identityProviderURL =
      "https://dev-43408951.okta.com/app/dev-43408951_estudosamlsso_1/exk1e8wfgtEGIt6iI5d7/sso/saml";
  String identityProviderIssuer = "http://www.okta.com/exk1e8wfgtEGIt6iI5d7";
  String certificate =
      "MIIDqDCCApCgAwIBAgIGAXsH0FUgMA0GCSqGSIb3DQEBCwUAMIGUMQswCQYDVQQGEwJVUzETMBEGA1UECAwKQ2FsaWZvcm5pYTEWMBQGA1UEBwwNU2FuIEZyYW5jaXNjbzENMAsGA1UECgwET2t0YTEUMBIGA1UECwwLU1NPUHJvdmlkZXIxFTATBgNVBAMMDGRldi00MzQwODk1MTEcMBoGCSqGSIb3DQEJARYNaW5mb0Bva3RhLmNvbTAeFw0yMTA4MDIxNzAwMzhaFw0zMTA4MDIxNzAxMzhaMIGUMQswCQYDVQQGEwJVUzETMBEGA1UECAwKQ2FsaWZvcm5pYTEWMBQGA1UEBwwNU2FuIEZyYW5jaXNjbzENMAsGA1UECgwET2t0YTEUMBIGA1UECwwLU1NPUHJvdmlkZXIxFTATBgNVBAMMDGRldi00MzQwODk1MTEcMBoGCSqGSIb3DQEJARYNaW5mb0Bva3RhLmNvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAIaRmcoV/ookR9X0R1n0H1X9FIfEFo11r8b63ybrMxYjdeQq8D5ZgH9dOaNnApYZtpldvCTYm7zL14CaJDBz/YecLMgHweBe/+JN6hW2xp1siamaLgQgxatNYekX+ilDlo8Cy2W3JxejgnAJ9Qwn3/bkerjGkaC+mSUprsTFQvLAcKnkQYsz8jur8qplvZdEia/M3OvjN8c+UVOmPvre6iYxeeDAa+H1BVlU6HwHSLxVDnWYdzF4dtywlYL2F9WstX86ihawWX5xvzjGpC82DTYHx9g/8aegS+6E1WGOw9Ten4ZEZBYKSuqK+Y7X5P+bL9h6K7o+6yC+M9EANr1yhNUCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAQcPJnLgqF7yBNRJFey7LG9qRYjRNDDiOqTfLFAfJj8bQd3WHmDZ6lajwOPCtfIbsrGlrfGcY/7SJrsDcHHj6SIe1+AgwPkIy0nxSL++iJ9LOixc1qMCl9jSIi5Thk5NYgWCpLQSINSGEN7Ted81T4c8QCynjrOg0iaoNYoZQoTmtqOzSXvKt/k1Hy18Dr+KlkmM/8PqkxTP4QFQ3VypXKU+dfQQrxfSMLG4aes4DqhRQzxK650KdxrAuZBApFGklSThFHDaR2gfHt7/NwN9JlOicCtePtlUjEOxKf0jnsGNG3yCOQEpRUZbTR4umEn0bSxgTgAcjx8W9evPeHNMCMg=="
      "";

  Future<void> authenticate() async {
    try {
      state = AutenticationState.loading;
      final http.Response response = await http.get(
        Uri.parse(
          identityProviderURL,
        ),
      );
      debugPrint(response.body);
      state = AutenticationState.sucess;
    } catch (e) {
      debugPrint("Autentication Error: $e");
      errorMsg = "Autentication Error: $e";
      state = AutenticationState.error;
    }
  }
}
