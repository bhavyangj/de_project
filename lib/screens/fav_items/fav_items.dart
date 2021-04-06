import 'package:de_project/models/Cart.dart';
import 'package:de_project/screens/fav_items/components/body.dart';
import 'package:flutter/material.dart';

class favourite_items extends StatelessWidget {
  static String routeName = "/fav_items";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(context),
      body: Body(),
    );
  }

  Widget buildAppbar(BuildContext context){
    return AppBar(
      title: Column(
        children: [
          Text("Favorite Items", style: TextStyle(color: Colors.black),),
          Text("${demoCarts.length} items", style: Theme.of(context).textTheme.caption,),
        ],
      ),
    );
  }
}
