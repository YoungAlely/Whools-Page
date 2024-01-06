import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:whools/src/providers/theme_model.dart';
import 'package:whools/src/services/UrlLauncher.dart';
import 'package:whools/src/utils/Strings.dart';
import 'package:whools/src/widgets/Widgets/IconWidget.dart';
import 'package:whools/src/widgets/Widgets/hexcolor.dart';

class ItemDrawer extends StatefulWidget {
  const ItemDrawer({super.key, required this.scrollController});
  final ScrollController scrollController;

  @override
  State<ItemDrawer> createState() => _ItemDrawerState();
}

class _ItemDrawerState extends State<ItemDrawer> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeModel>(context, listen: true);

    return Drawer(
      width: 280,
      elevation: 10,
      backgroundColor: themeProvider.BlackAndWhite,
      shape:
          const RoundedRectangleBorder(side: BorderSide(color: Colors.black)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: ListView(
          shrinkWrap: true,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      LineIcons.windowClose,
                      color: themeProvider.WhiteAndBlack,
                    )),
                Text('Whools? Team',
                    style: GoogleFonts.silkscreen(
                        color: themeProvider.WhiteAndBlack, fontSize: 25)),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              WhoisWhool,
              maxLines: 3,
              style: GoogleFonts.josefinSans(
                  color: themeProvider.WhiteAndBlack,
                  fontSize: 15,
                  fontWeight: FontWeight.w400),
            ),
            ListTile(
              trailing: Icon(
                LineIcons.home,
                color: themeProvider.WhiteAndBlack,
              ),
              onTap: () {
                widget.scrollController.animateTo(20.0,
                    duration: const Duration(milliseconds: 1200),
                    curve: Curves.easeIn);
                Navigator.pop(context);
              },
              title: Text(
                "Inicio",
                style: TextStyle(
                    color: themeProvider.WhiteAndBlack,
                    fontWeight: FontWeight.w400),
              ),
            ),
            ListTile(
              trailing: Icon(
                LineIcons.video,
                color: themeProvider.WhiteAndBlack,
              ),
              onTap: () {
                widget.scrollController.animateTo(800.0,
                    duration: const Duration(milliseconds: 1200),
                    curve: Curves.easeIn);
                Navigator.pop(context);
              },
              title: Text(
                "Sobre Nosotros",
                style: TextStyle(
                    color: themeProvider.WhiteAndBlack,
                    fontWeight: FontWeight.w400),
              ),
            ),
            ListTile(
              trailing: Icon(
                LineIcons.terminal,
                color: themeProvider.WhiteAndBlack,
              ),
              onTap: () {
                widget.scrollController.animateTo(2900.0,
                    duration: const Duration(milliseconds: 1200),
                    curve: Curves.easeIn);
                Navigator.pop(context);
              },
              title: Text(
                "Proyectos",
                style: TextStyle(
                    color: themeProvider.WhiteAndBlack,
                    fontWeight: FontWeight.w400),
              ),
            ),
            ListTile(
              trailing: Icon(
                LineIcons.gamepad,
                color: themeProvider.WhiteAndBlack,
              ),
              onTap: () {
                widget.scrollController.animateTo(4000.0,
                    duration: const Duration(milliseconds: 1200),
                    curve: Curves.easeIn);
                Navigator.pop(context);
              },
              title: Text(
                "Eventos",
                style: TextStyle(
                    color: themeProvider.WhiteAndBlack,
                    fontWeight: FontWeight.w400),
              ),
            ),
            ListTile(
              trailing: Icon(
                LineIcons.terminal,
                color: themeProvider.WhiteAndBlack,
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: themeProvider.BlackAndWhite,
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CachedNetworkImage(
                              imageUrl: "https://i.redd.it/n8cjejuoea8y.gif"),
                          const SizedBox(height: 16),
                          DefaultTextStyle(
                              style: GoogleFonts.silkscreen(
                                  color: themeProvider.WhiteAndBlack,
                                  fontSize: 15),
                              child: AnimatedTextKit(animatedTexts: [
                                TyperAnimatedText('Cargando base de datos....'),
                                TyperAnimatedText('Redirigiendo....'),
                              ])),
                        ],
                      ),
                    );
                  },
                );
                Future.delayed(Duration(seconds: 5), () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/TechHub');
                });
              },
              title: Text(
                "Tech Hub",
                style: TextStyle(
                    color: themeProvider.WhiteAndBlack,
                    fontWeight: FontWeight.w400),
              ),
            ),

            /* */
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      launchSocialNetwork("https://discord.gg/aMBDBsgrCd");
                      Navigator.pop(context);
                    },
                    disabledColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    icon: IconsDrawer(
                      color: HexColor("4267B2"),
                      icon: LineIcons.discord,
                    )),
                IconButton(
                    onPressed: () {
                      launchSocialNetwork(
                          "https://www.instagram.com/bywhools/");
                    },
                    hoverColor: Colors.transparent,
                    icon: IconsDrawer(
                      color: HexColor("E1306C"),
                      icon: LineIcons.instagram,
                    )),
                IconButton(
                    onPressed: () {
                      launchSocialNetwork("https://github.com/ByWhools");
                    },
                    hoverColor: Colors.transparent,
                    icon: const IconsDrawer(
                      color: Colors.black,
                      icon: LineIcons.github,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }

  String? imageUrl;
  String? username;
  @override
  void initState() {
    super.initState();
    userData();
  }

  Future<void> userData() async {
    final user = FirebaseAuth.instance.currentUser;
    final userId = user?.uid;
    if (userId != null) {
      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
          .collection("Users")
          .doc(userId)
          .get();
      if (userSnapshot.exists) {
        Map<String, dynamic> userData =
            userSnapshot.data() as Map<String, dynamic>;
        if (mounted) {
          setState(() {
            imageUrl = userData['imageUrl'];
            username = userData['username'];
          });
        }
      }
    }
  }
}
