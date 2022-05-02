import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../providers/userDataProvider.dart';

class AuthApis {
  var url = Uri.parse("https://cognito-idp.ap-south-1.amazonaws.com/");
//login api
  Future<int> login(email, password, context) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
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
          data['AuthenticationResult']['AccessToken'],
          data['AuthenticationResult']['RefreshToken'],
          data['AuthenticationResult']['IdToken']);
      _preferences.setString(
          'IdToken', data['AuthenticationResult']['IdToken']);
      _preferences.setString(
          'Accesstoken', data['AuthenticationResult']['AccessToken']);
    } else {
      print(res.statusCode);
      print(res.body);
    }
    print(Provider.of<UserDataProvider>(context, listen: false)
        .user
        .refreshToken);
    print(
        Provider.of<UserDataProvider>(context, listen: false).user.accessToken);
    return res.statusCode;
  }
//signup api
  Future<int> signUp(name, email, pass, phone, atCode, context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

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
    if (res.statusCode == 200) {
      prefs.setString(atCode, email);
      login(email, pass, context);
    }
    print(res.body);
    return res.statusCode;
  }
//email vf code api
  Future<int> emailVerification(email, code, context) async {
    SharedPreferences  prefs = await SharedPreferences.getInstance();
    String atCode = prefs.getString(email) as String;
    var header = {
      "x-amz-target": "AWSCognitoIdentityProviderService.ConfirmSignUp",
      "Content-Type": "application/x-amz-json-1.1",
    };
    var loginObj = {
      "ClientId": "4mub1p0sfubl9ag7i7j1m7l09l",
      "ClientMetadata": {"act": atCode, "s": "d"},
      "ConfirmationCode": code,
      "Username": email,
    };
    var res = await http.post(
      url,
      headers: header,
      body: json.encode(loginObj),
    );
    if (res.statusCode == 200) {
      portalApi(10, context);
      phoneVerificationInitiator(context);
    }

    return res.statusCode;
  }
  //portal api

  portalApi(reqType, context) async {
    String auth = "Bearer " +
        Provider.of<UserDataProvider>(context, listen: false).user.accessToken;

    var header = {
      "Content-Type": "text/plain",
      "Authorization": auth,
    };

    var res = await http.post(url, headers: header, body: reqType);
  }
// send otp api
  Future<int> phoneVerificationInitiator(context) async {
    var header = {
      "x-amz-target":
          "AWSCognitoIdentityProviderService.GetUserAttributeVerificationCode",
      "Content-Type": "application/x-amz-json-1.1",
    };
    var loginObj = {
      "AccessToken": Provider.of<UserDataProvider>(context)
          .user
          .accessToken, // pass access Token here
      "AttributeName": "phone_number",
    };
    var res = await http.post(
      url,
      headers: header,
      body: json.encode(loginObj),
    );
    return res.statusCode;
  }
//confirm otp api
  Future<int> phoneVerificationConfirmation(context, code) async {
    var header = {
      "x-amz-target": "AWSCognitoIdentityProviderService.VerifyUserAttribute",
      "Content-Type": "application/x-amz-json-1.1",
    };
    var loginObj = {
      "AccessToken": Provider.of<UserDataProvider>(context).user.accessToken,
      "AttributeName": "phone_number",
      "Code": code,
    };
    var res = await http.post(
      url,
      headers: header,
      body: json.encode(loginObj),
    );
    if (res.statusCode == 200) {
      portalApi(10, context);
    }

    return res.statusCode;
  }
//refresher token api
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
    print(Provider.of<UserDataProvider>(context, listen: false)
        .user
        .refreshToken);
    return res.statusCode;
  }
}
