import 'package:contact_app_by_vivek/provider/add_contact.dart';
import 'package:flutter/material.dart';
// own import
import 'package:contact_app_by_vivek/models/contactModal.dart';

import 'package:contact_app_by_vivek/widgets/add_new_contact.dart';

class HomeList extends StatelessWidget {
  final List<UserModel> data;
  final UsersNewProvid addUsersBloc;

  HomeList({required this.data, required this.addUsersBloc});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Container(
                child: Center(
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 30.0,
                        child: Text(_getShortName(
                            data[index].firstName, data[index].lastName)),
                        backgroundColor: const Color(0xFF20283e),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                data[index].firstName +
                                    " " +
                                    data[index].lastName,
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.lightBlueAccent),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.phone,
                                    size: 14,
                                  ),
                                  Text(
                                    data[index].mobileNo,
                                    style: TextStyle(
                                        fontSize: 14.0, color: Colors.black),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.email_outlined,
                                    size: 14,
                                  ),
                                  Text(
                                    " ${data[index].email}",
                                    style: TextStyle(
                                        fontSize: 14.0, color: Colors.grey),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    size: 14,
                                  ),
                                  Text(
                                    data[index].address,
                                    style: TextStyle(
                                        fontSize: 14.0, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IconButton(
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.grey,
                            ),
                            onPressed: () =>
                                _openNewContactDialouge(true, data[index], context),
                          ),
                          IconButton(
                              icon: const Icon(Icons.delete_forever,
                                  color: Colors.redAccent),
                              onPressed: () async {
                                addUsersBloc.isDeleteUser.add(data[index].id!);
                              }),
                        ],
                      ),
                    ],
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0)),
          );
        });
  }

  String _getShortName(String firstName, String lastName) {
    String shortName = "";
    if (firstName.isNotEmpty) shortName = firstName.substring(0, 1) + ".";
    if (lastName.isNotEmpty) shortName = shortName + lastName.substring(0, 1);
    return shortName;
  }

  Future _openNewContactDialouge(
      bool isEdit, UserModel userModel, BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return NewContactDialouge(context, isEdit, addUsersBloc, userModel);
      },
    );
  }
}
