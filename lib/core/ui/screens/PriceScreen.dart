import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:express3/core/models/wilaya.dart';
import 'package:express3/utils/Ext1.dart';
import 'package:express3/utils/Ext2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PriceScreen extends StatefulWidget {

  const PriceScreen({super.key});

  @override
  State<StatefulWidget> createState() => _PriceScreen();
}

class _PriceScreen extends State<PriceScreen> {

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
                ],
              ),
            ),

            Expanded(child: ListView.builder(
              itemCount: LW().length,
              itemBuilder: (context, index) {

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

                      Text(LW()[index].s1,style: TextStyle(color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.w700,fontSize: 16),),

                      SizedBox(height: 6,),

                      ...LW()[index].LS1.map((e) {

                        return Wrap(
                          children: [

                            if(LW()[index].LS1.length!=1) Text('$e : ',style: TextStyle(color: Colors.black.withOpacity(0.7),fontWeight: FontWeight.w700,fontSize: 16),),
                            Text(LW()[index].LM1[e].toString(),style: TextStyle(color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.w700,fontSize: 16),),
                          ],
                        );

                      },),

                      SizedBox(height: 6,),

                      Wrap(
                        children: [

                          Text('À domicile : ',style: TextStyle(color: Colors.black.withOpacity(0.6),fontWeight: FontWeight.w700,fontSize: 16),),
                          Text('${LW()[index].i1} DA',style: TextStyle(color: Colors.green,fontWeight: FontWeight.w800,fontSize: 16),),
                          Text('   -   ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 16),),
                          Text('Stop desk : ',style: TextStyle(color: Colors.black.withOpacity(0.6),fontWeight: FontWeight.w700,fontSize: 16),),
                          Text('${LW()[index].i2} DA',style: TextStyle(color: Colors.green,fontWeight: FontWeight.w800,fontSize: 16),),


                        ],
                      )

                    ],
                  ),
                );

              },
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