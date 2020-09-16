import 'package:flutter/material.dart';
import 'package:homeate/helper/configuration_helper.dart';
import 'package:homeate/helper/database_helper.dart';
import 'package:sqflite/sqflite.dart';
import '../bloc.navigation_bloc/navigation_bloc.dart';

final dbHelper = DatabaseHelper.instance;
final ConfigurationHelper configurationHelper = new ConfigurationHelper();
String _authToken = configurationHelper.authTokenData;
String _serverUrl = configurationHelper.authUrlData;

class ConfigurePage extends StatelessWidget with NavigationStates {
  TextEditingController authTokenTextController = new TextEditingController();
  TextEditingController urlTextController = new TextEditingController();

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
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: new Theme(
                          data: new ThemeData(
                            primaryColor: Color(0xFF1BB5FD),
                            primaryColorDark: Color(0xFF262AAA),
                          ),
                          child: Center(
                            child: Text(
                              "Token: $_authToken",
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: new Theme(
                          data: new ThemeData(
                            primaryColor: Color(0xFF1BB5FD),
                            primaryColorDark: Color(0xFF262AAA),
                          ),
                          child: Center(
                            child: Text(
                              "Server URL: $_serverUrl",
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
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
                            suffixText: ' ',
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
                            suffixText: 'URL',
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
                          onPressed: () => insert(),
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

//Database Insertion
  insert() async {
    // get a reference to the database
    // because this is an expensive operation we use async and await
    Database db = await dbHelper.database;

    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.columnAuthentication: authTokenTextController.text,
      DatabaseHelper.columnServerUrl: urlTextController.text
    };

    // do the insert and get the id of the inserted row
    int id = await db.insert(DatabaseHelper.table, row);

    // show the results: print all rows in the db
    print(await db.query(DatabaseHelper.table));
  }

  // Future<List> getTokenAuth() async {
  //   var tokenAuthData = await dbHelper.query();
  //   print("Inside Splashscreen: $tokenAuthData");

  //   return tokenAuthData;
  // }
}
