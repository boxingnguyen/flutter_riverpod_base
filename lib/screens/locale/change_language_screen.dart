import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider_base/common/core/app_style.dart';
import 'package:provider_base/l10n/l10n.dart';
import 'package:provider_base/screens/locale/locale_state_notifier.dart';
import 'package:provider_base/utils/utils.dart';

enum LanguageValue { en, vi, ja }

class ChangeLanguageScreen extends StatelessWidget with Utils {
  const ChangeLanguageScreen({Key? key}) : super(key: key);

  static String routeName = '/change_language';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        context: context,
        title: L10n.of(context).msgap008,
      ),
      body: const _Body(),
    );
  }
}

class _Body extends HookConsumerWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localeState = ref.watch(localeProvider);
    var currentLocale = localeState.locale.languageCode;

    return Column(
      children: [
        RadioListTile(
          value: LanguageValue.en.name,
          groupValue: currentLocale,
          title: Text(L10n.of(context).msgap002),
          subtitle: Text(L10n.of(context).msgap005),
          onChanged: (value) {
            ref.read(localeProvider.notifier).setLocale(LanguageValue.en);
          },
          activeColor: AppStyles.primaryColor,
        ),
        RadioListTile(
          value: LanguageValue.vi.name,
          groupValue: currentLocale,
          title: Text(L10n.of(context).msgap003),
          subtitle: Text(L10n.of(context).msgap006),
          onChanged: (value) {
            ref.read(localeProvider.notifier).setLocale(LanguageValue.vi);
          },
          activeColor: AppStyles.primaryColor,
        ),
        RadioListTile(
          value: LanguageValue.ja.name,
          groupValue: currentLocale,
          title: Text(L10n.of(context).msgap004),
          subtitle: const Text('Japan'),
          onChanged: (value) {
            ref.read(localeProvider.notifier).setLocale(LanguageValue.ja);
          },
          activeColor: AppStyles.primaryColor,
        ),
      ],
    );
  }
}
