import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchSession extends StatefulWidget {
  @override
  SearchSessionState createState() => new SearchSessionState();
}

class SearchSessionState extends State<SearchSession> {
  // final formKey = new GlobalKey<FormState>();
  // final key = new GlobalKey<ScaffoldState>();
  final TextEditingController _filter = new TextEditingController();
  String _searchText = "";
  List names = ["NTU Stadium", "GYMMBOXX"];
  List filteredNames = ["NTU Stadium", "GYMMBOXX"];
  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text('...');

/*
  SearchSessionState() {
    _filter.addListener(() {
      if (_filter.text.isEmpty) {
        setState(() {
          _searchText = "";
          filteredNames = names;
        });
      } else {
        setState(() {
          _searchText = _filter.text;
          globals.gymText = _searchText;
        });
      }
    });
  }
*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildBar(context),
      body: Container(
        child: _buildList(),
      ),
      resizeToAvoidBottomPadding: false,
    );
  }

  Widget _buildBar(BuildContext context) {
    return new AppBar(
      centerTitle: true,
      title: _appBarTitle,
      leading: new IconButton(
        icon: _searchIcon,
        onPressed: _searchPressed,
      ),
    );
  }

  Widget _buildList() {
    //TODO GET DB DATA (GYM LIST)
    return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('Gym').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError)
            return new Text('Error: ${snapshot.error}'); //error checking
          switch (snapshot.connectionState) {
            //if takes too long to load, display "loading"
            case ConnectionState.waiting:
              return new CircularProgressIndicator();
            default:
              final int gymCount = snapshot
                  .data.documents.length; //get number of gyms in collection
              return ListView.builder(
                itemCount: gymCount,
                itemBuilder: (BuildContext context, int index) {
                  return new ListTile(
                    title: Text(snapshot.data.documents[index]['locationStr']),
                    onTap: () => {
                          _filter.text =
                              snapshot.data.documents[index]['locationStr'],
                          Navigator.pop(context,
                              snapshot.data.documents[index]['locationStr'])
                        },
                  );
                },
              );
          }
        });
  }

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
          controller: _filter,
          decoration: new InputDecoration(
              prefixIcon: new Icon(Icons.search), hintText: 'Search...'),
        );
      } else {
        this._searchIcon = new Icon(Icons.search);
        this._appBarTitle = new Text('...');
        filteredNames = names;
        _filter.clear();
      }
    });
  }
}
