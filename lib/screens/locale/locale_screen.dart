import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider_base/common/core/app_style.dart';
import 'package:provider_base/l10n/l10n.dart';
import 'package:provider_base/screens/locale/locale_state.dart';
import 'package:provider_base/screens/locale/locale_state_notifier.dart';
import 'package:provider_base/utils/utils.dart';

class LocaleScreen extends StatelessWidget with Utils {
  const LocaleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(title: L10n.of(context).msgap008),
      body: const _Body(),
    );
  }
}

class _Body extends HookConsumerWidget {
  final LocaleState? localeState;
  const _Body({Key? key, this.localeState}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLanguageCode = ref.watch(localeProvider).locale.languageCode;

    return Column(
      children: [
        RadioListTile(
          value: SupportLanguageType.en.name,
          groupValue: currentLanguageCode,
          title: Text(L10n.of(context).msgap002),
          subtitle: Text(L10n.of(context).msgap005),
          onChanged: (_) => ref
              .read(localeProvider.notifier)
              .changeLocale(context, SupportLanguageType.en),
          activeColor: AppStyles.primaryColor,
        ),
        RadioListTile(
          value: SupportLanguageType.vi.name,
          groupValue: currentLanguageCode,
          title: Text(L10n.of(context).msgap003),
          subtitle: Text(L10n.of(context).msgap006),
          onChanged: (_) => ref
              .read(localeProvider.notifier)
              .changeLocale(context, SupportLanguageType.vi),
          activeColor: AppStyles.primaryColor,
        ),
        RadioListTile(
          value: SupportLanguageType.ja.name,
          groupValue: currentLanguageCode,
          title: Text(L10n.of(context).msgap004),
          subtitle: const Text('Japan'),
          onChanged: (_) => ref
              .read(localeProvider.notifier)
              .changeLocale(context, SupportLanguageType.ja),
          activeColor: AppStyles.primaryColor,
        ),
      ],
    );
  }
}
