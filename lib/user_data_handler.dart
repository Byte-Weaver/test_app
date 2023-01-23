import 'package:flutter/material.dart';


Map replaceNullValues(map){
  map.forEach((k,v) {
    if(v == null){
      map[k] = "replaced";
  }});
  print(map);
  return map;
}

List<ListTile> userInfoList(userData) {
  List<ListTile> userInfoDataList = [];
  replaceNullValues(userData).forEach((k,v)=>
      userInfoDataList.add(buildListTileWidget(k, v))
  );
  return userInfoDataList;
}

Widget buildListTileWidget(k,v){
  return ListTile(
      title: Text(k.toString()),
      subtitle: Text(v.toString())
  );
}