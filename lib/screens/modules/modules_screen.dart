import 'package:flutter/material.dart';
import 'package:provider_base/common/common_view/switch_theme_button.dart';
import 'package:provider_base/common/core/constants.dart';
import 'package:provider_base/utils/utils.dart';

class ModulesScreen extends StatelessWidget with Utils {
  const ModulesScreen({Key? key}) : super(key: key);

  static String routeName = '/list_modules';

  @override
  Widget build(BuildContext context) {
    final Map<String, String> listModules = {
      'Common API': '/home',
      'Authorization': '/authorization',
      'Util': '/util',
      'Notification': '/notification',
      'Take Picture': '/take_picture',
      'Google\n Analysis': '/google_analysis',
      'OTP/Capcha': '/otp_capcha',
      'QR Code': '/qr_code',
      'Play Video': '/play_video'
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('List Modules'),
        centerTitle: false,
        actions: const [
          SwitchThemebutton(),
        ],
      ),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GridView.builder(
                clipBehavior: Clip.none,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemCount: listModules.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) =>
                    _buildGridItem(context, listModules.keys.elementAt(index),
                        listModules.values.elementAt(index)))),
      ),
    );
  }

  Widget _buildGridItem(BuildContext context, String title, String routeName) {
    return InkWell(
      onTap: () => pushName(context, routeName),
      child: Container(
        alignment: Alignment.center,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: AppColors.black),
        ),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[500]!,
              offset: const Offset(4, 4),
              blurRadius: 15,
              spreadRadius: 1,
            ),
            BoxShadow(
              color: Theme.of(context).primaryColor,
              offset: const Offset(-4, -4),
              blurRadius: 15,
              spreadRadius: 1,
            ),
          ],
        ),
      ),
    );
  }
}
