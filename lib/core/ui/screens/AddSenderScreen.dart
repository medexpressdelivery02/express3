import 'package:express3/utils/Ext1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddSenderScreen extends StatefulWidget {

  const AddSenderScreen({super.key});

  @override
  State<StatefulWidget> createState() => _AddSenderScreen();
}

class _AddSenderScreen extends State<AddSenderScreen> {

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


          ],
        ),
      ),
    );
  }
}