import 'dart:math';

import 'package:flutter/material.dart';
import 'package:photo_gallery/provider/gallery_data.dart';
import 'package:provider/provider.dart';

class PhotoGalleryScreen extends StatelessWidget {
  const PhotoGalleryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    GalleryData galleryData = context.watch<GalleryData>();

    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              itemCount: context.watch<GalleryData>.imagesCount,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 6.0,
                mainAxisSpacing: 6.0,
              ),
              itemBuilder: (context, index) {
                return Image.network(
                  snapshot.data![index],
                  fit: BoxFit.cover,
                );
              },
            )),
      ),
    );
  }
}
