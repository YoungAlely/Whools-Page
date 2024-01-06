import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:whools/src/providers/theme_model.dart';
import 'package:whools/src/ui/Screens/Home_Desktop/FeatureHomeDesk.dart';
import 'package:whools/src/utils/Strings.dart';

class FeatureHome extends StatefulWidget {
  const FeatureHome(
      {super.key, required this.screensize, required this.scrollController});
  final Size screensize;
  final ScrollController scrollController;

  @override
  State<FeatureHome> createState() => _FeatureHomeState();
}

class _FeatureHomeState extends State<FeatureHome> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = widget.screensize;
    final themeProvider = Provider.of<ThemeModel>(context, listen: true);

    return Padding(
        padding: EdgeInsets.only(
            top: screenSize.height * 0.02,
            left: screenSize.width / 15,
            right: screenSize.width / 15),
        child: screenSize.width < 800
            ? LayoutBuilder(
                builder: (context, constraints) {
                  final avaliableWidth = constraints.maxWidth;

                  return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: avaliableWidth,
                          child: DefaultTextStyle(
                              style: GoogleFonts.silkscreen(
                                  color: themeProvider.WhiteAndBlack,
                                  fontSize: avaliableWidth * 0.097),
                              child: AnimatedTextKit(
                                  totalRepeatCount: 1,
                                  animatedTexts: [
                                    TyperAnimatedText(Celebrating,
                                        speed:
                                            const Duration(milliseconds: 100))
                                  ])),
                        ),
                        SizedBox(
                          width: avaliableWidth,
                          child: Row(
                            children: [
                              Text(
                                "Somos",
                                style: GoogleFonts.silkscreen(
                                  color: themeProvider.WhiteAndBlack,
                                  fontSize: avaliableWidth * 0.060,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                height: 40,
                                child: DefaultTextStyle(
                                    softWrap: true,
                                    style: GoogleFonts.silkscreen(
                                      color: themeProvider.WhiteAndBlack,
                                      fontSize: avaliableWidth * 0.060,
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
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Container(
                            width: screenSize.width / 2,
                            height: screenSize.height / 2,
                            child: CachedNetworkImage(
                              imageUrl:
                                  "https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExaXdpaWE0MWI2b2FpMjBsN2k3ajNhMTVlNXVwM2NudWdjY2R2eDN3YiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9cw/eCF4fYde8WS0CsZRBC/giphy-downsized-large.gif",
                            )),
                        const SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AnimatedButton(
                              height: 30,
                              width: 200,
                              isReverse: true,
                              textStyle: GoogleFonts.silkscreen(
                                color: themeProvider.WhiteAndBlack,
                              ),
                              selectedTextColor: themeProvider.WhiteAndBlack,
                              text: 'Ver Eventos',
                              onPress: () {
                                widget.scrollController.animateTo(4000.0,
                                    duration:
                                        const Duration(milliseconds: 1200),
                                    curve: Curves.easeIn);
                              },
                              selectedText: 'Ya fuiste a eventos?',
                              selectedBackgroundColor: Colors.blue,
                              borderRadius: 10,
                              borderColor: themeProvider.WhiteAndBlack,
                              backgroundColor: themeProvider.BlackAndWhite,
                            ),
                          ],
                        ),
                      ]);
                },
              )
            : FeatureHomeDesktop(
                scrollController: widget.scrollController,
              ));
  }
}
