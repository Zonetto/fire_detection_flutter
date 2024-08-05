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

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// ``
  String get login {
    return Intl.message(
      '',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get jobNumber {
    return Intl.message(
      '',
      name: 'jobNumber',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get pass {
    return Intl.message(
      '',
      name: 'pass',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get civilDefenseDivision {
    return Intl.message(
      '',
      name: 'civilDefenseDivision',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get reserved {
    return Intl.message(
      '',
      name: 'reserved',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get found {
    return Intl.message(
      '',
      name: 'found',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get notFound {
    return Intl.message(
      '',
      name: 'notFound',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get discover {
    return Intl.message(
      '',
      name: 'discover',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get notDiscover {
    return Intl.message(
      '',
      name: 'notDiscover',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get firefighters {
    return Intl.message(
      '',
      name: 'firefighters',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get extinguishersNotFound {
    return Intl.message(
      '',
      name: 'extinguishersNotFound',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get extinguishersFound {
    return Intl.message(
      '',
      name: 'extinguishersFound',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
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
