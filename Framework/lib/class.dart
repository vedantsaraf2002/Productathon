// @dart=2.9
class CriminalForm {

  String _incidentdate;
  String _reportdate;
  String _incidentid;
  String _penalcode;
  String _crimes;
  String _incidentdescription;
  String _resolution;
  String _policedistrict;
  String _latitude;
  String _longitude;
  String _incidenttime;
  String _reporttime;

  CriminalForm(this._incidentdate,this._reportdate,this._incidentid,this._penalcode,this._crimes,this._incidentdescription,this._resolution,this._policedistrict,this._latitude,this._longitude,this._incidenttime,this._reporttime);

  // Method to make GET parameters.
  String toParams() =>
      "?incidentdate=$_incidentdate&reportdate=$_reportdate&incidentid=$_incidentid&penalcode=$_penalcode&crimes=$_crimes&incidentdescription=$_incidentdescription&resolution=$_resolution&policedistrict=$_policedistrict&latitude=$_latitude&longitude=$_longitude&incidenttime=$_incidenttime&reporttime=$_reporttime";

}