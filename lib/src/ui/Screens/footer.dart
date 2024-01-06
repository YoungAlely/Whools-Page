import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/widgets.dart';
import 'package:whools/src/providers/theme_model.dart';
import 'package:whools/src/widgets/footerbarColumn.dart';
import 'package:whools/src/widgets/infoText/info_text.dart';

class FooterBar extends StatelessWidget {
  const FooterBar({Key? key}) : super(key: key);

  static const Color gradientStartColor = Color.fromARGB(255, 0, 0, 0);
  static const Color gradientEndColor = Color.fromARGB(255, 0, 0, 0);
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeModel>(context, listen: true);
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        color: themeProvider.BlackAndWhite
      ),
      child: MediaQuery.of(context).size.width < 800
          ? Column(
              children: [
                const Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                     FooterbarColumn(
                      heading: 'Redes Sociales',
                      s1: 'Discord',
                      s1Link: 'https://discord.com/invite/KRj5reGDvE',
                      s2: 'Instagram',
                      s2Link: 'https://www.instagram.com/bywhools/',
                      s3: 'Tiktok',
                      s3Link: 'https://www.tiktok.com/.whools',
                    ),
                  ],
                ),
                 Divider(
                  color: themeProvider.WhiteAndBlack,
                ),
                const SizedBox(height: 20),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InfoText(
                      text: 'info@whools.xyz',
                      isEmail: true,
                    ),
                    SizedBox(height: 10),
                    InfoText(
                      text:
                          '',
                      isAddress: true,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                 Divider(
                  color: themeProvider.WhiteAndBlack,
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () async {
                    var addressUrl = 'https://github.com/ByWhools';
                    try {
                      await launchUrl(Uri.parse(addressUrl));
                    } catch (e) {
                      await Clipboard.setData(ClipboardData(text: addressUrl));
                      debugPrint('Direccion Copiada');
                    }
                  },
                  child: Text(
                    'Copyright © 2023 | Whools? 🐣',
                    style: TextStyle(
                      color: themeProvider.WhiteAndBlack,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            )
          : Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const FooterbarColumn(
                      heading: 'Redes Sociales',
                      s1: 'Discord',
                      s1Link: 'https://discord.com/invite/KRj5reGDvE',
                      s2: 'Instagram',
                      s2Link: 'https://www.instagram.com/bywhools/',
                      s3: 'Tiktok',
                      s3Link: 'https://www.tiktok.com/.whools',
                    ),
                    Container(
                      color: themeProvider.WhiteAndBlack,
                      width: 2,
                      height: 150,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InfoText(
                        
                          text: 'info@whools.xyz',
                          isEmail: true,
                        ),
                        SizedBox(height: 20),
                        InfoText(
                          text:
                              '',
                          isAddress: true,
                        ),
                      ],
                    ),
                  ],
                ),
                 Divider(
                  color: themeProvider.WhiteAndBlack,
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () async {
                    var addressUrl = 'https://github.com/byWhools';
                    try {
                      await launchUrl(Uri.parse(addressUrl));
                    } catch (e) {
                      await Clipboard.setData(ClipboardData(text: addressUrl));
                      debugPrint('Address Copied');
                    }
                  },
                  child: Text(
                    'Copyright © 2023 | Whools? 🐣',
                    style: TextStyle(
                      color: themeProvider.WhiteAndBlack,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
