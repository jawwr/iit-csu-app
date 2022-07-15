import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavBarButton extends StatelessWidget {
  const NavBarButton({
    Key? key,
    required this.icon,
    required this.function,
    required this.bgColor,
  }) : super(key: key);

  final IconData icon;
  final void Function() function;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: IconButton(
        enableFeedback: false,
        onPressed: function,
        icon: FaIcon(
          icon,
          color: bgColor,
        ),
        iconSize: 27,
      ),
    );
  }
}
