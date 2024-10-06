import 'package:flutter/material.dart';

class AppbarIconButton extends StatelessWidget {
  const AppbarIconButton({
    super.key, required this.onTap, required this.iconData,
  });
  final VoidCallback onTap;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 16,
      backgroundColor: Colors.grey.shade200,
      child: Icon(iconData,color: Colors.grey,size: 18,),
    );
  }
}