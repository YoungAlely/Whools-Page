import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whools/src/services/PageView.dart';
import 'package:whools/src/widgets/Widgets/IconWidget.dart';
import 'package:whools/src/widgets/Widgets/ResponsiveWidget.dart';
import 'package:whools/src/widgets/Widgets/hexcolor.dart';

class CardTeam extends StatefulWidget {
  final Color color;
  final Color colorCard;
  final Color colorText;
  final String name;
  final String? asignacion;
  final String assets;
  final String? facebookUrl;
  final String? tiktokurl;
  final String? instagramUrl;
  final String? linkedlnUrl;
  final String? twitterUrl;
  final String? youtubeUrl;
  final String? portafolio;
  final Icon? tiktok;
  final Icon? facebook;
  final Icon? linkedln;
  final Icon? twitter;
  final Icon? instagram;
  final Icon? youtube;
  final String aboutUs;
  final String gif;
  const CardTeam({
    super.key,
    required this.gif,
    required this.color,
    required this.colorCard,
    required this.colorText,
    required this.name,
    this.asignacion,
    required this.assets,
    this.facebookUrl,
    this.tiktokurl,
    this.instagramUrl,
    this.linkedlnUrl,
    this.twitterUrl,
    this.youtubeUrl,
    this.tiktok,
    this.facebook,
    this.linkedln,
    this.twitter,
    this.instagram,
    this.youtube,
    this.portafolio,
    required this.aboutUs,
  });

  @override
  _CardTeamState createState() => _CardTeamState();
}

class _CardTeamState extends State<CardTeam> {
  bool isCardVisible = false;

  @override
  void dispose() {
    isCardVisible;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: SizedBox(
          width: 200,
          height: 350,
          child: Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: widget.color),
              borderRadius: BorderRadius.circular(4),
            ),
            color: widget.colorCard,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(
                    widget.assets,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.name,
                  style: GoogleFonts.josefinSans(
                    color: widget.colorText,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.asignacion ?? "",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inclusiveSans(
                    color: widget.colorText,
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (widget.facebook != null)
                      TextButton(
                        onPressed: () {
                          launchSocialNetwork(widget.facebookUrl ?? "");
                        },
                        child: IconsDrawer(
                          icon: FontAwesomeIcons.facebook,
                          color: HexColor("4267B2"),
                        ),
                      ),
                    if (widget.linkedln != null)
                      TextButton(
                        onPressed: () {
                          launchSocialNetwork(widget.linkedlnUrl ?? "");
                        },
                        child: IconsDrawer(
                          icon: FontAwesomeIcons.linkedin,
                          color: HexColor("0077b5"),
                        ),
                      ),
                    if (widget.twitter != null)
                      TextButton(
                        onPressed: () {
                          launchSocialNetwork(widget.twitterUrl ?? "");
                        },
                        child: IconsDrawer(
                          icon: FontAwesomeIcons.twitter,
                          color: HexColor("405DE6"),
                        ),
                      ),
                    if (widget.instagram != null)
                      TextButton(
                        onPressed: () {
                          launchSocialNetwork(widget.instagramUrl ?? "");
                        },
                        child: IconsDrawer(
                          icon: FontAwesomeIcons.instagram,
                          color: HexColor("E1306C"),
                        ),
                      ),
                    if (widget.tiktok != null)
                      TextButton(
                        onPressed: () {
                          launchSocialNetwork(widget.tiktokurl ?? "");
                        },
                        child: const IconsDrawer(
                          icon: FontAwesomeIcons.tiktok,
                          color: Colors.black,
                        ),
                      ),
                    if (widget.youtube != null)
                      TextButton(
                        onPressed: () {
                          launchSocialNetwork(widget.youtubeUrl ?? "");
                        },
                        child: const IconsDrawer(
                          icon: LineIcons.youtube,
                          color: Colors.black,
                        ),
                      ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                AnimatedButton(
                    transitionType: TransitionType.BOTTOM_TO_TOP,
                    key: UniqueKey(),
                    backgroundColor: widget.colorCard,
                    borderRadius: 20,
                    width: 80,
                    animatedOn: AnimatedOn.onHover,
                    height: 40,
                    borderColor: widget.colorText,
                    isReverse: true,
                    textStyle: GoogleFonts.silkscreen(
                      color: widget.colorText,
                    ),
                    text: 'Ver mas',
                    onPress: () => ispressed())
              ],
            ),
          )),
    );
  }

  void launchSocialNetwork(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se pudo lanzar $url';
    }
  }

  void ispressed() {
    ResponsiveWidget.isSmallScreen(context)
        ? showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: widget.colorCard,
                content: SizedBox(
                  height: 500,
                  width: 400,
                  child: Card(
                    key: UniqueKey(),
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: widget.color),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    color: widget.colorCard,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(LineIcons.windowClose,
                                    color: widget.colorText)),
                          ],
                        ),
                        CircleAvatar(
                            radius: 60,
                            backgroundImage: widget.gif.isNotEmpty
                                ? NetworkImage(
                                    widget.gif,
                                  )
                                : const NetworkImage(
                                    "https://media.giphy.com/media/26tn33aiTi1jkl6H6/giphy.gif")),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.name,
                          style: GoogleFonts.josefinSans(
                            color: widget.colorText,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.5),
                          child: Text(
                            widget.aboutUs,
                            style: TextStyle(
                              color: widget.colorText,
                            ),
                          ),
                        ),
                        if (widget.portafolio != null)
                          const SizedBox(
                            height: 20,
                          ),
                          const SizedBox(height: 30,),
                        TextButton(
                            onPressed: () {
                              launchSocialNetwork(widget.portafolio ?? "");
                            },
                            child: Text(
                              "Ver portafolio",
                              style: GoogleFonts.silkscreen(
                                  color: widget.colorText),
                            )),
                      ],
                    ),
                  ),
                ),
              );
            },
          )
        : showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: widget.colorCard,
                content: SizedBox(
                  height: 500,
                  width: 400,
                  child: Card(
                    key: UniqueKey(),
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: widget.color),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    color: widget.colorCard,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(LineIcons.windowClose,
                                    color: widget.colorText)),
                          ],
                        ),
                        CircleAvatar(
                            radius: 60,
                            backgroundImage: widget.gif.isNotEmpty
                                ? NetworkImage(
                                    widget.gif,
                                  )
                                : const NetworkImage(
                                    "https://media.giphy.com/media/26tn33aiTi1jkl6H6/giphy.gif")),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.name,
                          style: GoogleFonts.josefinSans(
                            color: widget.colorText,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.5),
                          child: Text(
                            widget.aboutUs,
                            style: TextStyle(
                              color: widget.colorText,
                            ),
                          ),
                        ),
                        if (widget.portafolio != null)
                          TextButton(
                              onPressed: () {
                                launchSocialNetwork(widget.portafolio ?? "");
                              },
                              child: Text(
                                "Ver portafolio",
                                style: GoogleFonts.silkscreen(
                                    color: widget.colorText),
                              )),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
  }
}
