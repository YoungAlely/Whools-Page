import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:whools/src/widgets/customs/swichTheme.dart';
import 'package:whools/src/providers/theme_model.dart';

class AppBarDesktop extends StatefulWidget {
  const AppBarDesktop({super.key, required this.scrollController});
  final ScrollController scrollController;

  @override
  State<AppBarDesktop> createState() => _AppBarDesktopState();
}

class _AppBarDesktopState extends State<AppBarDesktop> {
  String? imageUrl;
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
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: AppBar(
          automaticallyImplyLeading: false,
          forceMaterialTransparency: true,
          elevation: 0,
          leadingWidth: 400,
          title: DefaultTextStyle(
              style: GoogleFonts.silkscreen(
                  fontSize: 25, color: themeProvider.WhiteAndBlack),
              child: AnimatedTextKit(
                  pause: const Duration(seconds: 5),
                  repeatForever: false,
                  totalRepeatCount: 1,
                  animatedTexts: [
                    TyperAnimatedText('Whools?'),
                    TyperAnimatedText(
                        'Sí, utilizamos Copilot. No es sorprendente, ¿verdad?',
                        textStyle: const TextStyle(fontSize: 20)),
                    TyperAnimatedText('Githuuuuub'),
                    TyperAnimatedText('¿Lenguaje favorito? COBOL XD',
                        textStyle: const TextStyle(fontSize: 20)),
                    TyperAnimatedText('¿Whools? Bueno, estamos por delante ',
                        textStyle: const TextStyle(fontSize: 20)),
                    TyperAnimatedText('OpenSource is life',
                        textStyle: const TextStyle(fontSize: 20)),
                    TyperAnimatedText('Nos encantan los VideoJuegos',
                        textStyle: const TextStyle(fontSize: 20)),
                    TyperAnimatedText('Bard >>>>>>> GPT ',
                        textStyle: const TextStyle(fontSize: 20)),
                    TyperAnimatedText('50% GPT, 50% Whools?',
                        textStyle: const TextStyle(fontSize: 20)),
                    TyperAnimatedText('En Whools, lideramos, no seguimos.',
                        textStyle: const TextStyle(fontSize: 20)),
                    TyperAnimatedText('Whools?'),
                  ])),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                ThemeSwitcher(themeProvider: themeProvider),
                TextButton(
                    onPressed: () {
                      widget.scrollController.animateTo(40,
                          duration: const Duration(milliseconds: 1200),
                          curve: Curves.easeIn);
                    },
                    child: Text(
                      "Inicio",
                      style: TextStyle(
                          color: themeProvider.WhiteAndBlack,
                          fontWeight: FontWeight.bold),
                    )),
                TextButton(
                    onPressed: () {
                      widget.scrollController.animateTo(510,
                          duration: const Duration(milliseconds: 1200),
                          curve: Curves.easeIn);
                    },
                    child: Text(
                      "Sobre nosotros",
                      style: TextStyle(
                          color: themeProvider.WhiteAndBlack,
                          fontWeight: FontWeight.bold),
                    )),
                TextButton(
                    onPressed: () {
                      widget.scrollController.animateTo(1300,
                          duration: const Duration(milliseconds: 1200),
                          curve: Curves.easeIn);
                    },
                    child: Text(
                      "Proyectos",
                      style: TextStyle(
                          color: themeProvider.WhiteAndBlack,
                          fontWeight: FontWeight.bold),
                    )),
                TextButton(
                    onPressed: () {
                      widget.scrollController.animateTo(3000,
                          duration: const Duration(milliseconds: 1200),
                          curve: Curves.easeIn);
                    },
                    child: Text(
                      "Eventos",
                      style: TextStyle(
                          color: themeProvider.WhiteAndBlack,
                          fontWeight: FontWeight.bold),
                    )),
                TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: themeProvider.BlackAndWhite,
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CachedNetworkImage(
                                    imageUrl:
                                        "https://i.redd.it/n8cjejuoea8y.gif"),
                                const SizedBox(height: 16),
                                DefaultTextStyle(
                                    style: GoogleFonts.silkscreen(
                                        color: themeProvider.WhiteAndBlack,
                                        fontSize: 15),
                                    child: AnimatedTextKit(animatedTexts: [
                                      TyperAnimatedText('Cargando base de datos....'),
                                      TyperAnimatedText(
                                          'Redirigiendo....'),
                                    ])),
                              ],
                            ),
                          );
                        },
                      );
                      Future.delayed(const Duration(seconds: 3), () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/TechHub');
                      });
                    },
                    child: Text(
                      "Tech Hub",
                      style: TextStyle(
                          color: themeProvider.WhiteAndBlack,
                          fontWeight: FontWeight.bold),
                    )),
              ],
            )
          ],
        ));
  }
}
