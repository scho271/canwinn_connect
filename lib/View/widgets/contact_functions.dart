import 'package:url_launcher/url_launcher.dart';

class ContactFunctions {
  void callNumber(String number) async {
  final Uri phoneUri = Uri(scheme: 'tel', path: number);
  if (await canLaunchUrl(phoneUri)) {
    await launchUrl(phoneUri);
  } else {
    throw 'Could not launch $number';
  }
}


void openMapDirections(double lat, double lng) async {
  final Uri mapUri = Uri.parse("https://www.google.com/maps/dir/?api=1&destination=$lat,$lng");
  if (await canLaunchUrl(mapUri)) {
    await launchUrl(mapUri, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch Maps';
  }
}

  
}