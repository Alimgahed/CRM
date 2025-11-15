import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class CommuncationController extends GetxController {
  whatsapp({required String phone}) async {
    var contact = phone;
    var androidUrl = "whatsapp://send?phone=$contact&text=Hi,";
    try {
      await launchUrl(Uri.parse(androidUrl));
    } on Exception {
      ('WhatsApp is not installed.');
    }
  }
  Future<void> makePhoneCall(String phoneNumber) async {
  final Uri url = Uri.parse("tel:$phoneNumber");
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}
}
