// @dart=2.9
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'class.dart';
import 'package:http/http.dart' as http;


class CrimeController {
  // Callback function to give response of status of current request.
  final void Function(String) callback;

  // Google App Script Web URL
  static const String URL = "https://script.google.com/macros/s/AKfycbzfNUisBNZ9O3wTAZq-THbODxYcrKXVyJMte3ViUoz8yA-2u5STPH0PjguYXgbk1ji-/exec";

  static const STATUS_SUCCESS = "SUCCESS";

  CrimeController(this.callback);

  void submitForm(CriminalForm criminalForm) async{
    try{
      await http.get(Uri.parse(URL + criminalForm.toParams())).then(
          (response){
            callback(convert.jsonDecode(response.body)['status']);
          });
    } catch(e){
      print(e);
    }
  }
}