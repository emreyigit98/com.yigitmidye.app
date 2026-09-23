
import 'package:firebase_app/core/constants/constants.dart';
import 'package:firebase_app/features/feature_adress/domain/entity/adress_entity.dart';

class StaticMapUrl {

  static String createMapUrl({
    required AdressEntity entity
  }) {
    final uri = Uri.https('maps.googleapis.com','/maps/api/staticmap',{
      'center' : entity.apiUrl,
      'zoom' : '16',
      'size' : '600x300',
      'markers' : entity.apiUrl,
      'key' : Constants.apiKey
    });
    return uri.toString();
  }
}