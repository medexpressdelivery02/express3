import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:express3/core/models/wilaya.dart';
import 'package:express3/utils/Ext1.dart';
import 'package:express3/utils/Ext2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uuid/uuid.dart';

class AddScreen extends StatefulWidget {

  const AddScreen({super.key});

  @override
  State<StatefulWidget> createState() => _AddScreen();
}

class _AddScreen extends State<AddScreen> {
  TextEditingController tec1=TextEditingController();
  TextEditingController tec2=TextEditingController();
  TextEditingController tec3=TextEditingController();
  TextEditingController tec4=TextEditingController();
  TextEditingController tec5=TextEditingController();
  TextEditingController tec6=TextEditingController();
  TextEditingController tec7=TextEditingController();
  TextEditingController tec8=TextEditingController();
  TextEditingController tec9=TextEditingController();
  TextEditingController tec10=TextEditingController();
  TextEditingController tec11=TextEditingController();
  wilaya? wc;
  bool isL=false;

  @override
  void initState() {
    super.initState();
    tec2.text='Livraison';

    tec9.addListener(() {

      if(tec10.text.isNotEmpty) {
        int ii=0;

        try {
          ii=(double.parse(tec9.text.toString().replaceAll(',', '.')).ceil()-5);
        }catch(e) { }

        try {

          if(ii>0) {
            tec10.text=(ii*50+(tec1.text=='Stop Desk'?wc!.i2:wc!.i1)).toString();
          } else {
            tec10.text=((tec1.text=='Stop Desk'?wc!.i2:wc!.i1)).toString();
          }
        }catch(e) { }
      }
    });
  }

