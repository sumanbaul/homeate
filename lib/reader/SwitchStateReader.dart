import 'dart:convert';
import 'package:http/http.dart' as http;

class SwtichStateReader {
  //Get PIN State
  Future<List> getBtnState(String pinState, String btnActiveText,
      btnInActiveText, int btnActiveColor, int btnInActiveColor) async {
    var returnObject = new List(3);

    if (pinState != null) {
      final response = await http.get(pinState);
      var readValue = json.decode(response.body);

      if (int.parse(readValue[0]) == 1) {
        returnObject[0] = readValue[0];
        returnObject[1] = btnActiveText;
        returnObject[2] = btnActiveColor;
      } else {
        returnObject[0] = readValue[0];
        returnObject[1] = btnInActiveText;
        returnObject[2] = btnInActiveColor;
      }
    }

    return returnObject;
  }

  //Change PIN State
  Future<http.Response> btnSwitch(String pinState,String pinActive, String pinInActive) async {
    final response = await http
        .get(pinState);

    var readValue = json.decode(response.body);

    print(int.parse(readValue[0]));

    if (int.parse(readValue[0]) == 1) {
      await http.get(
          pinInActive);
    } else {
      await http.get(
          pinActive);
    }

    return response;
  }
}
