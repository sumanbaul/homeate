import 'package:flutter/material.dart';

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
  factory ConfigurationHelper() {
    return _instance;
  }

  ConfigurationHelper._internal() {
    //default fallback
    authToken = "U4iKtD5QG0oQcmPJrf8LmPwo0YK8n2bl";
    authUrl = "http://blynk-cloud.com";
  }
}
