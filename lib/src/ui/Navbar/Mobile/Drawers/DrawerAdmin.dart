import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icon.dart';
import 'package:whools/src/widgets/Widgets/hexcolor.dart';

class DrawerAdmin extends StatefulWidget {
  const DrawerAdmin({super.key, required this.onItemSelected});
  final Function(int) onItemSelected;

  @override
  State<DrawerAdmin> createState() => _DrawerAdminState();
}

class _DrawerAdminState extends State<DrawerAdmin> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: HexColor('141414'),
      child: ListView(
        shrinkWrap: true,
        children: [
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListTile(
                  titleAlignment: ListTileTitleAlignment.center,
                  leading: IconButton(
                      onPressed: () => Navigator.pop(context), icon: LineIcon.windowClose(color: Colors.white,),
                      ),
                  title: Text("Whools?", style: GoogleFonts.silkscreen(
                    color: Colors.white, fontWeight: FontWeight.bold
                  ),)
                ),
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(
                    "assets/whools.png",
                  ),
                )
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              FontAwesomeIcons.calendarCheck,
              color: Colors.white,
            ),
            title: Text("Subir Eventos"),
            onTap: () {
              widget.onItemSelected(0);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              FontAwesomeIcons.barsProgress,
              color: Colors.white,
            ),
            title: Text("Subir Proyectos"),
            onTap: () {
              widget.onItemSelected(1);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              FontAwesomeIcons.terminal,
              color: Colors.white,
            ),
            title: Text("Subir Codigo"),
            onTap: () {
              widget.onItemSelected(2);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
