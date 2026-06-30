import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:express3/utils/Ext1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {

  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  TextEditingController tec1=TextEditingController();
  TextEditingController tec2=TextEditingController();
  bool isL=false;
  bool obscure=true;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        onWillPopExit();
        return false;
      },
      child: Scaffold(
        backgroundColor: kc2,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: ListView(
                shrinkWrap: true,
                children: [

                  const Text('Bienvenue,',style: TextStyle(
                      color: kc1,
                      fontSize: 28,
                      fontWeight: FontWeight.w600
                  ),),
                  const Text('Connectez-vous pour continuer.',style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500
                  ),),

                  const SizedBox(height: 24,),

                  Container(
                    height: 48,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    width: double.infinity,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(0.4),
                    ),
                    child: 	TextFormField(
                      controller: tec1,
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: "Numéro de téléphone",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Stack(
                    children: [
                      Container(
                        height: 48,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        width: double.infinity,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.withOpacity(0.4),
                        ),
                        child: 	TextFormField(
                          controller: tec2,
                          cursorColor: Colors.black,
                          style: const TextStyle(color: Colors.black),
                          obscureText: obscure,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: "Mot de passe",
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        top: 0,
                        child: GestureDetector(
                          onTap: () {

                            setState(() {
                              obscure=!obscure;
                            });
                          },
                          child: Container(
                              color: Colors.transparent,
                              width: 46,
                              child: Center(child: Image.asset('$ks1${obscure?'eye1':'eye2'}.png',color: Colors.black,width: 24,))),
                        ),)
                    ],
                  ),
                  const SizedBox(height: 20,),
                  GestureDetector(
                    onTap: () => login(),
                    child: Container(
                      height: 48,
                      width: double.infinity,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: kc1,
                      ),
                      child: Center(
                        child: isL?SizedBox(
                          width: 30,
                          height: 30,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 4.0,
                          ),
                        ):Text(
                          'Se connecter', style: TextStyle(
                          color: kc2,
                          fontSize: 18,
                          fontWeight: FontWeight.w600
                        ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void login() async {

    if(tec1.text.isNotEmpty&&tec2.text.isNotEmpty) {
      String num=tec1.text.replaceAll(' ', '');

      if(num.length!=10) {

        Fluttertoast.showToast(
            msg: "Numéro erroné",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            fontSize: 16.0
        );
      } else {

        setState(() {
          isL=true;
        });

        FirebaseFirestore.instance.collection('users').doc(num).get().then((data) {

              setState(() {
                isL=false;
              });

              Map<String, dynamic>? rd = data.data();

              if((rd!['1']).toString()==tec2.text) {
                prefs?.setString('phone', num);
                prefs?.setString('store_name', (rd['2']).toString());
                prefs?.setString('sub_name', (rd['3']).toString());
                Navigator.of(context).pushNamed('/main');
              } else {

                Fluttertoast.showToast(
                    msg: "Échec",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    fontSize: 16.0
                );
              }
            }
        );
      }
    } else {

      Fluttertoast.showToast(
          msg: "Remplissez tous les champs, s'il vous plaît",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          fontSize: 16.0
      );
    }
  }
}