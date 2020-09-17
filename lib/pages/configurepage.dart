import 'package:flutter/material.dart';
import 'package:homeate/helper/configuration_helper.dart';
import 'package:homeate/helper/database_helper.dart';
import 'package:sqflite/sqflite.dart';
import '../bloc.navigation_bloc/navigation_bloc.dart';

final dbHelper = DatabaseHelper.instance;
final ConfigurationHelper configurationHelper = new ConfigurationHelper();
String _authToken = configurationHelper.authTokenData;
String _serverUrl = configurationHelper.authUrlData;

class ConfigurePage extends StatefulWidget with NavigationStates {
  @override
  _ConfigurePageState createState() => _ConfigurePageState();
}

class _ConfigurePageState extends State<ConfigurePage> {
  TextEditingController authTokenTextController = new TextEditingController();

  TextEditingController urlTextController = new TextEditingController();

  insert(BuildContext context) async {
    final scaffold = Scaffold.of(context);
    // get a reference to the database
    // because this is an expensive operation we use async and await
    Database db = await dbHelper.database;

    var _validate = validate(
        authTokenTextController.text.trim(), urlTextController.text.trim());

    if (_validate == null) {
      scaffold.showSnackBar(
        SnackBar(
          content: const Text('Values not correct'),
          action: SnackBarAction(
              label: 'CLOSE', onPressed: scaffold.hideCurrentSnackBar),
        ),
      );
    } else {
      // row to insert
      Map<String, dynamic> row = {
        DatabaseHelper.columnAuthentication: _validate[0],
        DatabaseHelper.columnServerUrl: _validate[1]
      };

      // do the insert and get the id of the inserted row
      int id = await db.insert(DatabaseHelper.table, row);

      // show the results: print all rows in the db
      print(await db.query(DatabaseHelper.table));

      //set token & url data as user hit save.
      configurationHelper.setStateAuthUrl(
          authTokenTextController.text.trim(), urlTextController.text.trim());

      scaffold.showSnackBar(
        SnackBar(
          content: const Text('Saved'),
          action: SnackBarAction(
              label: 'CLOSE', onPressed: scaffold.hideCurrentSnackBar),
        ),
      );

      //Update texts of current configuration
      setState(() {
        _authToken = authTokenTextController.text.trim();
        _serverUrl = urlTextController.text.trim();

        authTokenTextController.clear();
        urlTextController.clear();
      });
    }
  }

  List<String> validate(String _auth, String _url) {
    String auth = _auth.trim();
    String url = _url.trim();
    List<String> _validatedData = new List();

    if (auth == null && url == null) {
      return null;
    } else if (auth.length == 32 && Uri.parse(url).isAbsolute) {
      _validatedData.add(auth);
      _validatedData.add(url);
      return _validatedData;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(20),
                    child: Text('Configure',
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 28)),
                    color: Color(0x88D9E6FF),
                  )
                ],
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
                          width: 70.0,
                          child: new Theme(
                            data: new ThemeData(
                              primaryColor: Colors.blueGrey,
                              primaryColorDark: Color(0xFF262AAA),
                            ),
                            child: SelectableText(
                              "Token:",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: new Theme(
                            data: new ThemeData(
                              primaryColor: Color(0xFF1BB5FD),
                              primaryColorDark: Color(0xFF262AAA),
                            ),
                            child: SelectableText(
                              "$_authToken",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 0, 0, 10),
                          width: 70.0,
                          child: new Theme(
                            data: new ThemeData(
                              primaryColor: Colors.blueGrey,
                              primaryColorDark: Color(0xFF262AAA),
                            ),
                            child: SelectableText(
                              "URL:",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: new Theme(
                            data: new ThemeData(
                              primaryColor: Color(0xFF1BB5FD),
                              primaryColorDark: Color(0xFF262AAA),
                            ),
                            child: SelectableText(
                              "$_serverUrl",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                child: Center(
                  child: Column(children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: new Theme(
                        data: new ThemeData(
                          primaryColor: Color(0xFF1BB5FD),
                          primaryColorDark: Color(0xFF262AAA),
                        ),
                        child: TextField(
                          maxLength: 32,
                          controller: authTokenTextController,
                          decoration: InputDecoration(
                            border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.teal),
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(10.0),
                                )),
                            hintText: 'Enter Blynk Authentication Token',
                            helperText: 'Blynk authentication',
                            labelText: 'Blynk Authentication Token',
                            prefixIcon: const Icon(
                              Icons.code,
                              color: Colors.blueAccent,
                            ),
                            prefixText: ' ',
                            suffixIcon: IconButton(
                              onPressed: () => authTokenTextController.clear(),
                              icon: Icon(Icons.clear),
                            ),
                            suffixStyle:
                                const TextStyle(color: Color(0xFF1BB5FD)),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: new Theme(
                        data: new ThemeData(
                          primaryColor: Color(0xFF1BB5FD),
                          primaryColorDark: Color(0xFF1BB5FD),
                        ),
                        child: TextField(
                          controller: urlTextController,
                          decoration: InputDecoration(
                            border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.teal),
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(10.0),
                                )),
                            hintText: 'http://blynk-cloud.com',
                            helperText: 'Personal server or Blynk Cloud',
                            labelText: 'Blynk Server URL',
                            prefixIcon: const Icon(
                              Icons.code,
                              color: Colors.blueAccent,
                            ),
                            prefixText: ' ',
                            suffixIcon: IconButton(
                              onPressed: () => authTokenTextController.clear(),
                              icon: Icon(Icons.clear),
                            ),
                            suffixStyle:
                                const TextStyle(color: Color(0xFF1BB5FD)),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: SizedBox(
                        width: double.infinity,
                        child: RaisedButton.icon(
                          padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                          onPressed: () => insert(context),
                          elevation: 15,
                          label: Text('Save',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                          color: Color(0xFF262AAA),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(color: Colors.black12),
                          ),
                          icon: Icon(
                            Icons.save,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
