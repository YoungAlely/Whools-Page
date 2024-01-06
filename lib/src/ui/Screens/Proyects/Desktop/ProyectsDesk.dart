import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:whools/src/providers/theme_model.dart';
import 'package:whools/src/utils/Strings.dart';
import 'package:whools/src/widgets/customs/GalleryProyects.dart';

class ProyectDesk extends StatefulWidget {
  const ProyectDesk({super.key, required this.screenSize});
  final Size screenSize;

  @override
  State<ProyectDesk> createState() => _ProyectDeskState();
}

class _ProyectDeskState extends State<ProyectDesk> {
  PageController? _controller;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      initialPage: _currentPage,
      viewportFraction: 0.8, // Cambiar el viewportFraction según necesites
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeModel>(context, listen: true);
    var screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(
        top: widget.screenSize.height * 0.09,
        left: widget.screenSize.width / 25,
        right: widget.screenSize.width / 15,
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
                "Proyectos;",
                style: GoogleFonts.silkscreen(
                    color: themeProvider.WhiteAndBlack,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 3,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 5.0,
            primary: true,
            children: [
              GalleryDesktop(
                themeProvider: themeProvider.WhiteAndBlack,
                textColors: themeProvider.BlackAndWhite,
                backgroundColor: themeProvider.AzulyMorado,
                borderColor: themeProvider.WhiteAndBlack,
                viewProyect: "Ir al Juego",
                nameProyect: "ITIZ University Roblox",
                description: UniversityRoblox,
                imageBucket:
                    "https://firebasestorage.googleapis.com/v0/b/whools-typing.appspot.com/o/Roblox.png?alt=media&token=7b0a81a3-849d-433b-8e42-76726c2ab2ac",
                textColor: themeProvider.WhiteAndBlack,
                namePlatform: 'Roblox',
                state: 'Early Access',
                urlProyect: Roblox,
                colorIcons: [themeProvider.WhiteAndBlack],
                technologies: ["Lua"],
                technologyIcons: [
                  Boxicons.bx_game,
                ],
              ),
              GalleryDesktop(
                  themeProvider: themeProvider.WhiteAndBlack,
                  textColors: themeProvider.BlackAndWhite,
                  backgroundColor: themeProvider.AzulyMorado,
                  borderColor: themeProvider.WhiteAndBlack,
                  state: 'Beta',
                  nameProyect: 'TaskLyft',
                  description: TaskLyft,
                  viewProyect: "Ver más",
                  imageBucket:
                      "https://cdn-icons-png.flaticon.com/512/1838/1838286.png",
                  technologies: ["Flutter", "Firebase", "JavaScript"],
                  technologyIcons: [
                    Boxicons.bxl_flutter,
                    Boxicons.bxl_firebase,
                    Boxicons.bxl_javascript,
                  ],
                  textColor: themeProvider.WhiteAndBlack,
                  colorIcons: [Colors.blue, Colors.orange, Colors.amber]),
              GalleryDesktop(
                themeProvider: themeProvider.WhiteAndBlack,
                textColors: themeProvider.BlackAndWhite,
                backgroundColor: themeProvider.AzulyMorado,
                borderColor: themeProvider.WhiteAndBlack,
                state: 'Deprecated',
                nameProyect: 'AxoPage',
                namePlatform: 'AxoPunk',
                viewProyect: "Ir a la pagína",
                description: AxoPage,
                urlProyect: 'https://www.axopunk.com/#/',
                technologies: ["Flutter", "Firebase", "JavaScript"],
                technologyIcons: [
                  Boxicons.bxl_flutter,
                  Boxicons.bxl_firebase,
                  Boxicons.bxl_javascript,
                ],
                colorIcons: [Colors.blue, Colors.orange, Colors.amber],
                imageBucket:
                    "https://firebasestorage.googleapis.com/v0/b/whools-typing.appspot.com/o/AxoPunk.gif?alt=media&token=74b27b99-8648-4192-a11c-4f2ce9323565",
                textColor: themeProvider.WhiteAndBlack,
              ),
              GalleryDesktop(
                themeProvider: themeProvider.WhiteAndBlack,
                textColors: themeProvider.BlackAndWhite,
                backgroundColor: themeProvider.AzulyMorado,
                borderColor: themeProvider.WhiteAndBlack,
                state: 'Deprecated',
                nameProyect: 'Whools Typing',
                namePlatform: 'Whools Typing',
                viewProyect: "Ir a la pagína",
                description: whoolsTyping,
                urlProyect: 'https://whoolstyping.web.app/',
                technologies: ["Flutter", "Firebase", "JavaScript"],
                technologyIcons: [
                  Boxicons.bxl_flutter,
                  Boxicons.bxl_firebase,
                  Boxicons.bxl_javascript,
                ],
                colorIcons: [Colors.blue, Colors.orange, Colors.amber],
                imageBucket:
                    "https://firebasestorage.googleapis.com/v0/b/whools-typing.appspot.com/o/typing.gif?alt=media&token=a2a6acbb-5e6d-4046-9c70-4d8aeee53474",
                textColor: themeProvider.WhiteAndBlack,
              ),
            ],
          )
        ],
      ),
    );
  }
}
