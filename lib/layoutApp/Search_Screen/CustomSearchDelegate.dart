import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate{
  List<String> searchWords=[
    "Cooking lessons",
    "Cooking Art",
    "Cooking at home",
    "Cooking a good meal",
        "Sooking a good meal"
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return[
      IconButton(
          onPressed: (){
            query="";
          }, icon: const Icon(Icons.clear))]
    ;
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return
      IconButton(
          onPressed: (){
            close(context, null);
          }, icon: const Icon(Icons.arrow_back_ios))
    ;
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery=[];
    for (var element in searchWords){
      if(element.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(element);
      }
    }
    return ListView.builder(itemCount: matchQuery.length,itemBuilder: (context,index){
      var result=matchQuery[index];
      return ListTile(title:Text(result) ,onTap: (){},);
    },);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery=[];
    for (var element in searchWords){
      if(element.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(element);
      }
    }
    return ListView.builder(itemCount: matchQuery.length,itemBuilder: (context,index){
      var result=matchQuery[index];
      return ListTile(title:Text(result) ,onTap: (){},);
    },);
  }
  
}