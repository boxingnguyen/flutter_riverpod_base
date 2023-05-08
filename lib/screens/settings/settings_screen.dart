import 'package:flutter/material.dart';
import 'package:provider_base/common/core/app_style.dart';
import 'package:provider_base/common/core/routes.dart';
import 'package:provider_base/l10n/l10n.dart';
import 'package:provider_base/screens/locale/locale_screen.dart';
import 'package:provider_base/utils/utils.dart';

class SettingsScreen extends StatelessWidget with Utils {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        title: L10n.of(context).msgap010,
        pressBack: () => Navigator.of(
          context,
          rootNavigator: true,
        ).pop(context),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          vertical: AppStyles.verticalSpace,
          horizontal: AppStyles.horizontalSpace,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              L10n.of(context).msgap011,
              style: AppStyles.textMedium.copyWith(fontSize: 18),
            ),
            const SizedBox(
              height: AppStyles.verticalSpace,
            ),
            SettingItem(
              title: L10n.of(context).msgap008,
              icon: Icons.language,
              press: () async => await push(
                context,
                const LocaleScreen(),
                settings: const RouteSettings(name: Routes.localeScreen),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingItem extends StatelessWidget with Utils {
  final String title;
  final VoidCallback? press;
  final IconData? icon;
  const SettingItem({Key? key, required this.title, this.press, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: screenWidth(context),
        padding: const EdgeInsets.symmetric(
          vertical: AppStyles.verticalSpace,
          horizontal: AppStyles.horizontalSpace,
        ),
        margin: const EdgeInsets.only(
          bottom: AppStyles.listItemSpace,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: AppStyles.primaryColor,
            ),
            const SizedBox(
              width: AppStyles.horizontalSpace,
            ),
            Text(title),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppStyles.primaryColor),
        ),
      ),
    );
  }
}
