// @dart=2.9
import 'package:flutter/material.dart';
import 'helper.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CrimeModel> crimes = List<CrimeModel>();

  getCrimeFromSheet() async {
    var raw = await http.get(Uri.parse(
        "https://script.google.com/macros/s/AKfycbxsza-Pke6nvnjoHsOpuSROjuvDix1usZ-SvabQVd9RPzKdQJsVqU5rXc3X4zJm_jwk/exec"));

    var jsonCrime = convert.jsonDecode(raw.body);
    print('this is json Crime $jsonCrime');

    // feedbacks = jsonFeedback.map((json) => FeedbackModel.fromJson(json));

    jsonCrime.forEach((element) {
      print('$element THIS IS NEXT>>>>>>>');
      CrimeModel crimeModel = new CrimeModel();
      // feedbackModel.name = element['name'];
      // feedbackModel.feedback = element['feedback'];
      // feedbackModel.profilePic = element['profile_pic'];
      // feedbackModel.source = element['source'];
      // feedbackModel.sourceUrl = element["source_url"];
      crimeModel.incidentdate = element['incidentdate'];
      crimeModel.reportdate = element['reportdate'];
      crimeModel.incidentid = element['incidentid'];
      crimeModel.penalcode = element['penalcode'];
      crimeModel.crimes = element['crimes'];
      crimeModel.incidentdescription = element['incidentdescription'];
      crimeModel.policedistrict = element['policedistrict'];
      crimeModel.latitude = element['latitude'];
      crimeModel.longitude = element['longitude'];
      crimeModel.incidenttime = element['incidenttime'];
      crimeModel.reporttime = element['reporttime'];

      crimes.add(crimeModel);
    });

    //print('${feedbacks[0]}');
  }

  @override
  void initState() {
    getCrimeFromSheet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crimes"),
        elevation: 0,
      ),
      body: Container(
        child: ListView.builder(
            itemCount: crimes.length,
            itemBuilder: (context, index) {
              return CrimeTile(
                incidentdate: crimes[index].incidentdate,
                reportdate: crimes[index].reportdate,
                incidentid: crimes[index].incidentid,
                penalcode: crimes[index].penalcode,
                crimes: crimes[index].crimes,
                incidentdescription: crimes[index].incidentdescription,
                policedistrict: crimes[index].policedistrict,
                latitude: crimes[index].latitude,
                longitude: crimes[index].longitude,
                incidenttime: crimes[index].incidenttime,
                reporttime: crimes[index].reporttime,
              );
            }),
      ),
    );
  }
}

class CrimeTile extends StatelessWidget {
  final String incidentdate,
      reportdate,
      incidentid,
      penalcode,
      crimes,
      incidentdescription,
      policedistrict,
      latitude,
      longitude,
      incidenttime,
      reporttime;

  CrimeTile({
    this.incidentdate,
    this.reportdate,
    this.incidentid,
    this.penalcode,
    this.crimes,
    this.incidentdescription,
    this.policedistrict,
    this.latitude,
    this.longitude,
    this.incidenttime,
    this.reporttime,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(height: 40, width: 40, child: Text('$policedistrict')),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(penalcode),
                  Text(
                    'from $crimes',
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              )
            ],
          ),
          SizedBox(height: 16),
          Text(incidentdescription)
        ],
      ),
    );
  }
}
