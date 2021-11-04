import 'package:contact_app_by_vivek/provider/add_contact.dart';
import 'package:flutter/material.dart';
import '../widgets/show_stream.dart';
import 'package:provider/provider.dart';
// own import
import 'package:contact_app_by_vivek/widgets/add_new_contact.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _searchController = TextEditingController();
  UsersNewProvid? addUsersBloc;
 late FocusNode myFocusNode;
  @override
  void initState() {
    super.initState();
     myFocusNode = FocusNode();
  }

  @override
  void didChangeDependencies() {
    addUsersBloc = context.watch<UsersNewProvid>();
    super.didChangeDependencies();
  }

 @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    myFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        centerTitle: true,
        title: Text(
          'Contacts',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5),
        ),
        actions: _buildActions(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _searchField(),
          Expanded(child: ShowAll()),
        ],
      ),
    );
  }

  // searchField
  Widget _searchField() {
    return TextFormField(
  
      style: TextStyle(fontSize: 14.0, color: Colors.black),
      controller: _searchController,
      onChanged: (changed) {
        addUsersBloc!.isSearchUser.add(changed);
      },
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        filled: true,
        fillColor: Colors.grey[100],
        suffixIcon: _searchController.text.length > 0
            ? IconButton(
                icon: Icon(
                  Icons.search_outlined,
                  color: Colors.grey[500],
                  size: 16.0,
                ),
                onPressed: () {})
            : Icon(
                Icons.search_outlined,
                color: Colors.grey[500],
                size: 16.0,
              ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[100]!.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(30.0)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[100]!.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(30.0)),
        contentPadding: EdgeInsets.only(left: 15.0, right: 10.0),
        labelText: "Search...",
        hintStyle: TextStyle(
            fontSize: 14.0, color: Colors.grey, fontWeight: FontWeight.w500),
        labelStyle: TextStyle(
            fontSize: 14.0, color: Colors.grey, fontWeight: FontWeight.w500),
      ),
      autocorrect: false,
      autovalidateMode: AutovalidateMode.always,
    );
  }

  // appbar Actions
  List<Widget> _buildActions() {
    return <Widget>[
      IconButton(
          icon: const Icon(
            Icons.group_add,
            color: Colors.white,
          ),
          onPressed: () {
            _openNewContactDialouge(false);
          }),
    ];
  }

  Future _openNewContactDialouge(bool isEdit) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return NewContactDialouge(context, isEdit, addUsersBloc!, null);
      },
    );
    // setState(() {});
  }
}
