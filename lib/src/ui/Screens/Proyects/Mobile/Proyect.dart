import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:whools/src/providers/theme_model.dart';
import 'package:whools/src/ui/Screens/Proyects/Desktop/ProyectsDesk.dart';
import 'package:whools/src/utils/Strings.dart';
import 'package:whools/src/widgets/customs/GalleryProyects.dart';

class ProyectsWhools extends StatefulWidget {
  const ProyectsWhools({
    super.key,
    required this.screenSize,
  });
  final Size screenSize;
  @override
  State<ProyectsWhools> createState() => _ProyectsWhoolsState();
}

class _ProyectsWhoolsState extends State<ProyectsWhools> {
  @override
  Widget build(BuildContext context) {
    final screenSize = widget.screenSize;
    final themeProvider = Provider.of<ThemeModel>(context, listen: true);

    return Padding(
        padding: EdgeInsets.only(
          top: screenSize.height * 0.06,
          left: screenSize.width / 15,
          right: screenSize.width / 15,
        ),
        child: screenSize.width < 800
            ? Column(children: [
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
                GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  addAutomaticKeepAlives: false,
                  shrinkWrap: true,
                  crossAxisCount: 1,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
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
              ])
            : screenSize.width < 1301
                ? Column(
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
                          colorIcons: [
                            Colors.blue,
                            Colors.orange,
                            Colors.amber
                          ]),
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
                : ProyectDesk(screenSize: screenSize));
  }
}
