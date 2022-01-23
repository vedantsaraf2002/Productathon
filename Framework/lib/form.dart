// @dart=2.9
import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'controller.dart';
import 'class.dart';
import 'assets.dart';
import 'entry.dart';
import 'package:intl/intl.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  @override
  void initState() {
    incidentdateController.text = "";
    reportdateController.text = "";
    //set the initial value of text field
    super.initState();
  }

  int counter = 0;
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  // TextField Controllers
  TextEditingController incidentdateController = TextEditingController();
  TextEditingController reportdateController = TextEditingController();
  TextEditingController incidentidController = TextEditingController();
  TextEditingController penalcodeController = TextEditingController();
  TextEditingController crimesController = TextEditingController();
  TextEditingController incidentdescriptionController = TextEditingController();
  TextEditingController resolutionController = TextEditingController();
  TextEditingController policedistrictController = TextEditingController();
  TextEditingController latitudeController = TextEditingController();
  TextEditingController longitudeController = TextEditingController();
  TextEditingController incidenttimeController = TextEditingController();
  TextEditingController reporttimeController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState.validate()) {
      CriminalForm criminalForm = CriminalForm(
        incidentdateController.text,
        reportdateController.text,
        incidentidController.text,
        penalcodeController.text,
        crimesController.text,
        incidentdescriptionController.text,
        resolutionController.text,
        policedistrictController.text,
        latitudeController.text,
        longitudeController.text,
        incidenttimeController.text,
        reporttimeController.text,
      );

      CrimeController crimeController = CrimeController((String response) {
        print("Response: $response");
        if (response == CrimeController.STATUS_SUCCESS) {
          //
          _showSnackbar("Record Submitted");
          setState(() {
            counter++;
          });
          _formKey.currentState.reset();
        } else {
          _showSnackbar("Error Occurred!");
        }
      });

      _showSnackbar("Submitting Record");

      // Submit 'feedbackForm' and save it in Google Sheet

      crimeController.submitForm(criminalForm);
    }
  }

  // Method to show snackbar with 'message'.
  _showSnackbar(String message) {
    final snackBar = SnackBar(content: Text(message));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 50, horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Image.asset('assets/images/copbadge.png'),
                ),
                Padding(padding: EdgeInsets.only(top: 10.0)),
                Text(
                  'RECORD NO : $counter',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 10.0)),
                Container(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.all(15.0),
                          padding: const EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.blueAccent, width: 5.0)),
                          child: Column(
                            children: <Widget>[
                              FlatButton(
                                  onPressed: () {},
                                  child: Text('DATE AND TIME')),
                              TextFormField(
                                controller: incidentdateController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Enter Valid DATE";
                                  }
                                  return null;
                                },
                                decoration:
                                    InputDecoration(labelText: "Incident Date"),
                                onTap: () async {
                                  DateTime pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(
                                          2000), //DateTime.now() - not to allow to choose before today.
                                      lastDate: DateTime(2101));
                                  if (pickedDate != null) {
                                    //pickedDate output format => 2021-03-10 00:00:00.000
                                    String formattedDate =
                                        DateFormat('yyyy/MM/dd')
                                            .format(pickedDate);
                                    //formatted date output using intl package =>  2021-03-16
                                    //you can implement different kind of Date Format here according to your requirement

                                    setState(() {
                                      incidentdateController.text =
                                          formattedDate; //set output date to TextField value.
                                    });
                                  }
                                  ;
                                },
                              ),
                              TextFormField(
                                controller: incidenttimeController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Enter Valid Name";
                                  }
                                  return null;
                                },
                                decoration:
                                    InputDecoration(labelText: "Incident Time"),
                              ),
                              TextFormField(
                                controller: reportdateController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Enter Valid Email";
                                  }
                                  return null;
                                },
                                decoration:
                                    InputDecoration(labelText: "Report Date"),
                                onTap: () async {
                                  DateTime pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(
                                          2000), //DateTime.now() - not to allow to choose before today.
                                      lastDate: DateTime(2101));
                                  if (pickedDate != null) {
                                    //pickedDate output format => 2021-03-10 00:00:00.000
                                    String formattedDate =
                                        DateFormat('yyyy/MM/dd')
                                            .format(pickedDate);
                                    //formatted date output using intl package =>  2021-03-16
                                    //you can implement different kind of Date Format here according to your requirement

                                    setState(() {
                                      reportdateController.text =
                                          formattedDate; //set output date to TextField value.
                                    });
                                  }
                                  ;
                                },
                              ),
                              TextFormField(
                                controller: reporttimeController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Enter Valid Name";
                                  }
                                  return null;
                                },
                                decoration:
                                    InputDecoration(labelText: "Report Time"),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(15.0),
                          padding: const EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.redAccent, width: 5.0)),
                          child: Column(
                            children: <Widget>[
                              FlatButton(
                                  onPressed: () {},
                                  child: Text('CRIME DETAILS')),
                              TextFormField(
                                controller: incidentidController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Enter Valid Phone Number";
                                  }
                                  return null;
                                },
                                decoration:
                                    InputDecoration(labelText: "Incident ID"),
                              ),
                              TextFormField(
                                controller: penalcodeController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Enter Valid Feedback";
                                  }
                                  return null;
                                },
                                decoration:
                                    InputDecoration(labelText: "Penal Code"),
                              ),
                              TextFormField(
                                controller: crimesController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Enter Valid Name";
                                  }
                                  return null;
                                },
                                decoration:
                                    InputDecoration(labelText: "Crimes"),
                              ),
                              TextFormField(
                                controller: incidentdescriptionController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Enter Valid Name";
                                  }
                                  return null;
                                },
                                decoration:
                                    InputDecoration(labelText: "Description"),
                              ),
                              TextFormField(
                                controller: resolutionController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Enter Valid Name";
                                  }
                                  return null;
                                },
                                decoration:
                                    InputDecoration(labelText: "Resolution"),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(15.0),
                          padding: const EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.blueAccent, width: 5.0)),
                          child: Column(
                            children: <Widget>[
                              FlatButton(
                                  onPressed: () {},
                                  child: Text('THANA DETAILS')),
                              TextFormField(
                                controller: policedistrictController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Enter Valid Name";
                                  }
                                  return null;
                                },
                                decoration:
                                    InputDecoration(labelText: "District"),
                              ),
                              TextFormField(
                                //controller: policedistrictController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Enter Valid Name";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    labelText: "Police Station"),
                              ),
                              TextFormField(
                                controller: latitudeController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Enter Valid Name";
                                  }
                                  return null;
                                },
                                decoration:
                                    InputDecoration(labelText: "Latitude"),
                              ),
                              TextFormField(
                                controller: longitudeController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Enter Valid Name";
                                  }
                                  return null;
                                },
                                decoration:
                                    InputDecoration(labelText: "Longitude"),
                              ),
                            ],
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 10.0)),
                        RaisedButton(
                          color: Colors.blue,
                          textColor: Colors.white,
                          onPressed: _submitForm,
                          child: Text('Submit Record'),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
