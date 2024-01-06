import 'dart:js_interop';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:whools/src/providers/theme_model.dart';
import 'package:whools/src/ui/Screens/Events/EventsUI.dart';
import 'package:whools/src/widgets/Widgets/ResponsiveWidget.dart';

class EventCard extends StatefulWidget {
  const EventCard({super.key, required this.scrollDirection});
  final Axis scrollDirection;

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final width = MediaQuery.of(context).size.width;
    final themeProvider = Provider.of<ThemeModel>(context, listen: true);
    final stream = FirebaseFirestore.instance.collection('Events').snapshots();
    return Padding(
        padding: EdgeInsets.only(
          top: screenSize.height / 30,
        ),
        child: SizedBox(
          width: width,
          child: StreamBuilder(
            stream: stream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return SizedBox(
                  width: width,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: widget.scrollDirection,
                    children: snapshot.data!.docs.isEmpty
                        ? [
                            DefaultTextStyle(
                              style: GoogleFonts.silkscreen(
                                color: themeProvider.WhiteAndBlack,
                                fontSize:
                                    ResponsiveWidget.isSmallScreen(context)
                                        ? 20
                                        : 30,
                              ),
                              child: AnimatedTextKit(
                                  repeatForever: true,
                                  animatedTexts: [
                                    TyperAnimatedText(
                                        "No hay eventos disponibles"),
                                    TyperAnimatedText("O tal vez... ¿Si?"),
                                  ]),
                            ),
                          ]
                        : snapshot.data!.docs.map((DocumentSnapshot document) {
                            Map<String, dynamic> data =
                                document.data() as Map<String, dynamic>;

                            return SizedBox(
                              child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          backgroundColor:
                                              themeProvider.AzulyMorado,
                                          content:EventsUI(
                                                  name: document['titulo'],
                                                  url: document['urlEvento'],
                                                  description:
                                                      document['description'],
                                                  location:
                                                      document['ubicacion'],
                                                  fechaInicio:
                                                      document['fechaInicio'],
                                                  fechaFinal:
                                                      document['fechaFinal'],
                                                  image: document['imageUrl'],
                                                  startTime:
                                                      document['HoraInicio'],
                                                  endTime: document['HoraFin'],
                                                ),
                                        );
                                      });
                                },
                                child: SizedBox(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Container(
                                            height:
                                                ResponsiveWidget.isSmallScreen(
                                                        context)
                                                    ? 200
                                                    : 300,
                                            width:
                                                ResponsiveWidget.isSmallScreen(
                                                        context)
                                                    ? 130
                                                    : 300,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                              image: NetworkImage(
                                                  data["imageUrl"]),
                                              fit: BoxFit.contain,
                                            )),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        SizedBox(
                                          width: ResponsiveWidget.isSmallScreen(
                                                  context)
                                              ? 130
                                              : 250,
                                          child: Text(
                                            document['titulo'],
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign
                                                .left, // Alineación izquierda
                                            style: TextStyle(
                                              color:
                                                  themeProvider.WhiteAndBlack,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          data['fechaInicio'],
                                          textAlign: TextAlign
                                              .left, // Alineación izquierda
                                          style: TextStyle(
                                              color:
                                                  themeProvider.WhiteAndBlack),
                                        ),
                                        Text(
                                          "De ${data['HoraInicio']} a ${data['HoraFin']}",
                                          textAlign: TextAlign
                                              .left, // Alineación izquierda
                                          style: TextStyle(
                                              color:
                                                  themeProvider.WhiteAndBlack),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                  ),
                );
              }
            },
          ),
        ));
  }
}
