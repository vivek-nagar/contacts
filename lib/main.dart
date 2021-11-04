import 'package:contact_app_by_vivek/provider/add_contact.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:contact_app_by_vivek/screens/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UsersNewProvid>(
          create: (context) => new UsersNewProvid(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Contacts App by Vivek',
        theme: ThemeData(
          primarySwatch: Colors.cyan,
        ),
        home: HomePage(),
      ),
    );
  }
}
