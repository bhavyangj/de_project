import 'package:flutter/cupertino.dart';

class model{
  String purl, price, title, id, st;

  // model(
  //     this.price,
  //     this.purl,
  //     this.st,
  //     this.title
  //     );

  String getId(){
    return id;
  }
  void setId(String id){
    this.id = id;
  }
  model(String purl, String price, String st, String title){
    this.purl = purl;
    this.price = price;
    this.st = st;
    this.title = title;
    this.id = id;
  }
  String getPurl(){
    return purl;
  }
  void setPurl(String purl){
    this.purl = purl;
  }
  String getPrice(){
    return price;
  }
  void setPrice(String price){
    this.price = price;
  }
  String getSt(){
    return st;
  }
  void setSt(String st){
    this.st = st;
  }
  String getTitle(){
    return title;
  }
  void setTitle(String title){
    this.title = title;
  }


}