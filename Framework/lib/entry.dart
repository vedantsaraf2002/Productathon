import 'package:flutter/material.dart';
import 'package:hackathon2/fetch.dart';
import 'form.dart';
import 'map.dart';
import 'package:url_launcher/url_launcher.dart';

class Entry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crime Mapping Tool'),
      ),
      body: Container(
        // constraints: BoxConstraints.expand(),
        // decoration: BoxDecoration(
        //     image: DecorationImage(
        //         image: AssetImage("assets/images/bgimage.png"),
        //         fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Padding(padding: EdgeInsets.only(top: 20.0)),
              // Center(
              //   child: Container(
              //     child: Image.asset('assets/images/ukpolicelogo.png'),
              //   ),
              // ),
              Padding(padding: EdgeInsets.fromLTRB(0, 20.0, 0, 30.0)),
              Column(
                children: <Widget>[
                  RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyHomePage()),
                      );
                    },
                    child: Text('FIR Entry'),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 10.0)),
                  RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () {
                      launch('https://op1-original-map.herokuapp.com/');
                    },
                    child: Text('View Map'),
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: <Widget>[
                  //     RaisedButton(
                  //       color: Colors.blue,
                  //       textColor: Colors.white,
                  //       onPressed: () {
                  //         launch('https://theft-filter-op.herokuapp.com/');
                  //       },
                  //       child: Text('Theft Filter'),
                  //     ),
                  //     Padding(padding: EdgeInsets.only(right: 20.0)),
                  //     RaisedButton(
                  //       color: Colors.blue,
                  //       textColor: Colors.white,
                  //       onPressed: () {
                  //         launch('https://cyber-crime-filter-op.herokuapp.com/');
                  //       },
                  //       child: Text('Cyber Crime Filter'),
                  //     ),
                  //   ],
                  // ),
                  Container(
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.blueAccent, width: 5.0)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FlatButton(
                            onPressed: () {},
                            child: Text('SPECIAL MAP ANALYSIS')),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            RaisedButton(
                              color: Colors.blue,
                              textColor: Colors.white,
                              onPressed: () {
                                launch(
                                    'https://marker-cluster-op2.herokuapp.com/');
                              },
                              child: Text('Cluster Map'),
                            ),
                            Padding(padding: EdgeInsets.only(right: 20.0)),
                            RaisedButton(
                              color: Colors.blue,
                              textColor: Colors.white,
                              onPressed: () {
                                launch(
                                    'https://heatmap-time-op3.herokuapp.com/');
                              },
                              child: Text('Heat Map'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent, width: 5.0)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FlatButton(
                        onPressed: () {}, child: Text('District Wise Map')),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                          color: Colors.blue,
                          textColor: Colors.white,
                          onPressed: () {
                            launch(
                                'https://dehradun-map-filter-op.herokuapp.com/');
                          },
                          child: Text('Dehradun Map'),
                        ),
                        Padding(padding: EdgeInsets.only(right: 20.0)),
                        RaisedButton(
                          color: Colors.blue,
                          textColor: Colors.white,
                          onPressed: () {
                            launch(
                                'https://haridwar-map-filter-op.herokuapp.com/');
                          },
                          child: Text('Haridwar Map'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent, width: 5.0)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FlatButton(onPressed: () {}, child: Text('Crime Wise Map')),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                          color: Colors.blue,
                          textColor: Colors.white,
                          onPressed: () {
                            launch(
                                'https://dehradun-map-filter-op.herokuapp.com/');
                          },
                          child: Text('Theft Map'),
                        ),
                        Padding(padding: EdgeInsets.only(right: 20.0)),
                        RaisedButton(
                          color: Colors.blue,
                          textColor: Colors.white,
                          onPressed: () {
                            launch(
                                'https://haridwar-map-filter-op.herokuapp.com/');
                          },
                          child: Text('Cyber Crime Map'),
                        ),
                        Padding(padding: EdgeInsets.only(right: 20.0)),
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 10.0)),
                    RaisedButton(
                      color: Colors.blue,
                      textColor: Colors.white,
                      onPressed: () {
                        launch('https://haridwar-map-filter-op.herokuapp.com/');
                      },
                      child: Text('Murder Map'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
