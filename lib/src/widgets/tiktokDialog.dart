import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:whools/src/providers/theme_model.dart';
import 'package:whools/src/services/UrlLauncher.dart';

Widget cookieNotice(BuildContext context) {
  final themeProvider = Provider.of<ThemeModel>(context, listen: true);
  return Container(
    width: 340,
    height: 320,
    child: AlertDialog(
      scrollable: true,
      backgroundColor: themeProvider.BlackAndWhite,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(color: themeProvider.WhiteAndBlack)),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            title: Text(
              "¿Ya no sigues en nuestras Redes Sociales?",
              style: GoogleFonts.roboto(color: themeProvider.WhiteAndBlack),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      launchSocialNetwork("https://discord.gg/KRj5reGDvE");
                    },
                    hoverColor: Colors.transparent,
                    icon: Icon(Boxicons.bxl_discord,
                        color: themeProvider.WhiteAndBlack),
                  ),
                  IconButton(
                    onPressed: () {
                      launchSocialNetwork("https://www.instagram.com/bywhools/");
                    },
                    hoverColor: Colors.transparent,
                    icon: Icon(Boxicons.bxl_instagram,
                        color: themeProvider.WhiteAndBlack),
                  ),
                  IconButton(
                    onPressed: () {
                      launchSocialNetwork("https://github.com/ByWhools");
                    },
                    hoverColor: Colors.transparent,
                    icon: Icon(Boxicons.bxl_github,
                        color: themeProvider.WhiteAndBlack),
                  ),
                  IconButton(
                    onPressed: () {
                      launchSocialNetwork("https://www.tiktok.com/@bywhools");
                    },
                    hoverColor: Colors.transparent,
                    icon: Icon(Boxicons.bxl_tiktok,
                        color: themeProvider.WhiteAndBlack),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                "Cerrar",
                style:
                    GoogleFonts.silkscreen(color: themeProvider.WhiteAndBlack),
              )),
        )
      ],
    ),
  );
}
