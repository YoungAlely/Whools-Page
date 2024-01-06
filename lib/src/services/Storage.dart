// ignore_for_file: use_build_context_synchronously

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
import 'package:whools/src/widgets/Widgets/ResponsiveWidget.dart';

final FirebaseStorage storage = FirebaseStorage.instance;

Future<List<String>> getStorageImageUrl(
    String carpet, String projectName) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> imageUrls = prefs.getStringList('imageUrls_$projectName') ?? [];

  if (imageUrls.isEmpty) {
    try {
      final storage = FirebaseStorage.instance;
      final foldername = carpet;
      final ListResult listResult = await storage.ref(foldername).listAll();

      for (final item in listResult.items) {
        final imageUrl = await item.getDownloadURL();
        imageUrls.add(imageUrl);
      }

      prefs.setStringList('imageUrls_$projectName', imageUrls);
    } catch (e) {
      print('Error al obtener las URLs de Storage: $e');
    }
  }

  return imageUrls;
}

Future<bool> checkifUserExist(String userId) async {
  final userDoc =
      await FirebaseFirestore.instance.collection("Users").doc(userId).get();
  if (userDoc.exists) {
    return true;
  } else {
    await FirebaseFirestore.instance.collection("Users").doc(userId).get();
    return false;
  }
}

Future<List<String>> getImageUrls() async {
  List<String> imageUrls = [];
  try {
    ListResult result =
        await storage.ref('gs://whools-proyect.appspot.com/Galerry').list();
    for (Reference ref in result.items) {
      final imageUrl = await ref.getDownloadURL();
      imageUrls.add(imageUrl);
    }
  } catch (e) {
    print("Error al obtener las imágenes: $e");
  }
  return imageUrls;
}

Future<void> showGalleryDialog(BuildContext context) async {
  List<String> imageUrls = await getImageUrls();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.transparent
          ),
          width: ResponsiveWidget.isSmallScreen(context) ? 200 : 400,
          child: StaggeredGridView.countBuilder(
            crossAxisCount: 2,
            itemCount: imageUrls.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  _showImageDetail(context, imageUrls[index]);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: CachedNetworkImage( imageUrl : imageUrls[index], fit: BoxFit.contain),
                ),
              );
            },
            staggeredTileBuilder: (int index) =>
                StaggeredTile.count(1, index.isEven ? 1.2 : 1.8),
          ),
        ),
      );
    },
  );
}

void _showImageDetail(BuildContext context, String imageUrl) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.black,
        child: CachedNetworkImage(imageUrl: imageUrl),
      );
    },
  );
}
