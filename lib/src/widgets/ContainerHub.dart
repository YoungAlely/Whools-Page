import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whools/src/widgets/Widgets/ResponsiveWidget.dart';

Widget containerHub({
  required double width,
  required BuildContext context,
  required String imageUrl,
}) {
  return Container(
    alignment: Alignment.center,
    width: width,
    height: ResponsiveWidget.isSmallScreen(context) ? 300 : 400,
    color: Colors.black,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ResponsiveWidget.isSmallScreen(context) ? 10 : 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Convierte la imaginación\nen innovación",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: ResponsiveWidget.isSmallScreen(context)
                      ? 20
                      : ResponsiveWidget.isMediumScreen(context)
                          ? 30
                          : 50,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text("Diseña el futuro digital",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.openSans(
                    color: Colors.white,
                    fontSize: ResponsiveWidget.isSmallScreen(context)
                        ? 15
                        : ResponsiveWidget.isMediumScreen(context)
                            ? 30
                            : 20,
                  )),
            ],
          ),
        ),
        // ignore: unrelated_type_equality_checks
        ResponsiveWidget.isSmallScreen(context)
            ? const SizedBox()
            : Flexible(child: CachedNetworkImage(imageUrl: imageUrl))
      ],
    ),
  );
}
