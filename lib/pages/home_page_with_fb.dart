import 'package:flutter/material.dart';
import 'package:flutter_first/utils/Constants.dart';
import '../drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyHomePageFB extends StatelessWidget {
  Future getData() async {
    var mURL = 'https://jsonplaceholder.typicode.com/photos';
    var res = await http.get(mURL);
    var data = jsonDecode(res.body);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('ActionBarTitle'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Constants.prefs!.setBool("loggedIn", false);
              Navigator.pushReplacementNamed(context, "/login");
            },
          )
        ],
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot){
          switch(snapshot.connectionState){
            case ConnectionState.none:
              return Center(child: Text("Fetch Something"));
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              if(snapshot.hasError){
                return Center(child: Text("Sorry Something went wrong!"));
              }else{
                final restaurant = snapshot.data as List;
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListTile(
                        title: Text(restaurant[index]["title"]),
                        subtitle: Text("ID: ${restaurant[index]["id"]}"),
                        leading: Image.network(restaurant[index]["url"]),
                      ),
                    );
                  },
                  itemCount: restaurant.length,
                );
              }
          }
        },),
      drawer: MyHomeDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /*mText = _nameController.text;
          setState(() {});*/
        },
        tooltip: 'Referesh',
        child: Icon(Icons.refresh),
      ),
    );
  }
}
