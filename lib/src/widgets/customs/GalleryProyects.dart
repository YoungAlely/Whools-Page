import 'dart:ui';

import 'package:boxicons/boxicons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whools/src/providers/theme_model.dart';
import 'package:whools/src/services/UrlLauncher.dart';

class GalleryDesktop extends StatefulWidget {
  const GalleryDesktop(
      {super.key,
      required this.nameProyect,
      required this.description,
      required this.imageBucket,
      required this.technologies,
      required this.technologyIcons,
      required this.colorIcons,
      this.urlProyect,
      this.ICONS,
      this.namePlatform,
      this.state,
      required this.textColor,
      required this.themeProvider,
      required this.backgroundColor,
      required this.textColors,
      required this.borderColor,
      this.viewProyect});
  final String nameProyect;
  final String description;
  final String imageBucket;
  final List<String> technologies;
  final List<IconData> technologyIcons;
  final List<Color> colorIcons;
  final String? urlProyect;
  final IconData? ICONS;
  final String? namePlatform;
  final String? state;
  final Color textColor;
  final Color themeProvider;
  final Color backgroundColor;
  final Color textColors;
  final Color borderColor;
  final String? viewProyect;

  @override
  State<GalleryDesktop> createState() => _GalleryDesktopState();
}

class _GalleryDesktopState extends State<GalleryDesktop> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    final themeprovider = Provider.of<ThemeModel>(context, listen: true);
    return ListTile(
      contentPadding: const EdgeInsets.only(bottom: 30),
      leading: InkWell(
        onTap: () {
          imageComplete();
        },
        child: CachedNetworkImage(
          fit: BoxFit.contain,
          imageUrl: widget.imageBucket,
          height: 100,
          width: 100,
        ),
      ),
      title: Text(
        widget.nameProyect,
        style: TextStyle(
          color: widget.textColor,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.description,
            style: TextStyle(
              color: widget.textColor,
              fontSize: 15,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              for (var i = 0; i < widget.technologies.length; i++) ...{
                Icon(
                  widget.technologyIcons[i],
                  color: widget.colorIcons[i],
                  size: 20,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  widget.technologies[i],
                  style: TextStyle(
                    color: widget.textColor,
                    fontSize: 15,
                  ),
                ),
              }
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              if (widget.urlProyect != null) {
                launchSocialNetwork(widget.urlProyect ?? "");
              }
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.namePlatform != null) ...{
                  Icon(
                    Boxicons.bx_link_external,
                    color: themeprovider.WhiteAndBlack,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Ir al proyecto",
                    style: TextStyle(
                        color: themeprovider.WhiteAndBlack,
                        fontWeight: FontWeight.bold),
                  )
                } else ...{
                  const SizedBox()
                }
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> imageComplete() async {
    await precacheImage(
      CachedNetworkImageProvider(widget.imageBucket),
      context,
    );
    // ignore: use_build_context_synchronously
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.8,
              child: CachedNetworkImage(
                  imageUrl: widget.imageBucket, fit: BoxFit.contain),
            ),
          ),
        );
      },
    );
  }
}
