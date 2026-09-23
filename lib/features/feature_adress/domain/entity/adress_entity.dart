
class AdressEntity {

  final String id;
  final String name;
  final String surname;
  final String city;
  final String district;
  final String neigh;
  final String street;
  final String apartmentNo;
  final String builderNo;
  final String note;

  String get fullAdress => "$neigh $street $apartmentNo/$builderNo $city/$district";
  String get apiUrl => "$city , $district , $neigh , No:$apartmentNo";

  AdressEntity({
    required this.id,
    required this.name,
    required this.surname,
    required this.city,
    required this.district,
    required this.neigh,
    required this.street,
    required this.apartmentNo,
    required this.builderNo,
    required this.note
  });
}