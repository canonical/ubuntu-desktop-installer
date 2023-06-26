import 'package:flutter/material.dart';
import 'package:yaru_colors/yaru_colors.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

extension WizardThemeDataX on ThemeData {
  ThemeData customize() {
    final errorColor = brightness == Brightness.light
        ? YaruColors.red[700]!
        : YaruColors.red[300]!;
    final mouseCursor = MaterialStateProperty.all(SystemMouseCursors.basic);
    return copyWith(
      colorScheme: colorScheme.copyWith(error: errorColor),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: elevatedButtonTheme.style!.copyWith(mouseCursor: mouseCursor),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: filledButtonTheme.style!.copyWith(mouseCursor: mouseCursor),
      ),
      floatingActionButtonTheme:
          floatingActionButtonTheme.copyWith(mouseCursor: mouseCursor),
      iconButtonTheme: IconButtonThemeData(
        style: iconButtonTheme.style!.copyWith(mouseCursor: mouseCursor),
      ),
      inputDecorationTheme: inputDecorationTheme.copyWith(
        floatingLabelStyle: MaterialStateTextStyle.resolveWith((states) {
          final textStyle = textTheme.bodyLarge ?? const TextStyle();
          if (states.contains(MaterialState.error)) {
            return textStyle.copyWith(color: errorColor);
          }
          if (states.contains(MaterialState.focused)) {
            return textStyle.copyWith(color: colorScheme.onSurface);
          }
          if (states.contains(MaterialState.disabled)) {
            return textStyle.copyWith(
                color: colorScheme.onSurface.withOpacity(0.38));
          }
          return textStyle.copyWith(color: colorScheme.onSurfaceVariant);
        }),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorScheme.onSurface),
          borderRadius: BorderRadius.circular(kYaruButtonRadius),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: errorColor),
          borderRadius: BorderRadius.circular(kYaruButtonRadius),
        ),
      ),
      listTileTheme: listTileTheme.copyWith(mouseCursor: mouseCursor),
      menuButtonTheme: MenuButtonThemeData(
        style: MenuItemButton.styleFrom(
          enabledMouseCursor: SystemMouseCursors.basic,
          disabledMouseCursor: SystemMouseCursors.basic,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: outlinedButtonTheme.style!.copyWith(mouseCursor: mouseCursor),
      ),
      popupMenuTheme: popupMenuTheme.copyWith(mouseCursor: mouseCursor),
      sliderTheme: sliderTheme.copyWith(mouseCursor: mouseCursor),
      textButtonTheme: TextButtonThemeData(
        style: textButtonTheme.style!.copyWith(mouseCursor: mouseCursor),
      ),
      extensions: [
        ...extensions.values,
        YaruCheckboxThemeData(mouseCursor: mouseCursor),
        YaruPageIndicatorThemeData(mouseCursor: mouseCursor),
        YaruRadioThemeData(mouseCursor: mouseCursor),
        YaruSwitchThemeData(mouseCursor: mouseCursor),
        YaruTitleBarThemeData(
          backgroundColor: MaterialStatePropertyAll(colorScheme.background),
        ),
        YaruToggleButtonThemeData(mouseCursor: mouseCursor),
      ],
    );
  }
}
