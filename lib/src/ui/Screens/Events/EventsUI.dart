import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icon.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whools/src/providers/theme_model.dart';
import 'package:whools/src/widgets/Widgets/ResponsiveWidget.dart';
import 'package:whools/src/widgets/infoText/info_text.dart';

class EventsUI extends StatefulWidget {
  const EventsUI({
    Key? key,
    required this.image,
    required this.name,
    required this.url,
    required this.description,
    required this.location,
    required this.fechaInicio,
    required this.fechaFinal,
    required this.startTime,
    required this.endTime,
  }) : super(key: key);

  final String name;
  final String url;
  final String description;
  final String location;
  final String fechaInicio;
  final String fechaFinal;
  final String image;
  final String startTime;
  final String endTime;

  @override
  State<EventsUI> createState() => _EventsUIState();
}

class _EventsUIState extends State<EventsUI> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeModel>(context, listen: true);
    final width = MediaQuery.of(context).size.width;
    final url = widget.url;
    return ResponsiveWidget.isSmallScreen(context)
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: SizedBox(
                  width: width,
                  height: 400,
                  child: CachedNetworkImage(imageUrl: widget.image),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.name,
                                style: GoogleFonts.silkscreen(
                                  fontSize: 25,
                                  color: themeProvider.WhiteAndBlack,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  LineIcon.mapMarker(
                                    color: themeProvider.WhiteAndBlack,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  InfoText(
                                      isAddress: true, text: widget.location)
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Del ${widget.fechaInicio}, a las ${widget.startTime}\nhasta el ${widget.fechaFinal} a las ${widget.endTime}',
                                style: GoogleFonts.nunito(
                                    color: themeProvider.WhiteAndBlack),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              if (widget.url.isNotEmpty)
                                Row(
                                  children: [
                                    Text(
                                      "Registrate aqui 👉",
                                      style: GoogleFonts.silkscreen(
                                        color: themeProvider.WhiteAndBlack,
                                      ),
                                    ),
                                    if (widget.url.isNotEmpty) ...{
                                      TextButton(
                                        onPressed: () {
                                          launchSocialNetwork(widget.url);
                                        },
                                        child: Text(widget.url),
                                      )
                                    },
                                  ],
                                ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                widget.description,
                                style: GoogleFonts.openSans(
                                  color: themeProvider.WhiteAndBlack,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
              )
            ],
          )
        : Row(
            children: [
              ResponsiveWidget.isSmallScreen(context)
                  ? const SizedBox()
                  : Expanded(
                      child: SizedBox(
                        width: width,
                        height: 400,
                        child: CachedNetworkImage(imageUrl: widget.image),
                      ),
                    ),
              Expanded(
                child: ResponsiveWidget.isSmallScreen(context)
                    ? const SizedBox()
                    : SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.name,
                                style: GoogleFonts.silkscreen(
                                  fontSize: 25,
                                  color: themeProvider.WhiteAndBlack,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  LineIcon.mapMarker(
                                    color: themeProvider.WhiteAndBlack,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  InfoText(
                                      isAddress: true, text: widget.location)
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Del ${widget.fechaInicio}, a las ${widget.startTime}\nhasta el ${widget.fechaFinal} a las ${widget.endTime}',
                                style: GoogleFonts.nunito(
                                    color: themeProvider.WhiteAndBlack),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              if (widget.url.isNotEmpty)
                                Row(
                                  children: [
                                    Text(
                                      "Registrate aqui 👉",
                                      style: GoogleFonts.silkscreen(
                                        color: themeProvider.WhiteAndBlack,
                                      ),
                                    ),
                                    if (widget.url.isNotEmpty) ...{
                                      TextButton(
                                        onPressed: () {
                                          launchSocialNetwork(widget.url);
                                        },
                                        child: Text(widget.url),
                                      )
                                    },
                                  ],
                                ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                widget.description,
                                style: GoogleFonts.openSans(
                                  color: themeProvider.WhiteAndBlack,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
              )
            ],
          );
  }

  void launchSocialNetwork(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se pudo lanzar $url';
    }
  }
}
