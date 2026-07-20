import 'package:express3/utils/Ext1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PriceScreen extends StatefulWidget {

  const PriceScreen({super.key});

  @override
  State<StatefulWidget> createState() => _PriceScreen();
}

class _PriceScreen extends State<PriceScreen> {
  TextEditingController tec1=TextEditingController();

  @override
  void initState() {
    super.initState();

    tec1.addListener(() {

      setState(() { });
    });
  }

  @override
  void dispose() {
    tec1.dispose();
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
                    'Tarifs / Bureaux', style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600
                  ),
                  ),

                  Spacer(),

                  GestureDetector(
                    onTap: () {

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
                                  Text('Frais poids',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w800),),
                                  Text('Pour chaque : 50 DA',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600),),
                                  Text('Pour chaque : 1 KG',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600),),
                                  Text('Additionel à partir de : 5 KG',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600),),

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
                      );

                    },
                    child: Container(
                      width: 28,height: 28,
                      color: Colors.transparent,
                      child: Image.asset(ks1+'ww.png',color: Colors.black,fit: BoxFit.cover,),
                    ),
                  ),

                ],
              ),
            ),

            Expanded(child: SingleChildScrollView(
              child: Column(
                children: [

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 12),
                    height: 48,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    width: double.infinity,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey.withOpacity(0.4),
                    ),
                    child: 	Stack(
                      children: [
                        Positioned.fill(
                          child: TextFormField(
                            controller: tec1,
                            cursorColor: Colors.black,
                            style: const TextStyle(color: Colors.black),
                            decoration:  InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              hintText: "Rechercher",
                              hintStyle: TextStyle(color: Colors.black.withOpacity(0.7)),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          top: 0,
                          child: Center(child: Image.asset('${ks1}search.png',color: Colors.black.withOpacity(0.7),width: 24,)),)
                      ],
                    ),
                  ),

                  SizedBox(height: 6,),

                  ...LW().where((e) =>
                      tec1.text.isEmpty||
                      e.i0.toString().contains(tec1.text)||
                      e.s1.toLowerCase().contains(tec1.text.toString().toLowerCase())
                  ).map((elm) {

                    return Container(
                      width: double.infinity,
                      margin: EdgeInsetsGeometry.symmetric(horizontal: 12,vertical: 8),
                      padding: EdgeInsetsGeometry.symmetric(horizontal: 12,vertical: 8),
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(12)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text(elm.s1,style: TextStyle(color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.w700,fontSize: 16),),

                          SizedBox(height: 6,),

                          ...elm.LS1.map((e) {

                            return Wrap(
                              children: [

                                if(elm.LS1.length!=1||
                                    elm.s2!=e
                                ) Text('$e : ',style: TextStyle(color: Colors.black.withOpacity(0.7),fontWeight: FontWeight.w700,fontSize: 16),),
                                Text(elm.LM1[e].toString(),style: TextStyle(color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.w700,fontSize: 16),),
                              ],
                            );

                          },),

                          SizedBox(height: 6,),

                          Wrap(
                            children: [

                              Text('À domicile : ',style: TextStyle(color: Colors.black.withOpacity(0.6),fontWeight: FontWeight.w700,fontSize: 16),),
                              Text('${elm.i1} DA',style: TextStyle(color: Colors.green,fontWeight: FontWeight.w800,fontSize: 16),),
                              Text('   -   ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 16),),
                              Text('Stop desk : ',style: TextStyle(color: Colors.black.withOpacity(0.6),fontWeight: FontWeight.w700,fontSize: 16),),
                              Text('${elm.i2} DA',style: TextStyle(color: Colors.green,fontWeight: FontWeight.w800,fontSize: 16),),


                            ],
                          )

                        ],
                      ),
                    );

                  }),

                ]
              ),
            )),

          ],
        ),
      ),
    );
  }
}

/*
                  SizedBox(
                    height: 2500,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [

                        Image.asset(
                            width: 1000,
                            '${ks2}price.png'),
                      ],
                    ),
                  ),
 */