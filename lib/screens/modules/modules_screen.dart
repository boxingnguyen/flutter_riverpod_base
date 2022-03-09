import 'package:flutter/material.dart';
import 'package:provider_base/utils/utils.dart';

class ModulesScreen extends StatelessWidget with Utils {
  const ModulesScreen({Key? key}) : super(key: key);

  static String routeName = '/list_modules';

  @override
  Widget build(BuildContext context) {
    final Map<String, String> listModules = {
      'Common API': '/common_api',
      'Authorization': '/authorization',
      'Util': '/util',
      'Notification': '/notification',
      'Take Picture': '/take_picture',
      'Google Analysis': '/google_analysis',
      'OTP/Capcha': '/otp_capcha',
      'QR Code': '/qr_code',
      'Play Video': '/play_video'
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('List Modules'),
        centerTitle: false,
        actions: [
          Switch.adaptive(value: true, onChanged: (value) {}),
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              itemCount: listModules.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) => _buildGridItem(
                  context,
                  listModules.keys.elementAt(index),
                  listModules.values.elementAt(index)))),
    );
  }

  Widget _buildGridItem(BuildContext context, String title, String routeName) {
    return InkWell(
      onTap: () => pushName(context, routeName),
      child: Card(
        elevation: 10.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Container(
          alignment: Alignment.center,
          child: Text(title),
        ),
      ),
    );
  }
}
