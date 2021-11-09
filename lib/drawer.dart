import 'package:flutter/material.dart';

class MyHomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
              accountName: Text('Nitesh Rathore'),
              accountEmail: Text('nitesh.rathore@izisstechnology.com'),
              //currentAccountPicture: Image.network('https://images.unsplash.com/photo-1579781403337-de692320718a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTJ8fGltYWdlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage('https://images.unsplash.com/photo-1579781403337-de692320718a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTJ8fGltYWdlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60'),
              )),
          ListTile(
            leading: Icon(Icons.email),
            title: Text('Nitesh Rathore'),
            subtitle: Text('nitesh.rathore@izisstechnology.com'),
            trailing: Icon(Icons.send),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Account'),
            subtitle: Text('personal'),
            trailing: Icon(Icons.edit),
          )
        ],
      ),
    );
  }
}
