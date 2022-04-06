import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider_base/common/core/app_style.dart';
import 'package:provider_base/l10n/l10n.dart';
import 'package:provider_base/l10n/language_constants.dart';
import 'package:provider_base/screens/locale/locale_state.dart';
import 'package:provider_base/screens/locale/locale_state_notifier.dart';

class ChangeLanguageScreen extends StatelessWidget {
  const ChangeLanguageScreen({Key? key}) : super(key: key);

  static String routeName = '/change_language';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(L10n.of(context).msgap008),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends ConsumerStatefulWidget {
  final LocaleState? localeState;
  const _Body({Key? key, this.localeState}) : super(key: key);

  @override
  ConsumerState<_Body> createState() => __BodyState();
}

class __BodyState extends ConsumerState<_Body> {
  String _currentLocale = LanguageValue.english;

  @override
  void initState() {
    super.initState();
    _getCurrentLocale();
  }

  Future<void> _getCurrentLocale() async {
    final currentLocale = await getLocale();
    setState(() {
      _currentLocale = currentLocale ?? '';
    });
  }

  Future<void> _changeLocale(String languageCode) async {
    if (_currentLocale == languageCode) {
      return;
    }
    _currentLocale = languageCode;
    ref.read(localeProvider.notifier).setLocale(languageCode);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile(
          value: LanguageValue.english,
          groupValue: _currentLocale,
          title: Text(L10n.of(context).msgap002),
          subtitle: Text(L10n.of(context).msgap005),
          onChanged: (value) {
            _changeLocale(LanguageValue.english);
          },
          activeColor: AppStyles.primaryColor,
        ),
        RadioListTile(
          value: LanguageValue.vietnam,
          groupValue: _currentLocale,
          title: Text(L10n.of(context).msgap003),
          subtitle: Text(L10n.of(context).msgap006),
          onChanged: (value) {
            _changeLocale(LanguageValue.vietnam);
          },
          activeColor: AppStyles.primaryColor,
        ),
        RadioListTile(
          value: LanguageValue.japan,
          groupValue: _currentLocale,
          title: Text(L10n.of(context).msgap004),
          subtitle: const Text('Japan'),
          onChanged: (value) {
            _changeLocale(LanguageValue.japan);
          },
          activeColor: AppStyles.primaryColor,
        ),
      ],
    );
  }
}
