import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whools/src/widgets/Widgets/ResponsiveWidget.dart';

class InfoText extends StatelessWidget {
  final String text;
  final bool? isEmail, isAddress;
  const InfoText({
    Key? key,
    required this.text,
    this.isEmail,
    this.isAddress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: InkWell(
            onTap: () async {
              if (isEmail == true) {
                var mailUrl =
                    'mailto:$text?subject=Hola, Ingresa el Asunto&body=Me gustaria colaborar con ustedes';
                try {
                  await launchUrl(Uri.parse(mailUrl));
                } catch (e) {
                  await Clipboard.setData(ClipboardData(text: text));
                }
              } else if (isAddress == true) {
                var addressUrl =
                    'https://www.google.com.mx/maps?q=${Uri.encodeComponent(text)}';

                try {
                  await launchUrl(Uri.parse(addressUrl));
                } catch (e) {
                  await Clipboard.setData(ClipboardData(text: addressUrl));
                  debugPrint('Direccion Copiada');
                }
              }
            },
            child: SizedBox(
              width: ResponsiveWidget.isSmallScreen(context) ? 300 : 600,
              child: Text(
                text,
                textAlign: TextAlign.justify,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 42, 75, 103),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
