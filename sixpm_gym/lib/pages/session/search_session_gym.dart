import 'package:flutter/material.dart';

class SearchSession extends StatelessWidget {
 // final formKey = new GlobalKey<FormState>();
 // final key = new GlobalKey<ScaffoldState>();
  final TextEditingController _filter = new TextEditingController();
  String _searchText = "";
  List names = ["NTU Stadium","GYMMBOXX"];
  List filteredNames = ["NTU Stadium","GYMMBOXX"];
  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text( '...' );

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
        //onPressed: _searchPressed,

      ),
    );
  }

  Widget _buildList() {   //TODO GET DB DATA (GYM LIST)
    if (!(_searchText.isEmpty)) {
      List tempList = new List();
      for (int i = 0; i < filteredNames.length; i++) {
        if (filteredNames[i].toLowerCase().contains(_searchText.toLowerCase())) {
          tempList.add(filteredNames[i]);
        }
      }
      filteredNames = tempList;
    }
    return ListView.builder(
      itemCount: names == null ? 0 : filteredNames.length,
      itemBuilder: (BuildContext context, int index) {
        return new ListTile(
          title: Text(filteredNames[index]),
          onTap: ()=>
          { _filter.text = filteredNames[index],
            Navigator.pop(context, filteredNames[index])
          } ,
        );
        },
        );
      }

/*
  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
          controller: _filter,
          decoration: new InputDecoration(
            prefixIcon: new Icon(Icons.search),
            hintText: 'Search...'
          ),
        );
      } else {
        this._searchIcon = new Icon(Icons.search);
        this._appBarTitle = new Text( '...' );
        filteredNames = names;
        _filter.clear();
      }
    });
  }
*/
}