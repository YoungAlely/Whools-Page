import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:whools/src/widgets/customs/swichTheme.dart';
import 'package:whools/src/providers/theme_model.dart';
import 'package:whools/src/ui/LeadingPage.dart';

class AppBarMobile extends StatefulWidget {
  const AppBarMobile({super.key});

  @override
  State<AppBarMobile> createState() => _AppBarMobileState();
}

class _AppBarMobileState extends State<AppBarMobile> {
  String aletorio = "";
  late Timer timer;

  @override
  void dispose() {
    super.dispose();
    aletorio;
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeModel>(context, listen: true);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 6),
      child: AppBar(
        automaticallyImplyLeading: false,
        forceMaterialTransparency: true,
        elevation: 0,
        leadingWidth: 100,
        title: DefaultTextStyle(
            style: GoogleFonts.silkscreen(
                fontSize: 15, color: themeProvider.WhiteAndBlack),
            child: AnimatedTextKit(
                pause: Duration(seconds: 5),
                repeatForever: false,
                totalRepeatCount: 1,
                animatedTexts: [
                  TyperAnimatedText('Whools?'),
                  TyperAnimatedText(
                      'Sí, utilizamos Copilot. No es sorprendente, ¿verdad?',
                      textStyle: const TextStyle(fontSize: 15)),
                  TyperAnimatedText('Githuuuuub'),
                  TyperAnimatedText('¿Lenguaje favorito? COBOL XD',
                      textStyle: const TextStyle(fontSize: 12)),
                  TyperAnimatedText('¿Whools? Bueno, estamos por delante ',
                      textStyle: const TextStyle(fontSize: 12)),
                  TyperAnimatedText('OpenSource is life',
                      textStyle: const TextStyle(fontSize: 12)),
                  TyperAnimatedText('Nos encantan los VideoJuegos',
                      textStyle: const TextStyle(fontSize: 12)),
                  TyperAnimatedText('Bard >>>>>>> GPT',
                      textStyle: const TextStyle(fontSize: 12)),
                      TyperAnimatedText('50% GPT, 50% Whools?',
                      textStyle: const TextStyle(fontSize: 12)),
                  TyperAnimatedText('En Whools, lideramos, no seguimos.',
                      textStyle: const TextStyle(fontSize: 12)),
                      TyperAnimatedText('Es mejor la versión Desktop  ',
                      textStyle: const TextStyle(fontSize: 12)),
                  TyperAnimatedText('Whools?'),
                ])),
        actions: [
          ThemeSwitcher(themeProvider: themeProvider),
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                  tooltip: "How to sell D*** Online Fast?",
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  icon: Icon(
                    FontAwesomeIcons.list,
                    color: themeProvider.WhiteAndBlack,
                    size: 20,
                  ));
            },
          )
        ],
      ),
    );
  }
}
