import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:express3/core/models/order_payload.dart';
import 'package:express3/utils/Ext1.dart';
import 'package:express3/utils/Ext2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class MainScreen extends StatefulWidget {

  const MainScreen({super.key});

  @override
  State<StatefulWidget> createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  bool isL=true;
  List<OrderData> ld=[];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    get();
  }

  Future<List<String>> getSt() async {
    String st1='';
    String st2='';

    try {

      var nv=await FirebaseFirestore.instance.collection(prefs!.getString('phone').toString()).get();

      for (var d in nv.docs) {

        if(d.id.startsWith('ECT')) {

          if(!st1.contains(d.id)) st1='${st1}trackings[]=${d.id}&';
        } else {
          if(!st2.contains(d.id)) st2='${st2}trackings[]=${d.id}&';
        }
      }

    }catch(e) { }
    return [
      st1,st2
    ];
  }

  void get() async {
    var f=await getSt();
    String st1=f[0];
    String st2=f[1];

    if(st1!='') {

      try {

        var res=await Dio().get('$ks3/api/v1/get/trackings/info?$st1',
          options: Options(
              headers: { 'Authorization': 'Bearer $ks4' }
          ),
        );
        OrderPayload payload = OrderPayload.fromJson(res.data);
        ld.addAll(payload.orders);
      }catch(e){ }
    }

    if(st2!='') {

      try {

        var res=await Dio().get('$ks5/api/v1/get/trackings/info?$st2',
          options: Options(
              headers: { 'Authorization': 'Bearer $ks6' }
          ),
        );
        OrderPayload payload = OrderPayload.fromJson(res.data);
        ld.addAll(payload.orders);
      }catch(e){ }
    }

    ld.sort((a,b) {
      return a.orderInfo!.created_at!.compareTo(b.orderInfo!.created_at!);
    });

    ld=ld.reversed.toList();

    setState(() {
      isL=false;
    });
  }

  Widget getDrawer() {
    return Container(
      color: Colors.white,
      width: 240,
      height: double.infinity,
      child: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Column(
                children: [

                  GestureDetector(
                    onLongPress: () {
                      _scaffoldKey.currentState?.closeDrawer();
                      Navigator.of(context).pushNamed('/aa');
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 42, 8, 4),
                        child: Text(
                          prefs!.getString('store_name').toString(), style: TextStyle(
                            color: Colors.black.withOpacity(0.75),
                            fontSize: 20,
                            fontWeight: FontWeight.w600,overflow: TextOverflow.ellipsis
                        ),
                        ),
                      ),
                    ),
                  ),

                  GestureDetector(
                      onTap: () {
                        _scaffoldKey.currentState?.closeDrawer();
                        Navigator.of(context).pushNamed('/price');
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 4,horizontal: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: kc1,
                        ),
                        child: Text(
                          'Tarifs / Bureaux', style: TextStyle(
                            color: kc2,
                            fontSize: 18,
                            fontWeight: FontWeight.w600
                        ),
                        ),
                      ),
                    ),

                  Spacer(),

                  Row(
                    children: [

                      Spacer(flex: 1,),

                      Expanded(
                          flex: 4,
                          child: GestureDetector(
                        onTap: () {
                          _scaffoldKey.currentState?.closeDrawer();
                          launchUrl(Uri.parse('https://www.facebook.com/profile.php?id=61585190468117'));
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: Center(
                            child: Image.asset('${ks1}fb.png',width: 52,fit: BoxFit.cover,),
                          ),
                        ),
                      )),

                      Expanded(
                          flex: 4,
                          child: GestureDetector(
                        onTap: () {
                          _scaffoldKey.currentState?.closeDrawer();
                          launchUrl(Uri.parse('https://wa.me/0563635992'));
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: Center(
                            child: Image.asset('${ks1}ws.png',width: 52,fit: BoxFit.cover,),
                          ),
                        ),
                      )),

                      Spacer(flex: 1,),

                    ],
                  ),

                  SizedBox(height: 14,),

                  GestureDetector(
                    onTap: () {
                      prefs?.setString('store_name','');
                      Navigator.of(context).pushReplacementNamed('/login');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Déconnecter', style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600
                        ),
                        ),
                        //Image.asset('${ks1}logout.png',width: 24,color: Colors.black,fit: BoxFit.cover,),
                      ],
                    ),
                  ),

                  SizedBox(height: 12,),

                  Text(ks0,style: TextStyle(
                    color: Colors.black.withOpacity(0.75),
                    fontWeight: FontWeight.w200,
                    fontSize: 12,
                  ),overflow: TextOverflow.ellipsis,),

                  SizedBox(height: 12,),

                ],
              ),
            ),

            Positioned.fill(child: Column(
              children: [

                Spacer(flex: 7,),

                GestureDetector(
                  onTap: () {

                    setState(() {
                      cp=0;
                    });
                    _scaffoldKey.currentState?.closeDrawer();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Vers Station', style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w600
                      ),
                      ),

                      if(jld(0)!=0) Container(
                        margin: EdgeInsets.only(left: 6),
                        color: Colors.red,
                        child: Text(
                          ' ${jld(0)} ', style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w900
                        ),
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  height: 3,
                  width: 127,
                  color: kc1,
                ),

                Spacer(flex: 1,),

                GestureDetector(
                  onTap: () {

                    setState(() {
                      cp=1;
                    });
                    _scaffoldKey.currentState?.closeDrawer();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Vers Wilaya', style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w600
                      ),
                      ),
                      if(jld(1)!=0) Container(
                        margin: EdgeInsets.only(left: 6),
                        color: Colors.red,
                        child: Text(
                          ' ${jld(1)} ', style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w900
                        ),
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  height: 3,
                  width: 123,
                  color: kc1,
                ),

                Spacer(flex: 1,),

                GestureDetector(
                  onTap: () {

                    setState(() {
                      cp=2;
                    });
                    _scaffoldKey.currentState?.closeDrawer();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'En Livraison', style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w600
                      ),
                      ),
                      if(jld(2)!=0) Container(
                        margin: EdgeInsets.only(left: 6),
                        color: Colors.red,
                        child: Text(
                          ' ${jld(2)} ', style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w900
                        ),
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  height: 3,
                  width: 126,
                  color: kc1,
                ),

                Spacer(flex: 1,),

                GestureDetector(
                  onTap: () {

                    setState(() {
                      cp=3;
                    });
                    _scaffoldKey.currentState?.closeDrawer();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Livrés', style: TextStyle(
                          color: Colors.green,
                          fontSize: 22,
                          fontWeight: FontWeight.w600
                      ),
                      ),
                      if(jld(3)!=0) Container(
                        margin: EdgeInsets.only(left: 6),
                        color: Colors.black,
                        child: Text(
                          ' ${jld(3)} ', style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w900
                        ),
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  height: 3,
                  width: 68,
                  color: Colors.green,
                ),

                Spacer(flex: 1,),

                GestureDetector(
                  onTap: () {

                    setState(() {
                      cp=4;
                    });
                    _scaffoldKey.currentState?.closeDrawer();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Retours', style: TextStyle(
                          color: Colors.red,
                          fontSize: 22,
                          fontWeight: FontWeight.w600
                      ),
                      ),
                      if(jld(0)!=0) Container(
                        margin: EdgeInsets.only(left: 6),
                        color: Colors.black,
                        child: Text(
                          ' ${jld(0)} ', style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w900
                        ),
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  height: 3,
                  width: 80,
                  color: Colors.red,
                ),

                Spacer(flex: 8,),

              ],
            ))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        onWillPopExit();
        return false;
      },
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: kc2,
        drawer: getDrawer(),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(
                height: 44,
                child: Row(
                  children: [

                    SizedBox(width: 12,),

                    GestureDetector(
                      onTap: () {
                        _scaffoldKey.currentState?.openDrawer();
                      },
                      child: SizedBox(
                        height: 32,
                        width: 32,
                        child: Image.asset('${ks1}menu.png',color: Colors.black,fit: BoxFit.cover,),
                      ),
                    ),

                    SizedBox(width: 6,),

                    GestureDetector(
                      onTap: () {
                        _scaffoldKey.currentState?.openDrawer();
                      },
                      child: Text(
                        [
                          'Vers Station','Vers Wilaya','En Livraison','Livrés','Retours'
                        ][cp], style: TextStyle(
                          color: cp==3?Colors.green:(cp==4?Colors.red:Colors.black),
                          fontSize: 18,
                          fontWeight: FontWeight.w800
                      ),
                      ),
                    ),

                    if(jld(cp)!=0) Container(
                      margin: EdgeInsets.only(left: 6),
                      color: cp>2?Colors.black:Colors.red,
                      child: Text(
                        ' ${jld(cp)} ', style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w900
                      ),
                      ),
                    ),

                    Spacer(),

                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('/add');
                      },
                      child: Container(
                        width: 32,height: 32,
                        color: Colors.transparent,
                        child: Image.asset('${ks1}add.png',color: Colors.black,fit: BoxFit.cover,),
                      ),
                    ),

                    SizedBox(width: 6,),

                    GestureDetector(
                      onTap: () async {
                        Navigator.of(context).pushReplacementNamed('/main');
                      },
                      child: Container(
                        width: 32,height: 32,
                        color: Colors.transparent,
                        child: Image.asset('${ks1}sync.png',color: Colors.black,fit: BoxFit.cover,),
                      ),
                    ),

                    SizedBox(width: 12,),

                  ],
                ),
              ),

              Container(
                height: 3,
                width: [155.0,150.0,154.0,104.0,118.0][cp],
                color: cp==3?Colors.green:(cp==4?Colors.red:kc1),
              ),

              SizedBox(height: 4,),

              Expanded(child:

              isL?Center(
                    child: CircularProgressIndicator(
                      color: kc1,
                      strokeWidth: 4.0,
                    ),
                  ):(rld().isEmpty?Center(
                child: Text('Aucune donnée disponible',style: TextStyle(color: Colors.grey,fontSize: 16),),
              ):ListView(
                  children: rld().map((d)=>item(d)).toList(),
                ))
              ),

            ],
          ),
        ),
      ),
    );
  }

  Iterable<OrderData> rld() {
    return ld.where((e) {

      switch(cp) {
        case 0: {
          return (e.status=='Prêt à expédier'||e.status=='Prêt à préparer'||e.status=='En ramassage'||e.status=='Stock en préparation');
        }
        case 1: {
          return (e.status=='Vers hub'||e.status=='En hub'||e.status=='Vers wilaya');
        }
        case 2: {
          return (e.status=='En préparation'||e.status=='En livraison'||e.status=='Suspendus');
        }
        case 3: {
          return (e.status=='Livre non encaissé'||e.status=='Livre encaissé non payé'||e.status=='Paiement prêt'||e.status=='Paiement archivé');
        }
        default: {
          return (e.status=='Retours chez livreur'||e.status=='Retours en traitement'||e.status=='Retours prêts'||e.status=='Retours reçu'||e.status=='Retours à dispatcher vers stock'||e.status=='Retours en transit stock'||e.status=='Retours en stock'||e.status=='Retours archivé');
        }
      }
    });
  }

  int jld(int i) {
    int j=0;

    for (var e in ld) {

      if(i==0&&(e.status=='Prêt à expédier'||e.status=='Prêt à préparer'||e.status=='En ramassage'||e.status=='Stock en préparation')) {
        j++;
      } else if(i==1&&(e.status=='Vers hub'||e.status=='En hub'||e.status=='Vers wilaya')) {
        j++;
      } else if(i==2&&(e.status=='En préparation'||e.status=='En livraison'||e.status=='Suspendus')) {
        j++;
      } else if(i==3&&(e.status=='Livre non encaissé'||e.status=='Livre encaissé non payé'||e.status=='Paiement prêt'||e.status=='Paiement archivé')) {
        j++;
      } else if(i==4&&(e.status=='Retours chez livreur'||e.status=='Retours en traitement'||e.status=='Retours prêts'||e.status=='Retours reçu'||e.status=='Retours à dispatcher vers stock'||e.status=='Retours en transit stock'||e.status=='Retours en stock'||e.status=='Retours archivé')) {
        j++;
      }
    }
    return j;
  }


  Widget item(OrderData d) {
    var u='';
    var b='';
    Widget k=SizedBox();

    try {
      u='${LW().firstWhere((test) => test.i0==d.orderInfo!.wilayaId).s1} - ';
    } catch(e) { }

    try {
      b=LW().firstWhere((test) => test.i0==d.orderInfo!.wilayaId).LM1[d.orderInfo!.commune].toString();
    } catch(e) { }

    if(cp==2) {

      if (d.orderInfo!.stopDesk == 1) {
        k=Padding(padding: const EdgeInsets.only(top: 8.0, bottom: 8), child: Text(
          'Adresse bureau: ($b)',
          style: TextStyle(color: Colors.black.withOpacity(0.7), fontWeight: FontWeight.w600, fontSize: 15),));
      } else if (d.orderInfo!.driverName.toString() != '' && d.orderInfo!.phone.toString() != '') {
        k=Padding(padding: const EdgeInsets.only(top: 8.0, bottom: 8), child: Text(
          'Livreur: ${d.orderInfo!.driverName} (${d.orderInfo!.driverPhone})',
          style: TextStyle(color: Colors.black.withOpacity(0.7), fontWeight: FontWeight.w600, fontSize: 15),),
        );
      }
    }
    return GestureDetector(
      onTap: () {

        if(cp==2) {

          dialog(d);

        }
      },
      child: Container(
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
            Text('${d.orderInfo!.stopDesk==1?'Stop Desk':'À domicile'} ● ${d.orderInfo!.typeId==1?'Livraison':'Échange'} ● ${('${d.orderInfo!.created_at}                             ').substring(0,10)} ● ${d.orderInfo!.tracking}',style: TextStyle(color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.w600,fontSize: 11),),
            Text(d.orderInfo!.client.toString(),style: TextStyle(color: kc1,fontWeight: FontWeight.w600,fontSize: 20,),),
            Text(d.orderInfo!.phone.toString(),style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
            Text('$u${d.orderInfo!.commune}',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
            Text(d.orderInfo!.adresse.toString(),style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
            Text('Produit: ${d.orderInfo!.produit}${cp>2?'':(' - ${d.orderInfo!.montant} DA')}',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 18),),

            if(cp==3) Text('Net recouvert: ${getValueRef(d.orderInfo!.reference.toString())} DA',style: TextStyle(color: Colors.green,fontWeight: FontWeight.w600,fontSize: 18),),

            k,

            if(cp>2) GestureDetector(
              onTap: () {

                setState(() {

                  ld.removeWhere((el) {
                    return el.orderInfo!.tracking.toString()==d.orderInfo!.tracking.toString();
                  });
                });

                FirebaseFirestore.instance.collection(prefs!.getString('phone').toString()).doc(d.orderInfo!.tracking.toString()).delete();
              },
              child: Container(
                margin: EdgeInsets.only(
                  top: 8
                ),
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  border: Border.all(
                    width: 2.2,
                    color: Colors.red
                  )
                ),
                  child: Center(
                    child: Text(
                      'Archiver', style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w600
                    ),
                    ),
                  )),
            ),

          ],
        ),
      ),
    );
  }

  void dialog(OrderData d) {

    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController tec1=TextEditingController();

        return AlertDialog(
          contentPadding: EdgeInsetsGeometry.all(16),
          backgroundColor: Colors.white,
          content: SizedBox(
            width: double.maxFinite,
            child: ListView(
              shrinkWrap: true,
              children: [

                ...(d.deliveryAttempts!).reversed.map((t) {
                  var f=(t.text_tentative??t.content).toString();

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                       f.replaceAll('MED EXPRESS : ', ""),
                      style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600),),
                  );
                }),

                SizedBox(height: 12,),

                GestureDetector(
                  onTap: () {

                    if(tec1.text=='') {
                      Navigator.pop(context);
                    } else {

                    try {

                      Dio().post('${d.orderInfo!.tracking!.substring(0,3)=='ECT'?ks3:ks5}/api/v1/add/maj?tracking=${d.orderInfo!.tracking}&content=${tec1.text}',
                        options: Options(
                            headers: { 'Authorization': 'Bearer ${d.orderInfo!.tracking!.substring(0,3)=='ECT'?ks4:ks6}' }
                        ),
                      );

                      d.deliveryAttempts!.add(DeliveryAttempt(content: tec1.text));

                      Navigator.pop(context);

                      dialog(d);

                    }catch(e) {

                      Fluttertoast.showToast(
                          msg: "Erreur",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          fontSize: 16.0
                      );

                    }
                    }
                  },
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16,vertical: 4),
                        height: 42,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey.withOpacity(0.4),
                        ),
                        child: TextFormField(
                          controller: tec1,
                          cursorColor: Colors.black,
                          style: const TextStyle(color: Colors.black),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: "Écrire une remarque",
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                      SizedBox(height: 12,),
                      Container(
                        height: 42,
                        padding: EdgeInsets.symmetric(horizontal: 16,vertical: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: kc1,
                        ),
                        child: Center(
                          child: Text(
                            'Ajouter un commentaire', style: TextStyle(
                              color: kc2,
                              fontSize: 18,
                              fontWeight: FontWeight.w600
                          ),
                          ),
                        ),
                      ),
                    ],
                  )
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String getValueRef(String st) {
    String t='';

    try {

      var r=st.split(' - ');
      return r[1];
    } catch(e) { }
    return t;
  }
}