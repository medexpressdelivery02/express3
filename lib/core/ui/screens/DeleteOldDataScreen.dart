import 'package:express3/utils/Ext1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeleteOldDataScreen extends StatefulWidget {

  const DeleteOldDataScreen({super.key});

  @override
  State<StatefulWidget> createState() => _DeleteOldDataScreen();
}

class _DeleteOldDataScreen extends State<DeleteOldDataScreen> {
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

                  Expanded(
                    child: Text(
                                  'Supprimer les anciennes données', style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w600
                        ),
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
}