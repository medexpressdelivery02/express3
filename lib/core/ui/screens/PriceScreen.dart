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

            Expanded(
              child: ListView(
                children: [

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

                ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}