import 'package:flutter/material.dart';
import 'package:flutter_first/utils/Constants.dart';
import '../drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _nameController = TextEditingController();
  var mText = 'Change Me';
  var mURL = 'https://jsonplaceholder.typicode.com/photos';
  var data;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    var res = await http.get(mURL);
    data = jsonDecode(res.body);
    setState(() {});
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
      body: Center(
        child: data != null
            ? ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListTile(
                title: Text(data[index]["title"]),
                subtitle: Text("ID: ${data[index]["id"]}"),
                leading: Image.network(data[index]["url"]),
              ),
            );
          },
          itemCount: data.length,
        )
            : Center(child: CircularProgressIndicator()),
      ),
      drawer: MyHomeDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          mText = _nameController.text;
          setState(() {});
        },
        tooltip: 'Referesh',
        child: Icon(Icons.refresh),
      ),
    );
  }

}
