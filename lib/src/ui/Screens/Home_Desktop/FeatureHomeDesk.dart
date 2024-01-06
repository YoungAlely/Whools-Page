import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:whools/src/providers/theme_model.dart';
import 'package:whools/src/utils/Strings.dart';

class FeatureHomeDesktop extends StatefulWidget {
  const FeatureHomeDesktop({super.key, required this.scrollController});
  final ScrollController scrollController;

  @override
  State<FeatureHomeDesktop> createState() => _FeatureHomeDesktopState();
}

class _FeatureHomeDesktopState extends State<FeatureHomeDesktop> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final themeProvider = Provider.of<ThemeModel>(context, listen: true);
    return Padding(
        padding: EdgeInsets.only(
          top: screenSize.height / 15,
          left: screenSize.width / 25,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 600,
                      child: DefaultTextStyle(
                          style: GoogleFonts.silkscreen(
                              color: themeProvider.WhiteAndBlack, fontSize: 50),
                          child: AnimatedTextKit(
                              totalRepeatCount: 1,
                              animatedTexts: [
                                TyperAnimatedText(Celebrating,
                                    speed: Duration(milliseconds: 100))
                              ])),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 600,
                          child: Row(
                            children: [
                              Text(
                                "Somos",
                                style: GoogleFonts.silkscreen(
                                  color: themeProvider.WhiteAndBlack,
                                  fontSize: 35,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                height: 50,
                                child: DefaultTextStyle(
                                    softWrap: true,
                                    style: GoogleFonts.silkscreen(
                                      color: themeProvider.WhiteAndBlack,
                                      fontSize: 35,
                                    ),
                                    child: AnimatedTextKit(
                                      stopPauseOnTap: true,
                                      isRepeatingAnimation: true,
                                      repeatForever: true,
                                      animatedTexts: [
                                        RotateAnimatedText('Programadores'),
                                        RotateAnimatedText('Designers'),
                                        RotateAnimatedText('CyberSecurity'),
                                        RotateAnimatedText('UX Design'),
                                        RotateAnimatedText('Whools Team'),
                                        RotateAnimatedText('Video games'),
                                        RotateAnimatedText('Java Developers'),
                                        RotateAnimatedText(
                                            'Flutter Developers'),
                                      ],
                                    )),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    height: 300,
                    child: CachedNetworkImage(
                      imageUrl:
                          "https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExaXdpaWE0MWI2b2FpMjBsN2k3ajNhMTVlNXVwM2NudWdjY2R2eDN3YiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9cw/eCF4fYde8WS0CsZRBC/giphy-downsized-large.gif",
                    ),
                  ),
                )
              ],
            ),
            AnimatedButton(
              height: 30,
              width: 200,
              isReverse: true,
              textStyle: GoogleFonts.silkscreen(
                color: themeProvider.WhiteAndBlack,
              ),
              selectedTextColor: themeProvider.BlackAndWhite,
              text: 'Ver Eventos',
              onPress: () {
                widget.scrollController.animateTo(3000,
                    duration: Duration(milliseconds: 1200),
                    curve: Curves.easeIn);
              },
              selectedText: 'Sí, Somos Whools?',
              selectedBackgroundColor: themeProvider.WhiteAndBlack,
              borderRadius: 10,
              borderColor: themeProvider.WhiteAndBlack,
              backgroundColor: themeProvider.BlackAndWhite,
            )
          ],
        ));
  }
}
