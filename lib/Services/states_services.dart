import 'dart:convert';

import 'package:covd_19/Model/worldStatesModel.dart';
import 'package:covd_19/Services/Utilities/app_url.dart';
//import 'package:covd_19/view/word_states.dart';
//import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;

class StatesServices{
  Future<WorldStatesModel> fetchWorldStatesRecords () async{
    final response=await http.get(Uri.parse(AppUrl.worldStatesApi));
    var data=jsonDecode(response.body.toString());
    if(response.statusCode==200){
      return WorldStatesModel.fromJson(data);
    }else
      {
        throw Exception('Error');
      }
    
  }//Now fetching data completed


  Future<List<dynamic>> countriesList () async{

    final response=await http.get(Uri.parse(AppUrl.countriesList));
    var data=jsonDecode(response.body.toString());
    if(response.statusCode==200){
      return data;
    }else
    {
      throw Exception('Error');
    }

  }
  
}