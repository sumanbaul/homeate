import 'package:flutter/material.dart';
import 'database_helper.dart';

abstract class ConfigurationHelperBase {
  @protected
  String authToken;
  @protected
  String authUrl;
  String get authTokenData => authToken;
  String get authUrlData => authUrl;

  void setStateAuthUrl(String _auth, String _url) {
    authToken = _auth;
    authUrl = _url;
  }
}

class ConfigurationHelper extends ConfigurationHelperBase {
  static final ConfigurationHelper _instance = ConfigurationHelper._internal();
  final dbHelper = DatabaseHelper.instance;

  factory ConfigurationHelper() {
    return _instance;
  }

  ConfigurationHelper._internal() {
    // authToken = "_authToken";
    // authUrl = "_authUrl";
    // print(authToken + " ; " + authUrl);
  }
}
