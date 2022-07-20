import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_place/google_place.dart';

class HomeCotroller extends GetxController {
  TextEditingController search = TextEditingController();

  List<SearchResult> resta = [];
  var googlePlace = GooglePlace("AIzaSyC5YFhhEvFvKBA9du8i0gmoxayMzO6U7PM");

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    NearBySearchResponse? result = await googlePlace.search.getNearBySearch(
      Location(lat: 4.6859196703185235, lng: -74.10129290161747),
      1500,
    );

    /* var result =
        await googlePlace.search.getTextSearch("restaurants in Sydney"); */

    print(result);

    if (result != null) {
      resta = result.results ?? [];
      update(['places']);
    }
  }

  Future<File> getImage(SearchResult place) async {
    File image = File('');

    if (place.photos!.length > 0) {
      Uint8List? get = await googlePlace.photos
          .get(place.photos![0].photoReference!, 100, 400);
      if (get != null) {
        image = File.fromRawPath(get);
      }
      print("image: $image");
    }

    return image;
  }
}
