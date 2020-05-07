import 'dart:io';

import 'package:flutter/foundation.dart';

import '../models/place.dart';
import '../helpers/db_helper.dart';
import '../helpers/location_helper.dart';// final changes 20200423 v2

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  // v5
  Place findById(String id) {
    return _items.firstWhere((place) => place.id == id);
  }

  Future<void> addPlace(// final changes 20200423 v2 Future<voif>
    String pickedTitle,
    File pickedImage,
    PlaceLocation pickedLocation,// final changes 20200423 v2
  ) async {
    final address = await LocationHelper.getPlaceAddress(pickedLocation.latitude, pickedLocation.longitude);// final changes 20200423 v2 async, address
    print('Aviiiiiii $address');
    final updatedLocation = PlaceLocation(latitude: pickedLocation.latitude, longitude: pickedLocation.longitude, address: address,);//
    final newPlace = Place(
      id: DateTime.now().toString(),
      image: pickedImage,
      title: pickedTitle,
      location: updatedLocation,// final changes 20200423 v2 updatedLocation
    );
    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
      'loc_lat': newPlace.location.latitude,// final changes 20200423 v3
      'loc_lng': newPlace.location.longitude,// final changes 20200423 v3
      'address': newPlace.location.address,// final changes 20200423 v3
    });
  }

  Future<void> fetchAndSetPlaces() async {
    final dataList = await DBHelper.getData('user_places');
    _items = dataList
        .map(
          (item) => Place(
                id: item['id'],
                title: item['title'],
                image: File(item['image']),
                location: PlaceLocation(latitude: item['loc_lat'], longitude: item['loc_lng'], address: item['address'],),// final changes 20200423 v3
              ),
        )
        .toList();
    notifyListeners();
  }

  Future<void> deletePlace(String id) async {
    final deleteRecord = await DBHelper.deleteData(id);
    return deleteRecord;
  }
}
