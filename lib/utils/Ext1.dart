import 'dart:io';
import 'package:express3/core/models/wilaya.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Ext2.dart';

const ks0='V2.1.2';
const ks1="assets/icons/";
const ks2="assets/images/";
const ks3="https://swift.ecotrack.dz";
const ks4="hZjN0yPuVPJm0GKyZxPnsuBsTdUQEn5n6abJJz7lz0WMIMY7XUVq5ZBEp96H";
const ks5="https://medexpress.ecotrack.dz";
const ks6="rgmtoVKWPZykQqkF5a45eaVNCGqsNF4yAjHtytWNZiWM2W0Pn19yvuBjZhLk";
const kc1=Color(0xFF0E65F0);
const kc2=Color(0xFFF4F7FC);

int cp=0;

SharedPreferences? prefs;

DateTime? backButtonPressedTime;

Future<bool> onWillPopExit() async {
  DateTime currentTime = DateTime.now();

  bool backButton = backButtonPressedTime == null || currentTime.difference(backButtonPressedTime??currentTime) > const Duration(seconds: 2);

  if(backButton) {
    backButtonPressedTime = currentTime;

    Fluttertoast.showToast(
        msg: "Veuillez cliquer à nouveau pour quitter",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        fontSize: 16.0
    );
  } else exit(0);
  return false;
}

String getPerfectSt(String? s1,String s2) {
  return s1??s2.toString();
}

List<wilaya> LW() {
  List<wilaya> L=[];
  LWS.sort((a,b) {
    return a.s1.compareTo(b.s1);
  });
  return LWS;
}
