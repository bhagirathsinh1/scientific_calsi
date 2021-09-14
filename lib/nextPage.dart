import 'package:calsi/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
List<String> history_list = [];
// ignore: non_constant_identifier_names
List<String> history_list_2 = [];

// ignore: camel_case_types
class nextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text('History'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: history_list.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(history_list[index], style: TextStyle(color: txtColor)),
            subtitle: Text(
              history_list_2[index],
              style: TextStyle(color: txtColor, fontSize: 25),
              softWrap: false,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );
  }
}
