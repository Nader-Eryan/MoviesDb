import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/manager/language_cubit/language_cubit.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../generated/l10n.dart';

class LanguageSection extends StatelessWidget {
  const LanguageSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            S.of(context).Language,
            style: Styles.textStyleBold18,
          ),
          BlocBuilder<LanguageCubit, LanguageState>(
            builder: (context, state) {
              return DropdownButton(
                  iconSize: 40,
                  iconEnabledColor: kActiveIcon,
                  items: const [
                    DropdownMenuItem(
                      value: 'en',
                      child: Text(
                        'English',
                        style: Styles.textStyleBold16,
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'ar',
                      child: Text(
                        'عربى',
                        style: Styles.textStyleBold16,
                      ),
                    ),
                  ],
                  onChanged: (val) {
                    BlocProvider.of<LanguageCubit>(context).switchLanguage(val);
                  });
            },
          ),
        ],
      ),
    );
  }
}
