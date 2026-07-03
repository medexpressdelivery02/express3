import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:express3/utils/Ext1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddSenderScreen extends StatefulWidget {

  const AddSenderScreen({super.key});

  @override
  State<StatefulWidget> createState() => _AddSenderScreen();
}

class _AddSenderScreen extends State<AddSenderScreen> {
  TextEditingController tec1=TextEditingController();
  TextEditingController tec2=TextEditingController();
  TextEditingController tec3=TextEditingController();
  TextEditingController tec4=TextEditingController();
  TextEditingController tec5=TextEditingController();
  TextEditingController tec6=TextEditingController();
  bool obscure=true;
  bool isL=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kc2,
      body: SafeArea(
        child: Column(
          children: [

            Padding(
              padding: EdgeInsetsGeometry.fromLTRB(12, 8, 12, 8),
              child: Row(
                children: [

                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 28,height: 28,
                      color: Colors.transparent,
                      child: Image.asset(ks1+'back.png',color: Colors.black,fit: BoxFit.cover,),
                    ),
                  ),

                  SizedBox(width: 4,),

                  Text(
              'Ajouter un expéditeur', style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w600
                      ),
                      ),
                ],
              ),
            ),

              Expanded(
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: ListView(
                        padding: EdgeInsetsGeometry.symmetric(horizontal: 16,vertical: 4),
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
                              controller: tec1,
                              cursorColor: Colors.black,
                              style: const TextStyle(color: Colors.black),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintText: "Nom du representant * ",
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),

                          const SizedBox(height: 12,),

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
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintText: "Nom commercial de l'expéditeur * ",
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),

                          const SizedBox(height: 12,),

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
                              controller: tec6,
                              cursorColor: Colors.black,
                              style: const TextStyle(color: Colors.black),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintText: "Sous-nom * ",
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),

                          const SizedBox(height: 12,),

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
                              controller: tec3,
                              cursorColor: Colors.black,
                              keyboardType: TextInputType.number,
                              style: const TextStyle(color: Colors.black),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintText: "Téléphone *",
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),

                          const SizedBox(height: 12,),

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
                                  controller: tec4,
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

                          const SizedBox(height: 12,),

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
                              controller: tec5,
                              cursorColor: Colors.black,
                              style: const TextStyle(color: Colors.black),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintText: "Remarque",
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),

                          const SizedBox(height: 12,),

                          Center(
                            child: GestureDetector(
                              onTap: () => insert(),
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: kc1,
                                ),
                                child: isL?SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 4.0,
                                  ),
                                ):Text(
                                  'Insérer', style: TextStyle(
                                    color: kc2,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600
                                ),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 6,),

                        ],
                      ),
                    ),
                    if(isL) Positioned.fill(child: AbsorbPointer(
                      child: Container(
                        color: Colors.transparent,
                      ),
                    ))
                  ],
                ),
              ),

          ],
        ),
      ),
    );
  }

  void insert() async {

    if(isL) return;
    String num=tec3.text.replaceAll(' ', '');

    if(num.length!=10) {

      Fluttertoast.showToast(
          msg: "Numero erroné",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          fontSize: 16.0
      );
    } else {

      if(tec1.text.isNotEmpty&&tec2.text.isNotEmpty&&tec4.text.isNotEmpty&&tec6.text.isNotEmpty) {

        setState(() {
          isL=true;
        });

        try {
          var fl=false;

          var nv=await FirebaseFirestore.instance.collection('users').get();

            for (var d in nv.docs) {

              if(d.id.toString()==num) fl=true;
            }

            if(fl) {

              setState(() {
                isL=false;
              });

              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    contentPadding: EdgeInsetsGeometry.all(16),
                    backgroundColor: Colors.white,
                    content: SizedBox(
                      width: double.maxFinite,
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          Center(child: Text('Numéro de téléphone déjà utilisé',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600),)),

                          SizedBox(height: 12,),

                          Center(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 16,vertical: 4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: kc1,
                                ),
                                child: Text(
                                  'Ok', style: TextStyle(
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
                  );
                },
              ).then((r) {
                Navigator.of(context).popAndPushNamed('/as');
              });
            } else {

              FirebaseFirestore.instance
                  .collection('users').doc(num)
                  .set({
                '0': tec1.text.toString(),
                '1': tec4.text.toString(),
                '2': tec2.text.toString(),
                '3': tec6.text.toString(),
                '4': tec5.text.toString(),
              });

          setState(() {
            isL=false;
          });

          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                contentPadding: EdgeInsetsGeometry.all(16),
                backgroundColor: Colors.white,
                content: SizedBox(
                  width: double.maxFinite,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Center(child: Text('Votre expéditeur a bien été ajouté',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600),)),

                      SizedBox(height: 12,),

                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 16,vertical: 4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: kc1,
                            ),
                            child: Text(
                              'Ok', style: TextStyle(
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
              );
            },
          ).then((r) {
            Navigator.of(context).popAndPushNamed('/as');
          });
        }

        } catch(e) {

          setState(() {
            isL=false;
          });

          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                contentPadding: EdgeInsetsGeometry.all(16),
                backgroundColor: Colors.white,
                content: SizedBox(
                  width: double.maxFinite,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Center(child: Text('Erreur réessayer svp',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600),)),

                      SizedBox(height: 12,),

                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 16,vertical: 4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: kc1,
                            ),
                            child: Text(
                              'Ok', style: TextStyle(
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
              );
            },
          ).then((r) {
            Navigator.of(context).popAndPushNamed('/as');
          });
        }
      } else {
        Fluttertoast.showToast(
            msg: "Confirmer que tout les champs * sont remplis, s'il vous plaît",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            fontSize: 16.0
        );
      }
    }
  }
}