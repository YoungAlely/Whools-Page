import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';
import 'package:whools/src/providers/theme_model.dart';

void showImageGallery(BuildContext context, String imageUrl) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            child: PhotoView(
              imageProvider:
                  NetworkImage(imageUrl), // Mostrar solo la imagen seleccionada
              minScale: PhotoViewComputedScale.contained,
              maxScale: PhotoViewComputedScale.covered * 2,
              backgroundDecoration: BoxDecoration(
                color: Colors.transparent,
              ),
            ),
          ),
        ),
      );
    },
  );
}
void imgGallery(BuildContext context, String imageUrl) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      final themeProvider = Provider.of<ThemeModel>(context, listen: true);
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        backgroundColor: themeProvider.BlackAndWhite,
        child: CircleAvatar(
          backgroundImage: NetworkImage(imageUrl),
        )
      );
    },
  );
}
