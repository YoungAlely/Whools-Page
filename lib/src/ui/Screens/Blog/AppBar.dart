import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:whools/src/providers/theme_model.dart';
import 'package:whools/src/widgets/Widgets/ResponsiveWidget.dart';

class AppbarBlog extends StatefulWidget {
  const AppbarBlog({super.key});

  @override
  State<AppbarBlog> createState() => _AppbarBlogState();
}

class _AppbarBlogState extends State<AppbarBlog> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeModel>(context, listen: true);
    return ResponsiveWidget.isSmallScreen(context)
        ? AppBar(
            automaticallyImplyLeading: false,
            forceMaterialTransparency: true,
            elevation: 0,
            title: InkWell(
              onTap: () => Navigator.pushNamed(context, "/"),
              child: DefaultTextStyle(
                  style:
                      GoogleFonts.silkscreen(color: Colors.white, fontSize: 25),
                  child: AnimatedTextKit(
                      pause: Duration(seconds: 5),
                      repeatForever: false,
                      totalRepeatCount: 1,
                      animatedTexts: [
                        TyperAnimatedText('Whools?'),
                        TyperAnimatedText(
                            'Sí, utilizamos Copilot. No es sorprendente, ¿verdad?',
                            textStyle: TextStyle(fontSize: 12)),
                        TyperAnimatedText('Githuuuuub',
                            textStyle: TextStyle(fontSize: 25)),
                        TyperAnimatedText('¿En Movil o Responsive?',
                            textStyle: TextStyle(fontSize: 12)),
                        TyperAnimatedText('Whools? Bueno, estamos por delante ',
                            textStyle: TextStyle(fontSize: 12)),
                        TyperAnimatedText('🐣 ¡Whools! ¿Esperabas algo menos?',
                            textStyle: TextStyle(fontSize: 12)),
                        TyperAnimatedText('No somos comunes, somos Whools?',
                            textStyle: TextStyle(fontSize: 12)),
                        TyperAnimatedText('En Whools, lideramos, no seguimos.',
                            textStyle: TextStyle(fontSize: 12)),
                        TyperAnimatedText('Whools?'),
                      ])),
            ),
          )
        : AppBar(
            automaticallyImplyLeading: false,
            forceMaterialTransparency: true,
            elevation: 10,
            title: InkWell(
              onTap: (){
                Navigator.pushNamed(context, "/");
              },
              child: DefaultTextStyle(
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
                        TyperAnimatedText('TechHub? ',
                            textStyle: const TextStyle(fontSize: 20)),
                        TyperAnimatedText('Flutter o HTML? idk',
                            textStyle: const TextStyle(fontSize: 20)),
                        TyperAnimatedText('🐣 ¡Whools! ¿Esperabas algo menos?',
                            textStyle: const TextStyle(fontSize: 20)),
                        TyperAnimatedText('OwO',
                            textStyle: const TextStyle(fontSize: 20)),
                        TyperAnimatedText('En Whools, lideramos, no seguimos.',
                            textStyle: const TextStyle(fontSize: 20)),
                        TyperAnimatedText('Whools?'),
                      ])),
            ),
          );
  }
}
