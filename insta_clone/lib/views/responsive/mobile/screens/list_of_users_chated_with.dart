import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:insta_clone/core/utils/colors.dart';
import 'package:insta_clone/views/responsive/mobile/screens/widgets/list_of_users_chated_with_body.dart';

class ListOfUsersChatedWith extends StatelessWidget {
  const ListOfUsersChatedWith({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Followers'),
        backgroundColor: mobileBackgroundColor,
      ),
      backgroundColor: mobileBackgroundColor,
      body: ListOfUsersChatedWithBody(),
    );
  }
}
