import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:whools/src/widgets/Widgets/ResponsiveWidget.dart';

Widget CarouselFuture(context,
    {required String urlCarpet,
    required String nameProyect,
    required Color themeProvider}) {
  return SizedBox(
      height: ResponsiveWidget.isSmallScreen(context) ? 200 : 300,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: CachedNetworkImage(imageUrl: urlCarpet),
      ));
}
