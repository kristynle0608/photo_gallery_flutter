import 'package:flutter/material.dart';
import 'package:photo_gallery/provider/gallery_data.dart';
import 'package:photo_gallery/screens/photo_gallery_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureProvider<List<String>>(
      initialData: [],
      create: (context) {
        final GalleryData galleryData = GalleryData();
        return galleryData.getImagesFromPixabay()
      },
      child: MaterialApp(
        theme: ThemeData.dark(),
        home: const PhotoGalleryScreen(),
      ),
    );
  }
}

