package com.example.shop.model;

public class Goods {
  private Integer ID=Integer.getInteger("-1");//Define a numeric variable
  private int typeID=-1;
  private String goodName="";
  private String introduce="";
  private float price=0f;
  private float nowPrice=0f;
  private String  picture="";
  private int newGood=-1;
  private int sale=-1;

  public void goods(){
  }

  public Integer getID(){
 return ID;
}
public void setID(Integer ID){
 this.ID=ID;
}

  public int getTypeID() {
    return typeID;
  }
public void setTypeID(int typeID) {
  this.typeID = typeID;
}

public String getGoodName(){
  return goodName;
}
public void setGoodName(String goodName){
  this.goodName=goodName;
}

public String getIntroduce(){
  return introduce;
}
public void setIntroduce(String introduce){
  this.introduce=introduce;
}
public float getPrice(){
  return price;
}
public void setPrice(float price){
  this.price=price;
}
public float getNowPrice(){
  return nowPrice;
}
public void setNowPrice(float nowPrice){
  this.nowPrice=nowPrice;
}
public String getPicture(){
  return picture;
}
public void setPicture(String picture){
  this.picture=picture;
}
public int getNewGood() {
  return newGood;
}
public void setNewGood(int newGood) {
this.newGood = newGood;
}
public int getSale() {
  return sale;
}
public void setSale(int sale) {
this.sale = sale;
}
}
