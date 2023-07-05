import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuListTile extends StatelessWidget {
  final String title;
  final Widget navigateTo;
  final Icon? icon;
  const MenuListTile(
      {Key? key, required this.title, required this.navigateTo, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey[200]),
      child: ListTile(
        dense: true,
        title: Text(title),
        trailing: icon,
        onTap: () => Get.to(() => navigateTo),
      ),
    );
  }
}
