import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:whools/src/providers/theme_model.dart';
import 'package:whools/src/utils/Strings.dart';
import 'package:whools/src/widgets/customs/CardTeam.dart';
import 'package:whools/src/widgets/Widgets/hexcolor.dart';

class TeamDesktop extends StatefulWidget {
  const TeamDesktop({super.key, required this.screenSize});
  final Size screenSize;

  @override
  State<TeamDesktop> createState() => _TeamDesktopState();
}

class _TeamDesktopState extends State<TeamDesktop> {
  @override
  Widget build(BuildContext context) {
    final screenSize = widget.screenSize;
    final themeProvider = Provider.of<ThemeModel>(context, listen: true);

    return Padding(
      padding: EdgeInsets.only(
        top: screenSize.width * 0.06,
        left: screenSize.height / 15,
        right: screenSize.height / 15,
      ),
      child: Column(
        children: [
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 25,
                    height: 2,
                    decoration: BoxDecoration(
                        color: themeProvider.WhiteAndBlack,
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Team;",
                    style: GoogleFonts.silkscreen(
                        color: themeProvider.WhiteAndBlack,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
              Center(
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 20,
                  alignment: WrapAlignment.spaceBetween,
                  children: [
                    CardTeam(
                      gif: "https://i.gifer.com/77d5.gif",
                      aboutUs: AlejandroUs,
                      portafolio: "https://youngalely.web.app/",
                      color: themeProvider.WhiteAndBlack,
                      colorCard: HexColor("343a40"),
                      colorText: Colors.white,
                      name: 'Alejandro Ramirez',
                      facebookUrl:
                          "https://facebook.com/profile.php?id=100093304511136&mibextid=ZbWKwL",
                      instagramUrl: "https://www.instagram.com/young_alely/",
                      tiktokurl: "https://www.tiktok.com/@young_lely",
                      tiktok: const Icon(FontAwesomeIcons.tiktok),
                      asignacion: "Cofundador\nFlutter Developer",
                      facebook: const Icon(LineIcons.facebook),
                      instagram: const Icon(
                        LineIcons.instagram,
                      ),
                      assets: "assets/myFaces.png",
                    ),
                    CardTeam(
                        gif:
                            "https://media.giphy.com/media/SVCSsoKU5v6ZJLk07n/giphy.gif",
                        portafolio: 'https://www.kalidcabrera.com',
                        aboutUs: kalidUs,
                        color: themeProvider.WhiteAndBlack,
                        colorCard: Colors.black,
                        colorText: Colors.white,
                        name: 'Kalid Cabrera',
                        asignacion: "Cofundador\nCyberSecurity",
                        facebook: Icon(LineIcons.facebook),
                        linkedln: Icon(LineIcons.linkedin),
                        instagram: Icon(LineIcons.instagram),
                        linkedlnUrl: "https://www.linkedin.com/in/kalidcab/",
                        instagramUrl: "https://www.instagram.com/kalcabrera/",
                        facebookUrl:
                            "https://www.facebook.com/search/top?q=kalid%20cabrera",
                        assets: "assets/kalid.png"),
                    CardTeam(
                        gif: AldrichGif,
                        aboutUs: AldrichUs,
                        color: themeProvider.WhiteAndBlack,
                        colorCard: HexColor("ae0000"),
                        colorText: Colors.white,
                        name: 'Aldrich Guzman',
                        asignacion: "Cofundador\nGamer Developer",
                        twitterUrl:
                            "https://twitter.com/LuisAldrichGuz?t=K3DrIaSaPm3IlZWHqafQFg&s=09",
                        youtube: Icon(LineIcons.youtube),
                        youtubeUrl:
                            "https://www.youtube.com/channel/UC8MhHn1cHk9K8sBFGr4fUog",
                        instagramUrl:
                            "https://www.instagram.com/luisaldrichguz/",
                        instagram: Icon(
                          LineIcons.instagram,
                        ),
                        twitter: Icon(LineIcons.twitter),
                        assets: "assets/aldrich.png"),
                    CardTeam(
                        gif:
                            "https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExNmEzcTBseW53YWE2cnRyMzBybWhrMm01YXc2aXNtOXBqY3NkaXhoNiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/rOTGSPxvJJY7m/giphy.gif",
                        aboutUs: Frankieus,
                        color: themeProvider.WhiteAndBlack,
                        colorCard: HexColor("F5EBE1"),
                        colorText: Colors.black,
                        name: 'Francisco López',
                        asignacion: "Designer",
                        linkedln: Icon(LineIcons.linkedin),
                        linkedlnUrl:
                            "https://www.linkedin.com/authwall?trk=gf&trkInfo=AQGCwb7u9H8YYAAAAYrPs2xIjgNVXcL75bwoTcOEWktdzTiaZN3StjfOSQKvvc6iUlfwyATDixoU4YDZTVlt5fOVQ2SmlFubGbToyCqfOrjYhRfO1bcXyZLf9xLFI_OVSBdMJFg=&original_referer=https://linktr.ee/&sessionRedirect=https%3A%2F%2Fwww.linkedin.com%2Fin%2Ffrancisco-manuel-l%25C3%25B3pez-de-la-cruz-b517421b8%2F",
                        instagramUrl:
                            "https://instagram.com/fstudiospeproject?igshid=YTQwZjQ0NmI0OA==",
                        instagram: const Icon(
                          LineIcons.instagram,
                        ),
                        assets: "assets/Francisco.png"),
                    CardTeam(
                        gif:
                            "https://media.discordapp.net/attachments/1184487907998838887/1186136153548664872/giphy.gif?ex=65922660&is=657fb160&hm=bb4f4cb27c1eeb4de5eca6214f463749f42e3523139e35424d17ae81e8048aa5&=",
                        aboutUs: DamianUs,
                        color: themeProvider.WhiteAndBlack,
                        colorCard: HexColor("4C21A1"),
                        colorText: Colors.white,
                        name: 'Damian Torres',
                        asignacion: "Vicepresidente de Software",
                        linkedln: const Icon(LineIcons.linkedin),
                        linkedlnUrl:
                            "https://www.linkedin.com/in/damiantorresmx/",
                        instagramUrl:
                            "https://www.instagram.com/damian.torres.11/",
                        instagram: const Icon(
                          LineIcons.instagram,
                        ),
                        assets: "assets/damian.jpg"),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
