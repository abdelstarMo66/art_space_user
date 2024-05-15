import 'package:art_space_user/core/networking/local/prefs_manager.dart';
import 'package:art_space_user/core/networking/local/shared_preferences.dart';
import 'package:art_space_user/core/utils/assets_manager.dart';
import 'package:art_space_user/features/profile/ui/widgets/profile_item.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';

class CurrencyWidget extends StatefulWidget {
  const CurrencyWidget({super.key});

  @override
  State<CurrencyWidget> createState() => _CurrencyWidgetState();
}

class _CurrencyWidgetState extends State<CurrencyWidget> {
  @override
  Widget build(BuildContext context) {
    return ProfileItem(
      icon: AssetsManager.icAmount,
      title: "Currency",
      subTitle:
          "${SharedPreferencesManager.getData(key: PrefsManager.currencySymbol)} ${SharedPreferencesManager.getData(key: PrefsManager.currencyName)}",
      onTap: () {
        showCurrencyPicker(
          context: context,
          showFlag: true,
          showCurrencyName: true,
          showCurrencyCode: true,
          onSelect: (Currency currency) {
            SharedPreferencesManager.saveData(
                key: PrefsManager.currencyName, value: currency.code);
            SharedPreferencesManager.saveData(
                key: PrefsManager.currencySymbol, value: currency.symbol);
            setState(() {});
          },
        );
      },
    );
  }
}
