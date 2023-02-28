import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class search extends StatelessWidget {
  @override
  var searchController = TextEditingController();

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              cursorColor :Colors.deepOrange,
              controller: searchController ,
              onTap: () {

              },
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepOrange, width: 1.5)),
                prefixIcon: Icon(CupertinoIcons.search, color: Colors.black,),
                hintText: 'search',
                border: OutlineInputBorder(),
              ),




            ),
          ],
        ),
      ),
    );

  }
}