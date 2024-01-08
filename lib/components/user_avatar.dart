import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    super.key,
    required this.filename,
    required this.border,
    required this.radius,
  });

  final String filename;
  final bool border;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 18),
      decoration: border
          ? BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xff000000), width: 2),
            )
          : null,
      child: CircleAvatar(
        radius: radius,
        backgroundImage: AssetImage("assets/$filename"),
      ),
    );
  }
}
