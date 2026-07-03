import 'package:express3/utils/Ext1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AdminAuthScreen extends StatefulWidget {

  const AdminAuthScreen({super.key});

  @override
  State<StatefulWidget> createState() => _AdminAuthScreen();
}

class _AdminAuthScreen extends State<AdminAuthScreen> {
  String password='';

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kc2,
      child: SafeArea(
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
                    'Accès spécial', style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600
                  ),
                  ),
                ],
              ),
            ),

            Spacer(flex: 2,),

            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              padding: EdgeInsets.symmetric(
                horizontal: 52,
              ),
              children: <Widget>[
                getWid(1),
                getWid(2),
                getWid(3),
                getWid(4),
                getWid(5),
                getWid(6),
                getWid(7),
                getWid(8),
                getWid(9),
                SizedBox(),
                getWid(0),
                SizedBox(),
              ],
            ),

            Spacer(flex: 3,),

          ],
        )
      ),
    );
  }

  Widget getWid(int s) {
    return GestureDetector(
      onTap: () {

        if(!password.contains(s.toString())) {
          password=password+s.toString();
        } else {
          password=password.replaceAll(s.toString(), '');
        }
        setState(() { });

        if(password=='107') {

          Future.delayed(const Duration(milliseconds: 500), () {

            if(password=='107') Navigator.of(context).popAndPushNamed('/as');

          });
        }
      },
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: password.contains(s.toString())?kc1:Colors.grey.withOpacity(0.3),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(s.toString(), style: TextStyle(
            color: password.contains(s.toString())?Colors.white:Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w600
          ),),
        ),
      ),
    );
  }
}