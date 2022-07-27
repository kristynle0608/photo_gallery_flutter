import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../keys.dart';
import '../services/network_helper.dart';

class GalleryData extends ChangeNotifier {

  // Future<List<String>>? _images = [];

  // List<String> get images => [..._images];

  // int get imagesCount => _images.length;

  Future<List<String>> getImagesFromPixabay() async {
    List<String> pixabayImages = [];
    String url =
        "https://pixabay.com/api/?key=$pixabayApiKey&image_type=photo&per_page=20&category=nature&page=1";

    NetworkHelper networkHelper = NetworkHelper(url: url);
    Map<String, dynamic> data = await networkHelper.getData();

    for (var entry in data["hits"]) {
      pixabayImages.add(entry["largeImageURL"]);
    }

    String image = data["hits"][0]["largeImageURL"];
    pixabayImages.add(image);

    return pixabayImages;

    // notifyListeners();
  }
}