  @override
  void dispose() {
    tec9.dispose();
    super.dispose();
  }

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
              'Ajouter un colis', style: TextStyle(
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

                        GestureDetector(
                          child: Stack(
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
                                child: 	AbsorbPointer(
                                  child: TextFormField(
                                    controller: tec1,
                                    readOnly: true,
                                    cursorColor: Colors.black,
                                    style: const TextStyle(color: Colors.black),
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      hintText: "Type de préstation *",
                                      hintStyle: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                ),
                              ),

                              Positioned(
                                right: 8,
                                bottom: 0,
                                top: 0,
                                child: Center(child: Image.asset(ks1+'drop.png',color: Colors.black,width: 18,)),)
                            ],
                          ),
                          onTap: () {

                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    contentPadding: EdgeInsetsGeometry.all(16),
                                    backgroundColor: Colors.white,
                                    content: setupAlertDialog([wilaya(0,'À domicile','',[],{},[]),wilaya(0,'Stop Desk','',[],{},[])], (e) {
                                      tec1.text=e.s1;
                                      tec6.text='';
                                      tec7.text='';
                                      tec8.text='';
                                      tec9.text='';
                                      tec10.text='';
                                      tec11.text='';
                                      Navigator.pop(context);
                                    }),
                                  );
                                }
                              );
                          },
                        ),

                        const SizedBox(height: 12,),

                        GestureDetector(
                          child: Stack(
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
                                child: 	AbsorbPointer(
                                  child: TextFormField(
                                    controller: tec2,
                                    readOnly: true,
                                    cursorColor: Colors.black,
                                    style: const TextStyle(color: Colors.black),
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      hintText: "Type d'opération *",
                                      hintStyle: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 8,
                                bottom: 0,
                                top: 0,
                                child: Center(child: Image.asset(ks1+'drop.png',color: Colors.black,width: 18,)),)

                            ],
                          ),
                          onTap: () {

                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    contentPadding: EdgeInsetsGeometry.all(16),
                                    backgroundColor: Colors.white,
                                    content: setupAlertDialog([wilaya(0,'Livraison','',[],{},[]),wilaya(0,'Échange','',[],{},[])], (e) {
                                      tec2.text=e.s1;
                                      tec7.text='';
                                      tec8.text='';
                                      tec9.text='';
                                      tec10.text='';
                                      tec11.text='';
                                      Navigator.pop(context);
                                    }),
                                  );
                                }
                              );
                          },
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
                            style: const TextStyle(color: Colors.black),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              hintText: "Déstinataire * ",
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
                            controller: tec4,
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
                            GestureDetector(
                              onTap: () {

                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        contentPadding: EdgeInsetsGeometry.all(16),
                                        backgroundColor: Colors.white,
                                        content: setupAlertDialog(LW(), (e) {
                                          tec5.text=e.s1;
                                          wc=e;
                                          tec6.text='';
                                          tec7.text='';
                                          tec8.text='';
                                          tec9.text='';
                                          tec10.text='';
                                          tec11.text='';
                                          Navigator.pop(context);
                                        }),
                                      );
                                    }
                                );
                              },
                              child: Container(
                                height: 48,
                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                width: double.infinity,
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey.withOpacity(0.4),
                                ),
                                child: 	AbsorbPointer(
                                  child: TextFormField(
                                    controller: tec5,
                                    cursorColor: Colors.black,
                                    readOnly: true,
                                    style: const TextStyle(color: Colors.black),
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      hintText: "Wilaya *",
                                      hintStyle: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 8,
                              bottom: 0,
                              top: 0,
                              child: Center(child: Image.asset(ks1+'drop.png',color: Colors.black,width: 18,)),)
                          ],
                        ),

                        const SizedBox(height: 12,),

                        Stack(
                          children: [
                            GestureDetector(
                              onTap: () {

                                if(tec5.text.isNotEmpty&&tec1.text.isNotEmpty) {

                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          contentPadding: EdgeInsetsGeometry.all(16),
                                          backgroundColor: Colors.white,
                                          content: setupAlertDialog([wc!], (e) {
                                            tec6.text=e;
                                            tec7.text='';
                                            tec8.text='';
                                            tec9.text='';
                                            tec10.text=(tec1.text=='Stop Desk'?wc!.i2:wc!.i1).toString();
                                            tec11.text='';
                                            Navigator.pop(context);
                                          }, isCommune: true),
                                        );
                                      }
                                  );
                                } else if(tec1.text.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg: "Sélectionnez le type de prestation avant de choisir la commune",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      fontSize: 16.0
                                  );
                                } else {
                                  Fluttertoast.showToast(
                                      msg: "Sélectionnez la wilaya avant de choisir la commune",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      fontSize: 16.0
                                  );
                                }
                              },
                              child: Container(
                                height: 48,
                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                width: double.infinity,
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey.withOpacity(0.4),
                                ),
                                child: 	AbsorbPointer(
                                  child: TextFormField(
                                    controller: tec6,
                                    readOnly: true,
                                    cursorColor: Colors.black,
                                    style: const TextStyle(color: Colors.black),
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      hintText: "Commune *",
                                      hintStyle: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 8,
                              bottom: 0,
                              top: 0,
                              child: Center(child: Image.asset(ks1+'drop.png',color: Colors.black,width: 18,)),)
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
                            controller: tec7,
                            cursorColor: Colors.black,
                            style: const TextStyle(color: Colors.black),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              hintText: "Adresse *",
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
                            controller: tec8,
                            cursorColor: Colors.black,
                            style: const TextStyle(color: Colors.black),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              hintText: "Produit *",
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
                            controller: tec9,
                            keyboardType: TextInputType.number,
                            cursorColor: Colors.black,
                            style: const TextStyle(color: Colors.black),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              hintText: "Poids",
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
                            controller: tec10,
                            readOnly: true,
                            cursorColor: Colors.black,
                            style: const TextStyle(color: Colors.red,fontWeight: FontWeight.w800),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              hintText: "Frais livraison",
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
                            controller: tec11,
                            keyboardType: TextInputType.number,
                            cursorColor: Colors.black,
                            style: const TextStyle(color: Colors.black),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              hintText: "Montant à collecter *",
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),

                        const SizedBox(height: 12,),

                        Center(
                          child: GestureDetector(
                            onTap: ()=>insert(),
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

  Widget setupAlertDialog(List<wilaya> ls, Function func, {isCommune=false}) {
    return SizedBox(
      width: double.maxFinite,
      child: ListView(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        children: (isCommune?(tec1.text=='Stop Desk'?ls.first.LS1:ls.first.LS2):ls).map((e) {
          return GestureDetector(
            onTap: ()=>func(e),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.25),
                borderRadius: BorderRadius.circular(6)
              ),
                padding: EdgeInsetsGeometry.symmetric(horizontal: 8,vertical: 6),
                margin: EdgeInsetsGeometry.symmetric(vertical: 4),
                child: Text(isCommune?e.toString():(e as wilaya).s1,style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 18
                ),)
            ),
          );
        }).toList(),
      ),
    );
  }

  void insert() async {

    if(isL) return;
    String num=tec4.text.replaceAll(' ', '');

    if(num.length!=10) {

      Fluttertoast.showToast(
          msg: "Numero erroné",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          fontSize: 16.0
      );
    } else {

      if(tec1.text.isNotEmpty&&tec2.text.isNotEmpty&&tec3.text.isNotEmpty&&tec4.text.isNotEmpty&&tec5.text.isNotEmpty&&tec6.text.isNotEmpty&&tec7.text.isNotEmpty&&tec8.text.isNotEmpty&&tec11.text.isNotEmpty) {

        setState(() {
          isL=true;
        });

        var jj=0;

        try {
          jj=(double.parse(tec9.text.toString().replaceAll(',', '.')).ceil());
        }catch(e) { }

        try {

          Response<dynamic> res=await Dio().post('${wc!.s0=='SWIFT'?ks3:ks5}/api/v1/create/order',
              options: Options(
                  headers: {
                    'Authorization': 'Bearer ${wc!.s0=='SWIFT'?ks4:ks6}'
                  }
              ),
              data: {
                "reference": '${prefs!.getString('sub_name')} - ${int.parse(tec11.text.toString())-int.parse(tec10.text.toString())}',
                "nom_client": tec3.text.toString(),
                "telephone": num,
                "adresse": tec7.text.toString(),
                "produit": tec8.text.toString(),
                "code_wilaya": wc!.i0,
                "commune": tec6.text.toString(),
                "montant": tec11.text.toString(),
                "weight": jj.toString(),
                "fragile": 1,
                "type": tec2.text.toString()=="Livraison"?1:2,
                "stop_desk": tec1.text.toString()!='Stop Desk'?0:1,
              }
          );
          var t=res.data['tracking'];

          setState(() {
            isL=false;
          });

          try {

            FirebaseFirestore.instance
                .collection(prefs!.getString('phone').toString()).doc(t)
                .set({
              'date':DateTime.now()
            });
          }catch(e) { }

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
                      Center(child: Text('Votre colis a bien été ajouté',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600),)),

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
            Navigator.of(context).popAndPushNamed('/add');
          });

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
            Navigator.of(context).popAndPushNamed('/add');
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