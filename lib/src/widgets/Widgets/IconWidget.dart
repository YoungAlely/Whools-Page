import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:whools/src/widgets/Widgets/hexcolor.dart';

class IconWidget extends StatefulWidget {
  const IconWidget({
    Key? key,
    required this.icon,
    required this.color,
    this.ontap

  }) : super(key: key);
  final Color color;
  final IconData icon;
  final VoidCallbackAction? ontap;

  @override
  _IconsDrawerState createState() => _IconsDrawerState();
}

class _IconsDrawerState extends State<IconsDrawer> {
  Color contCol = Colors.white;
  Color iconCol = Colors.black;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 30,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (a) {
          setState(() {
            contCol = widget.color;
            iconCol = Colors.white;
          });
        },
        onExit: (a) {
          setState(() {
            contCol = Colors.white;
            iconCol = Colors.black;
          });
        },
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 1000),
                width: 86,
                height: 96,
                decoration: BoxDecoration(
                  color: contCol,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                child: FaIcon(
                  widget.icon,
                  color: iconCol,
                  size: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class IconsDrawer extends StatefulWidget {
  const IconsDrawer({
    Key? key,
    required this.icon,
    required this.color,
    this.ontap

  }) : super(key: key);
  final Color color;
  final IconData icon;
  final VoidCallbackAction? ontap;

  @override
  _IconsDrawerState createState() => _IconsDrawerState();
}

class _IconWidgetState extends State<IconsDrawer> {
  Color contCol = Colors.white;
  Color iconCol = Colors.black;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 30,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (a) {
          setState(() {
            contCol = widget.color;
            iconCol = Colors.white;
          });
        },
        onExit: (a) {
          setState(() {
            contCol = Colors.white;
            iconCol = Colors.black;
          });
        },
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 1000),
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: contCol,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: AnimatedContainer(
           
                duration: const Duration(milliseconds: 300),
                child: FaIcon(
                  widget.icon,
                  color: iconCol,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


