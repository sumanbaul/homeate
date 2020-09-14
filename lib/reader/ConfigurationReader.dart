import 'package:homeate/helper/database_helper.dart';

//const String _auth_token = "Zlr-WWo_afsWbW6vNiuL6nXKXC0DjzNz";
const String _authToken = "U4iKtD5QG0oQcmPJrf8LmPwo0YK8n2bl";
const String _serverUrl = "http://blynk-cloud.com";
//ApiUrlBuilder _init = new ApiUrlBuilder();

final dbHelper = DatabaseHelper.instance;

class ApiUrlBuilder {
  void getTokenAuth() async {
    var tokenAuthData = await dbHelper.query();
    print(tokenAuthData);
    //_authToken = tokenAuthData[1];
    //_serverUrl = tokenAuthData[2];
  }

  String getPinValue(String pin) {
    String url = _serverUrl + "/" + _authToken + "/get/" + pin;

    return url;
  }

  String writePinValueViaGet(String pin, int value) {
    String url = _serverUrl +
        "/" +
        _authToken +
        "/update/" +
        pin +
        "?value=" +
        value.toString();
    return url;
  }
}

// String query() async {
//   final allRows = await dbHelper.queryAllRows();
//   print('query only lastrow rows:');
//   allRows.forEach((row) => print(row));
//   String authToken, url = "";

//   authToken = allRows.elementAt(allRows.length)['columnAuthentication'];
//   url = allRows.elementAt(allRows.length)['columnServerUrl'];

//   print(authToken);
//   return
// }

// Future<List> query() async {
//   final allRows = await DatabaseHelper.instance.queryAllRows();
//   print('query all rows:');
//   allRows.forEach((row) => print(row));

//   var getValue = allRows.last.values.toList();
//   // authToken = getValue[1];
//   // url = getValue[2];
//   // url = allRows.elementAt(allRows.length)['columnServerUrl'];

//   return (getValue);
// }
