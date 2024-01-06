import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:whools/src/ui/Admin/Codigo/CodeCreate.dart';
import 'package:whools/src/ui/Admin/Eventos/EventsCreate.dart';
import 'package:whools/src/ui/Navbar/Mobile/Drawers/DrawerAdmin.dart';
import 'package:whools/src/widgets/Widgets/ResponsiveWidget.dart';
import 'package:whools/src/widgets/Widgets/hexcolor.dart';

class AdminMobile extends StatefulWidget {
  const AdminMobile({super.key});

  @override
  State<AdminMobile> createState() => _AdminMobileState();
}

class _AdminMobileState extends State<AdminMobile> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor("141414"),
        appBar: ResponsiveWidget.isSmallScreen(context)
            ? AppBar(
                actions: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Builder(builder: (BuildContext context) {
                          return IconButton(
                              onPressed: () {
                                Scaffold.of(context).openEndDrawer();
                              },
                              icon: const Icon(
                                FontAwesomeIcons.burger,
                                color: Colors.white,
                              ));
                        })
                      ],
                    ),
                  )
                ],
                forceMaterialTransparency: true,
                elevation: 0,
              )
            : null,
        body: Row(
          children: [
            ResponsiveWidget.isSmallScreen(context)
                ? const SizedBox()
                : Container(
                    width: 250,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white)),
                    child: Column(
                      children: [
                        const DrawerHeader(
                          child: Center(
                            child: CircleAvatar(
                              radius: 60,
                              backgroundImage: AssetImage("assets/whools.png"),
                            ),
                          ),
                        ),
                        Text(
                          "Bienvenido Administrador",
                          style: GoogleFonts.dmSans(color: Colors.grey[400]),
                        ),
                        ListTile(
                          leading: const Icon(
                            LineIcons.ad,
                            color: Colors.white,
                          ),
                          onTap: () {
                            setState(() {
                              _currentIndex = 0;
                            });
                          },
                          title: const Text("Eventos"),
                        ),
                        ListTile(
                          leading: const Icon(
                            LineIcons.terminal,
                            color: Colors.white,
                          ),
                          onTap: () {
                            setState(() {
                              _currentIndex = 1;
                            });
                          },
                          title: const Text("Codigo"),
                        ),
                        ListTile(
                          leading: const Icon(
                            LineIcons.outdent,
                            color: Colors.white,
                          ),
                          onTap: () {
                            setState(() {
                              _currentIndex = 2;
                            });
                          },
                          title: const Text("Cursos"),
                        ),
                        ListTile(
                          leading: const Icon(
                            LineIcons.bookOpen,
                            color: Colors.white,
                          ),
                          onTap: () {
                            setState(() {
                              _currentIndex = 3;
                            });
                          },
                          title: const Text("Proyectos"),
                        )
                      ],
                    ),
                  ),
            Expanded(child: _buildPage(_currentIndex))
          ],
        ),
        endDrawer: DrawerAdmin(
          onItemSelected: (index) {
            changePage(index);
          },
        ));
  }

  Widget _buildPage(int index) {
    switch (_currentIndex) {
      case 0:
        return const CreateEvent();
      case 1:
        return const CodeCreate();
      default:
        return const Text("");
    }
  }

  void changePage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
