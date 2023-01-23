import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/user_data_handler.dart';


class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen(this.listWidgets);
  final List<Widget> listWidgets ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Info'),
      ),
      body: Scrollbar(
      child: ListView(
        children: listWidgets,
        ),
      ),
    );
  }
}





