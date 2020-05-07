// final changes 20200423 v2 http
import 'dart:convert';
import 'package:http/http.dart' as http;

const GOOGLE_API_KEY = 'AIzaSyA-YryyXafTGSiGebWALlEwNCRxoTIpLW4';

class LocationHelper {
  static String generateLocationPreviewImage({double latitude, double longitude,}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$GOOGLE_API_KEY';
  }

  // final changes 20200423 v2
  static Future<String> getPlaceAddress(double lat, double lng) async {
    final url = 'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$GOOGLE_API_KEY';
    final response = await http.get(url);
    print('Navaaaaa ${response.body}');
    return json.decode(response.body)['results'][0]['formatted_address'];
    print('Navaaaaa ${json.decode(response.body)['results'][0]['formatted_address']}');
  }//
}