import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaLinks extends StatelessWidget {
  const SocialMediaLinks({super.key});

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not launch $uri');
    }
  }

  Widget _buildIcon({
    required IconData icon,
    required Color color,
    required String url,
  }) {
    return InkWell(
      onTap: () => _launchUrl(url),
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: 48,
        height: 48,
        margin: const EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: color.withAlpha(110),
              blurRadius: 6,
              offset: const Offset(2, 3),
            )
          ],
        ),
        child: Icon(icon, color: Colors.white, size: 24),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildIcon(
          icon: FontAwesomeIcons.whatsapp,
          color: const Color(0xFF25D366),
          url: 'https://wa.me/+905528053933',
        ),
        _buildIcon(
          icon: FontAwesomeIcons.facebookF,
          color: const Color(0xFF1877F2),
          url: 'https://facebook.com/YOUR_PAGE',
        ),
        _buildIcon(
          icon: FontAwesomeIcons.instagram,
          color: const Color(0xFFE4405F),
          url: 'https://instagram.com/m6nur',
        ),
        _buildIcon(
          icon: FontAwesomeIcons.linkedinIn,
          color: const Color(0xFF0077B5),
          url: 'https://linkedin.com/in/almasto',
        ),
        _buildIcon(
          icon: FontAwesomeIcons.github,
          color: Colors.black,
          url: 'https://github.com/m-nour-dev',
        ),
      ],
    );
  }
}
