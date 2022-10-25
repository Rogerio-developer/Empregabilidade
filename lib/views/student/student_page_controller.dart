import 'package:url_launcher/url_launcher.dart';

class StudentPageController {
  void openWhatsApp(String number) async {
    double whatsApp = double.parse(number);
    final Uri uri = Uri.https('wa.me', '$whatsApp');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'erro no whats';
    }
  }

  void openGitHub(String url) async {
    String test = url.substring(19);
    final Uri uri = Uri.https('github.com', '/$test');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'erro no git';
    }
  }

  void openLinkedin(String text) async {
    String url = text.substring(16);
    final Uri uri = Uri.https('www.linkedin.com', url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'erro no linkedin';
    }
  }

  void openEmail(String text) async {
    final Uri uri = Uri.parse('mailto:$text');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'erro no email';
    }
  }
}
