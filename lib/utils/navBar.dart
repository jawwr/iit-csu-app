import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 110,
      width: size.width,
      padding: EdgeInsets.all(20),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.5),
              offset: Offset(0, 0),
              blurRadius: 50,
            ),
          ],
          color: Color.fromARGB(255, 66, 66, 66),
        ),
        child: Row(
          children: [
            NavBarButton(
              icon: Icons.newspaper_sharp,
              function: () {
                print(1);
              },
            ),
            NavBarButton(
              icon: Icons.calendar_today,
              function: () {
                Navigator.pushNamed(context, '/calendar');
              },
            ),
            NavBarButton(
              icon: Icons.account_circle_outlined,
              function: () {
                print(3);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class NavBarButton extends StatelessWidget {
  const NavBarButton({
    Key? key,
    required this.icon,
    required this.function,
  }) : super(key: key);

  final IconData icon;
  final void Function() function;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: function,
        child: Container(
          alignment: Alignment.center,
          color: Color.fromARGB(255, 66, 66, 66),
          child: Icon(
            icon,
            size: 25,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}