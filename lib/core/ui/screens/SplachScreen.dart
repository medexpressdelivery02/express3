import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:express3/utils/Ext1.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SplachScreen extends StatefulWidget {

  const SplachScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SplachScreen();
}

class _SplachScreen extends State<SplachScreen> {
  bool isL=false;

  @override
  void initState() {
    super.initState();
    get();
  }

  void get() async {

    if(isL) {

      setState(() {
        isL=false;
      });
    }

      try {

        var nv=await FirebaseFirestore.instance.collection('update').doc('check').get();


        if(ks0!=nv.data()!['version'].toString()) {

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
                      Center(child: Text('Installer la nouvelle mise à jour pour continuer, ou appeler Bureau Chlef (Ilyas) :\n05.63.63.59.92',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600),)),

                      SizedBox(height: 12,),

                      Center(
                        child: GestureDetector(
                          onTap: () async {

                            await launchUrl(Uri.parse(nv.data()!['android'].toString()));

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
            get();
          });

        } else {
          var st=prefs?.getString('store_name')??'';
          Navigator.of(context).pushNamed(st!=''?'/main':'/login');
        }
      }catch(e){

        setState(() {
          isL=true;
        });
      }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()=> onWillPopExit(),
      child: Material(
        color: kc2,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
            child: Column(
              children: [

                const Spacer(),

                if(isL) Center(
                  child: GestureDetector(
                    onTap: ()=>get(),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: kc1,
                      ),
                      child: Text(
                        'Réessayer', style: TextStyle(
                          color: kc2,
                          fontSize: 20,
                          fontWeight: FontWeight.w600
                      ),
                      ),
                    ),
                  ),
                ),

                const Spacer(),

                Row(
                  children: [

                    Container(
                      height: 66,
                      width: 66,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                            image: AssetImage(
                                '${ks2}logo.jpg'
                            ),fit: BoxFit.cover,
                          ),
                          boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 6,
                            spreadRadius: 0,
                          )
                        ]
                      ),
                    ),

                    const SizedBox(width: 8,),

                    Expanded(
                      child: SizedBox(
                        height: 64,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text('Express',style: TextStyle(
                                color: kc1,
                                fontWeight: FontWeight.bold,
                                fontSize: 18
                            ),overflow: TextOverflow.ellipsis,),
                            Text('By IBAA',style: TextStyle(
                                color: Colors.black.withOpacity(0.5),
                                fontWeight: FontWeight.w400,
                                fontSize: 12
                            ),overflow: TextOverflow.ellipsis,),
                            SizedBox(height: 2,),
                            Text(ks0,style: TextStyle(
                              color: Colors.black.withOpacity(0.8),
                              fontWeight: FontWeight.w200,
                              fontSize: 12,
                            ),overflow: TextOverflow.ellipsis,),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}