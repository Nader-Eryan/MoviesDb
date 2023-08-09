import 'package:url_launcher/url_launcher_string.dart';

void launchMail() {
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'bolanader5@gmail.com',
    queryParameters: {
      'subject': 'MoviesDb feedback',
      'body': 'Type your feedback here'
    },
  );
  final String emailUriString =
      emailLaunchUri.toString().replaceAll('+', '%20');
  launchUrlString(emailUriString);
}
