import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icon.dart';
import 'package:whools/src/services/UrlLauncher.dart';
import 'package:whools/src/widgets/Widgets/ResponsiveWidget.dart';
import 'package:whools/src/widgets/Widgets/hexcolor.dart';

class MarkDownCode extends StatefulWidget {
  const MarkDownCode(
      {super.key,
      required this.title,
      required this.categoria,
      required this.markdown,
      required this.linkrepo,
      required this.img});
  final String title;
  final String categoria;
  final String? linkrepo;
  final String? img;
  final String markdown;
  @override
  State<MarkDownCode> createState() => _MarkDownCodeState();
}

class _MarkDownCodeState extends State<MarkDownCode> {
  late Map<String, TextStyle> githubGistTheme;

  @override
  Widget build(BuildContext context) {
    final repo = widget.linkrepo;
    final height = MediaQuery.of(context).size.height;
    String? title = widget.title.replaceAll(' ', '-');
    String? categoria = widget.categoria;
    String? url = "https://whools.web.app/#/TechHub/$categoria/$title";

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(children: [
            ResponsiveWidget.isSmallScreen(context)
                ? const SizedBox()
                : Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: height,
                      child: const Column(
                        children: [],
                      ),
                    )),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  width: ResponsiveWidget.isMediumScreen(context) ? 300 : 400,
                  child: Text(
                    widget.title,
                    textAlign: TextAlign.start,
                    maxLines: 6,
                    style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize:
                            ResponsiveWidget.isSmallScreen(context) ? 20 : 35),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: CachedNetworkImage(imageUrl: widget.img ?? ""),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                MarkdownBody(
                  shrinkWrap: true,
                  styleSheet: MarkdownStyleSheet(
                      h1: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                      em: TextStyle(
                        color: Colors.grey[300]
                      ),
                      del:  TextStyle(
                        color: Colors.grey[300]
                      ),
                      blockquote:  TextStyle(
                        color: Colors.grey[300]
                      ),
                      listBullet: TextStyle(
                        color: Colors.blue
                      ),
                      orderedListAlign: WrapAlignment.center,
                      p: GoogleFonts.roboto(color: Colors.white, fontSize: 15),
                      a: GoogleFonts.roboto(color: Colors.white, fontSize: 15),
                      strong:
                          const TextStyle(fontSize: 20, color: Colors.white),
                      code: GoogleFonts.openSans(
                        backgroundColor: Colors.transparent,
                        fontSize: 15,
                        color: Colors.white
                      ),
                      codeblockDecoration: BoxDecoration(
                          color: HexColor("1e1e1e"),
                          borderRadius: BorderRadius.circular(20))),
                  data: widget.markdown,
                ),
                const SizedBox(
                  height: 20,
                ),
                if (repo!.isNotEmpty) ...{
                  ResponsiveWidget.isSmallScreen(context)
                      ? ListTile(
                          leading: const LineIcon.github(
                            color: Colors.white,
                            size: 30,
                          ),
                          onTap: () {
                            launchSocialNetwork(repo);
                          },
                          title: Text(
                            "Github Repository",
                            style: GoogleFonts.silkscreen(color: Colors.white),
                          ),
                          subtitle: Text(
                            repo,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        )
                      : ListTile(
                          leading: const LineIcon.github(
                            color: Colors.white,
                            size: 30,
                          ),
                          onTap: () {
                            launchSocialNetwork(repo);
                          },
                          title: Text(
                            "Github Repository",
                            style: GoogleFonts.silkscreen(color: Colors.white),
                          ),
                          subtitle: Text(
                            repo,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        )
                }
              ],
            )),
            ResponsiveWidget.isSmallScreen(context)
                ? const SizedBox()
                : Expanded(
                    flex: 1,
                    child: Container(
                        alignment: Alignment.center,
                       )),
          ]),
        ),
      ),
    );
  }
}
