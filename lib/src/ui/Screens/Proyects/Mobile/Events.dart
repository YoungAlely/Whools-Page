import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:whools/src/providers/theme_model.dart';
import 'package:whools/src/ui/ScreensAuth/Mobile/Events/Events_card.dart';
import 'package:whools/src/widgets/Widgets/ResponsiveWidget.dart';

class LeadinEvents extends StatefulWidget {
  const LeadinEvents({super.key});

  @override
  State<LeadinEvents> createState() => _LeadinEventsState();
}

class _LeadinEventsState extends State<LeadinEvents> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final themeProvider = Provider.of<ThemeModel>(context, listen: true);
    return Padding(
      padding: EdgeInsets.only(
          top: ResponsiveWidget.isSmallScreen(context)
              ? screenSize.height * 0.03
              : screenSize.height * 0.03,
          left: screenSize.width / 15,
          right: screenSize.width / 15),
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
                "Eventos;",
                style: GoogleFonts.silkscreen(
                    color: themeProvider.WhiteAndBlack,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: screenSize.width,
            height: 500,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: EventCard(scrollDirection: Axis.horizontal),
          ),
        ],
      ),
    );
  }
}
