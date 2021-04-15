import 'package:de_project/models/model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:de_project/models/Cart.dart';

import '../../../size_config.dart';
import 'cart_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  List<model> dataList = [];

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


  @override
  Widget build(BuildContext context) {
    return dataList.length==0? Center(child: Text("Cart is Empty", style: TextStyle(fontSize: 30,),))
    // :Padding(
    //   padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
    //   child: ListView.builder(
    //     itemCount: dataList.length,
    //     itemBuilder: (context, index) => Padding(
    //       padding: EdgeInsets.symmetric(vertical: 10),
    //       child: Dismissible(
    //         key: Key(dataList[index].title.toString()),
    //         direction: DismissDirection.endToStart,
    //         onDismissed: (direction) {
    //           setState(() {
    //             dataList.removeAt(index);
    //           });
    //         },
    //         background: Container(
    //           padding: EdgeInsets.symmetric(horizontal: 20),
    //           decoration: BoxDecoration(
    //             color: Color(0xFFFFE6E6),
    //             borderRadius: BorderRadius.circular(15),
    //           ),
    //           child: Row(
    //             children: [
    //               Spacer(),
    //               SvgPicture.asset("assets/icons/Trash.svg"),
    //             ],
    //           ),
    //         ),
    //         child: CartCard(cart: demoCarts[index]),
    //       ),
    //     ),
    //   ),
    // );
    :ListView.builder(
        itemBuilder: (context, index){
          return CardUI(dataList[index].purl, dataList[index].title, dataList[index].st, dataList[index].price);
        }
    );
  }
  Widget CardUI(String purl, String title, String st, String price){
    return Card(
      margin: EdgeInsets.all(15),
      color: Color(0xffff2fc3),
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.all(1.5),
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Image.network(purl, fit: BoxFit.cover, height: 100),
            SizedBox(height: 1,),
            Text(title, style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),),
            SizedBox(height: 1,),
            Text(price, style: TextStyle(color: Colors.red, fontSize: 20, ),),
            SizedBox(height: 1,),
          ],
        ),
      ),
    );
  }
}
