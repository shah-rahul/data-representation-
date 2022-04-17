import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../providers/userDataProvider.dart';

class AuthApis {
  var url = Uri.parse("https://cognito-idp.ap-south-1.amazonaws.com/");

  Future<int> login(email, password, context) async {
    var header = {
      "x-amz-target": "AWSCognitoIdentityProviderService.InitiateAuth",
      "Content-Type": "application/x-amz-json-1.1",
    };
    var loginObj = {
      "AuthFlow": "USER_PASSWORD_AUTH",
      "AuthParameters": {
        "PASSWORD": password,
        "USERNAME": email,
      },
      "ClientId": "4mub1p0sfubl9ag7i7j1m7l09l"
    };
    var res = await http.post(
      url,
      headers: header,
      body: json.encode(loginObj),
    );
    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      Provider.of<UserDataProvider>(context, listen: false).setAuthDetails(
          data['AuthenticationResult']['RefreshToken'],
          data['AuthenticationResult']['IdToken']);
    }
    print(Provider.of<UserDataProvider>(context, listen: false)
        .user
        .refreshToken);
    print(Provider.of<UserDataProvider>(context, listen: false).user.idToken);
    return res.statusCode;
  }

  Future<int> signUp(name, email, pass, phone, atCode) async {
    var header = {
      "x-amz-target": "AWSCognitoIdentityProviderService.SignUp",
      "Content-Type": "application/x-amz-json-1.1",
    };
    var loginObj = {
      "ClientId": "4mub1p0sfubl9ag7i7j1m7l09l",
      "Password": pass,
      "Username": email,
      "ClientMetadata": {"act": atCode, "s": "d"},
      "UserAttributes": [
        {"Name": "name", "Value": name},
        {"Name": "phone_number", "Value": phone},
      ],
    };

    var res = await http.post(
      url,
      headers: header,
      body: json.encode(loginObj),
    );
    if (res.statusCode == 200) {}
    print(res.body);
    return res.statusCode;
  }

  Future<int> tokenRefresher(context) async {
    var header = {
      "x-amz-target": "AWSCognitoIdentityProviderService.InitiateAuth",
      "Content-Type": "application/x-amz-json-1.1",
    };
    var loginObj = {
      "AuthFlow": "REFRESH_TOKEN",
      "AuthParameters": {
        "REFRESH_TOKEN": Provider.of<UserDataProvider>(context, listen: false)
            .user
            .refreshToken,
      },
      "ClientMetadata": {"s": "d"},
      "ClientId": "4mub1p0sfubl9ag7i7j1m7l09l",
    };
    var res = await http.post(
      url,
      headers: header,
      body: json.encode(loginObj),
    );
    if (res.statusCode == 200) {
      var data = json.decode(res.body);

      Provider.of<UserDataProvider>(context, listen: false).setRefreshToken(
        data['AuthenticationResult']['AccessToken'],
      );
    }
    print(Provider.of<UserDataProvider>(context, listen:  false).user.refreshToken);
    return res.statusCode;
  }
}
