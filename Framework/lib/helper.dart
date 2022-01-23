// @dart=2.9
class CrimeModel {
 String incidentdate;
 String reportdate;
 String incidentid;
 String penalcode;
 String crimes;
 String incidentdescription;
 String policedistrict;
 String latitude;
 String longitude;
 String incidenttime;
 String reporttime;

  CrimeModel(
      {
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
        }
        );

  factory CrimeModel.fromJson(dynamic json) {
    return CrimeModel(
      // feedback: "${json['feedback']}",
      // name: "${json['name']}",
      // profilePic: "${json['profile_pic']}",
      // source: "${json['source']}",
      // sourceUrl: "${json['source_url']}",
 incidentdate: "${json['incidentdate']}",
 reportdate: "${json['reportdate']}",
 incidentid: "${json['incidentid']}",
 penalcode: "${json['penalcode']}",
 crimes: "${json['crimes']}",
 incidentdescription: "${json['inidentdescription']}",
 policedistrict: "${json['policedistrict']}",
 latitude: "${json['latitude']}",
 longitude: "${json['longitude']}",
 incidenttime: "${json['incidenttime']}",
 reporttime: "${json['reporttime']}",
    );
  }

  Map toJson() => {
        // "profile_pic": profilePic,
        // "source": source,
        // "source_url": sourceUrl,
        // "name": name,
        // "feedback": feedback
        "incidentdate" : incidentdate,
        "reportdate" : reportdate,
        "incidentid" : incidentid,
        "penalcode" : penalcode,
        "crimes" : crimes,
        "incidentdescription" : incidentdescription,
        "policedistrict" : policedistrict,
        "latitude" : latitude,
        "longitude" : longitude,
        "incidenttime" : incidenttime,
        "reporttime" : reporttime,
      };
}
//  incidentdate
//  reportdate
//  incidentid
//  penalcode
//  crimes
//  inidentdescription
//  policedistrict
//  latitude
//  longitude
//  incidenttime
//  reporttime

 