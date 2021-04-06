import 'package:flutter/material.dart';

class model{
  String purl, price, st, title, id;

  // model(this.purl, this.price, this.title, this.st, this.id);

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