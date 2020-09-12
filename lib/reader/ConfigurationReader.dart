const String _auth_token = "U4iKtD5QG0oQcmPJrf8LmPwo0YK8n2bl";
const String _serverUrl = "http://blynk-cloud.com";

class ApiUrlBuilder {
  String getPinValue(String pin) {
    String url = _serverUrl + "/" + _auth_token + "/get/" + pin;
    return url;
  }

  String writePinValueViaGet(String pin, int value) {
    String url = _serverUrl +
        "/" +
        _auth_token +
        "/update/" +
        pin +
        "?value=" +
        value.toString();
    return url;
  }
}
