import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:whools/src/providers/theme_model.dart';
import 'package:whools/src/services/Storage.dart';
import 'package:whools/src/utils/Strings.dart';

class AboutDesktop extends StatefulWidget {
  const AboutDesktop({super.key, required this.screenSize});
  final Size screenSize;

  @override
  State<AboutDesktop> createState() => _AboutDesktopState();
}

class _AboutDesktopState extends State<AboutDesktop> {
  @override
  Widget build(BuildContext context) {
    final screenSize = widget.screenSize;
    final themeProvider = Provider.of<ThemeModel>(context, listen: true);
    return Padding(
      padding: EdgeInsets.only(
        top: screenSize.height * 0.06,
        left: screenSize.width / 30,
        right: screenSize.width / 11,
      ),
      child: Column(
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
                "About Us;",
                style: GoogleFonts.silkscreen(
                    color: themeProvider.WhiteAndBlack,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 600,
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: AboutTeam,
                      style: GoogleFonts.notoSans(
                        color: themeProvider.WhiteAndBlack,
                      )),
                  TextSpan(
                      text: AboutUs,
                      style: GoogleFonts.notoSans(
                        color: themeProvider.WhiteAndBlack,
                      ))
                ])),
              ),
              const SizedBox(
                width: 100,
              ),
              Flexible(
                  child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  "assets/whools_team.png",
                ),
              ))
            ],
          ),
          const SizedBox(height: 30,),
          AnimatedButton(
            textAlignment: Alignment.center,
            animatedOn: AnimatedOn.onHover,
            transitionType: TransitionType.LEFT_BOTTOM_ROUNDER,
            width: 150,
            height: 40,
            backgroundColor: themeProvider.BlackAndWhite,
            borderRadius: BorderSide.strokeAlignInside,
            borderColor: themeProvider.WhiteAndBlack,
            text: 'Ver Galeria',
            onPress: () {
              showGalleryDialog(context);
            },
            textStyle: GoogleFonts.silkscreen(
              color: themeProvider.WhiteAndBlack,
            ),
          )
        ],
      ),
    );
  }
}
