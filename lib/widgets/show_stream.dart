import 'package:contact_app_by_vivek/provider/add_contact.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// own import
import 'package:contact_app_by_vivek/models/contactModal.dart';

import 'package:contact_app_by_vivek/widgets/contact_list.dart';

class ShowAll extends StatefulWidget {
  @override
  _ShowAllState createState() => _ShowAllState();
}

class _ShowAllState extends State<ShowAll> {
  late UsersNewProvid addUsersBloc;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    addUsersBloc = context.watch<UsersNewProvid>();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<UserModel>>(
      stream: addUsersBloc.getUserStream,
      builder: (BuildContext context, AsyncSnapshot<List<UserModel>> snapshot) {
        // Make sure data exists and is actually loaded
        if (snapshot.hasData) {
          // If there are no user (data), display this message.
          if (snapshot.data!.length == 0) {
            return Text('No Contacts!');
          }
          return HomeList(data: snapshot.data!, addUsersBloc: addUsersBloc);
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
