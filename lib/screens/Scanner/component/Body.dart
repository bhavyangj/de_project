import 'dart:collection';

import 'package:barcode_scan_fix/barcode_scan.dart';
import 'package:de_project/components/default_button.dart';
import 'package:de_project/constants.dart';
import 'package:de_project/models/model.dart';
import 'package:de_project/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body>{
  final firebase = FirebaseDatabase.instance;
  final name = "Name";
  List<model> dataList = [];
  String barcodeScanRes ="";
  // var formKey = Global<FormState>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  var values, keys;

  @override
  void initState(){
    super.initState();
    DatabaseReference referenceData = FirebaseDatabase.instance.reference().child("data");
    referenceData.once().then((DataSnapshot dataSnapshot){
      dataList.clear();
      var keys = dataSnapshot.value.keys;
      var values = dataSnapshot.value;
      for(var key in keys){
        model model1 = new model(
          values[key]["price"],
          values[key]["purl"],
          values[key]["st"],
          values[key]["title"],
        );
        dataList.add(model1);
      }
    });
  }

  Future<void> scanBarcodeNormal() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() {
        this.barcodeScanRes = barcode;
      });
      print("/////////////////////////////////////////////////////");
      print(barcodeScanRes);
      print("/////////////////////////////////////////////////////");
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (!mounted) return;
  }

  var title, price, st, purl;

  @override
  Widget build(BuildContext context) {
    final ref = FirebaseDatabase.instance.reference().child("data").child(barcodeScanRes);
    return SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
            child: Column(
              children: <Widget>[
                RaisedButton(
                  child: Text('Start Scanner'),
                  onPressed: () => scanBarcodeNormal(),
                ),
                Text('Scan Result: $barcodeScanRes\n', style: TextStyle(fontSize: 20),),
                RaisedButton(
                    onPressed: () {
                      ref.child("title").once().then((DataSnapshot data) {
                        setState(() {
                          title = data.value;
                        });
                      });
                      ref.child("price").once().then((DataSnapshot data) {
                        setState(() {
                          price = data.value;
                        });
                      });
                      ref.child("purl").once().then((DataSnapshot data) {
                        setState(() {
                          purl = data.value;
                        });
                      });
                      ref.child("st").once().then((DataSnapshot data) {
                        setState(() {
                          st = data.value;
                        });
                      });
                      print("title: "+ title);
                      print("price: "+ price);
                      print("st: "+ st);
                      print("purl: "+ purl);
                      //
                      // print("imageUrl: "+ dataList[0].title);
                      // print("title: "+ dataList[0].price);
                      // print("price: "+ dataList[0].st);
                    },
                    child: Text("Get product data"),
                ),
                // Text(title ?? "name")
                 title == null ? Text(''):
                 Row(
                  children: [
                    SizedBox(
                      width: 88,
                      child: AspectRatio(
                        aspectRatio: 0.88,
                        child: Container(
                          padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                          decoration: BoxDecoration(
                            color: Color(0xFFF5F6F9),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          // child: Image.asset("assets/images/bj_logo.png"),
                          child: Image.network(purl),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(color: Colors.black, fontSize: 16),
                          maxLines: 2,
                        ),
                        SizedBox(height: 10),
                        Text.rich(
                          TextSpan(
                            text: "Rs. ${price}",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, color: kPrimaryColor),
                            children: [
                              TextSpan(
                                  // text: " x${cart.numOfItem}",
                                  text: " x1",
                                  style: Theme.of(context).textTheme.bodyText1),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                // Form(
                //   key: formKey,
                //   o
                // ),
                DefaultButton(
                  text: "Add To Cart",
                  press: () {
                    AddToCart();
                  },
                ),
              ],
            ),
          ),
        )
    );
  }
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> AddToCart() async{
    // initState();
    final User user = auth.currentUser;
    final uid = user.uid;
    // if(formKey.currentState.validate()){
      print("validate is formkey .....");
      DatabaseReference databaseReference = FirebaseDatabase.instance.reference().child("data").child(uid);
      String uploadId = databaseReference.push().key;
      // print("uploadId: " + uploadId);
      HashMap map = new HashMap();
      map ["title"] = title;
      map ["price"] = price;
      map ["st"] = st;
      map ["purl"] = purl;
      databaseReference.child(uploadId).set(map);
    // }
    // else{
    //   print("formkey is not valid .....");
    // }
  }
}
