
String welcomeMessage() {
  final hour = DateTime.now().hour;

  if (hour >= 5 && hour < 12) {
    return "Günaydın";
  } else if (hour >= 12 && hour < 18) {
    return "İyi günler";
  } else {
    return "İyi akşamlar";
  }
}