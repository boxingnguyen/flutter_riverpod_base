import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider_base/common/core/theme/app_theme_state_notifier.dart';
import 'package:provider_base/l10n/l10n.dart';

class SwitchThemebutton extends HookConsumerWidget {
  const SwitchThemebutton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeProvider = ref.watch(appThemeProvider);

    return Row(
      children: [
        Text(L10n.of(context).msgap009),
        Switch.adaptive(
          onChanged: (value) {
            ref.read(appThemeProvider.notifier).toggleAppTheme();
          },
          value: themeProvider.onDarkMode,
        ),
      ],
    );
  }
}
