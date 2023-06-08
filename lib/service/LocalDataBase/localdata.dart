import 'package:AdopBox/Data/Model/PostCreate/PostCreate.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';



class LocalDataGet{
   getData() async{
    var users= await Hive.openBox('users');

    if(users.get('token')==null){
      print("hive ");
    }else{
      print("hive "+users.get('token'));
    }

    return users;
  }

   getPrefarenceData() async{
     var users= await Hive.openBox('category');

     if(users.get('categories')==null){
       print("hive categories null");
     }else{
       print("hive categories "+users.get('categories'));
     }

     return users;
   }


   Future setPrefarenceData({String? categories}) async{

     Box? users= Hive.box('category');
     users.put("categories", categories);

     print(users.get('categories'));
     return "done";
   }

   Future storeTokenUserdata({String? token, String? id, String? name, String? email,String? phone}) async{
     print(id);
     Box? users= Hive.box('users');
     users.put("token", token);
     users.put("userId", id);
     users.put("email", email);
     users.put("name", name);
     users.put("phone", phone);
     print(users.get('token'));
     ;
     return "done";
   }

///-==============Hive Curd oparation============================
   Future<String>addItem(PostCreate item) async {
     var box = await Hive.openBox<PostCreate>('postCreate');
     PostCreate clone=item;


     String result="";
     if (!box.values.toList().contains(clone)) {
       box.add(clone);
       result="Successfully add to cart";
     }else{
       result="Already you add this item in cart";
     }
     return result;
   }




   List<PostCreate> _postCreateList = <PostCreate>[];
   List get postCreateList => _postCreateList;

   Future<List<PostCreate>> getItem() async {
     final box = await Hive.openBox<PostCreate>('postCreate');

     _postCreateList = box.values.toList();


     _postCreateList.forEach((element) {
       // Logger().w(element.postUserName.toString());
     });


     return _postCreateList;
   }

   Future<List<PostCreate>>  removeCourse(int index) async{
     final box = await Hive.openBox<PostCreate>('postCreate');

     box.deleteAt(index);
     _postCreateList = box.values.toList();


     return _postCreateList;
   }
   Future<List<PostCreate>>  clearCartCourse() async{
     final box = await Hive.openBox<PostCreate>('postCreate');

     box.clear();
     _postCreateList = box.values.toList();


     return _postCreateList;
   }
}