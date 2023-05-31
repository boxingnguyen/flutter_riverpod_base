// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class L10n {
  L10n();

  static L10n? _current;

  static L10n get current {
    assert(_current != null,
        'No instance of L10n was loaded. Try to initialize the L10n delegate before accessing L10n.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<L10n> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = L10n();
      L10n._current = instance;

      return instance;
    });
  }

  static L10n of(BuildContext context) {
    final instance = L10n.maybeOf(context);
    assert(instance != null,
        'No instance of L10n present in the widget tree. Did you add L10n.delegate in localizationsDelegates?');
    return instance!;
  }

  static L10n? maybeOf(BuildContext context) {
    return Localizations.of<L10n>(context, L10n);
  }

  /// `Modules List`
  String get msgap001 {
    return Intl.message(
      'Modules List',
      name: 'msgap001',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get msgap002 {
    return Intl.message(
      'English',
      name: 'msgap002',
      desc: '',
      args: [],
    );
  }

  /// `Vietnamese`
  String get msgap003 {
    return Intl.message(
      'Vietnamese',
      name: 'msgap003',
      desc: '',
      args: [],
    );
  }

  /// `Japanese`
  String get msgap004 {
    return Intl.message(
      'Japanese',
      name: 'msgap004',
      desc: '',
      args: [],
    );
  }

  /// `England`
  String get msgap005 {
    return Intl.message(
      'England',
      name: 'msgap005',
      desc: '',
      args: [],
    );
  }

  /// `Viet Nam`
  String get msgap006 {
    return Intl.message(
      'Viet Nam',
      name: 'msgap006',
      desc: '',
      args: [],
    );
  }

  /// `Japan`
  String get msgap007 {
    return Intl.message(
      'Japan',
      name: 'msgap007',
      desc: '',
      args: [],
    );
  }

  /// `Languages`
  String get msgap008 {
    return Intl.message(
      'Languages',
      name: 'msgap008',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get msgap009 {
    return Intl.message(
      'Theme',
      name: 'msgap009',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get msgap010 {
    return Intl.message(
      'Settings',
      name: 'msgap010',
      desc: '',
      args: [],
    );
  }

  /// `General`
  String get msgap011 {
    return Intl.message(
      'General',
      name: 'msgap011',
      desc: '',
      args: [],
    );
  }

  /// `Languages`
  String get msgap012 {
    return Intl.message(
      'Languages',
      name: 'msgap012',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get msgap013 {
    return Intl.message(
      'Home',
      name: 'msgap013',
      desc: '',
      args: [],
    );
  }

  /// `Form`
  String get msgap014 {
    return Intl.message(
      'Form',
      name: 'msgap014',
      desc: '',
      args: [],
    );
  }

  /// `Web`
  String get msgap015 {
    return Intl.message(
      'Web',
      name: 'msgap015',
      desc: '',
      args: [],
    );
  }

  /// `Files`
  String get msgap016 {
    return Intl.message(
      'Files',
      name: 'msgap016',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get msgap017 {
    return Intl.message(
      'Settings',
      name: 'msgap017',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<L10n> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ja'),
      Locale.fromSubtags(languageCode: 'vi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<L10n> load(Locale locale) => L10n.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
