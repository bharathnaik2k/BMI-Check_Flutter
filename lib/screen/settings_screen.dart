import 'package:bmi_app/controller/settings_controller.dart';
import 'package:bmi_app/widgets/settingsscreen_widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  final Uri _url = Uri.parse('https://www.linkedin.com/in/bharathnaik2k/');

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Scaffold build(BuildContext context) {
    final settingController =
        Provider.of<SettingsController>(context, listen: false);
    settingController.appVersionCheck();
    return Scaffold(
      appBar: appBar(),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 226, 226, 226),
              ),
              child: Row(
                children: [
                  const Text(
                    'Contact Us',
                    style: TextStyle(fontSize: 20),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: _launchUrl,
                    icon: const Icon(Icons.arrow_forward),
                  ),
                ],
              ),
            ),
            versionCard(),
          ],
        ),
      ),
      bottomNavigationBar: const SafeArea(
        child: SizedBox(
          height: 50,
          child: Center(
            child: Text('Developed by ❤️ Bharath Naik'),
          ),
        ),
      ),
    );
  }

  Container versionCard() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 234, 234, 234),
      ),
      child: Row(
        children: [
          const Text(
            'App Version',
            style: TextStyle(fontSize: 20),
          ),
          const Spacer(),
          Consumer<SettingsController>(
            builder: (context, settingController, _) {
              return Text(
                'v${settingController.appVersion}',
                style: const TextStyle(fontSize: 20),
              );
            },
          ),
        ],
      ),
    );
  }
}
