import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/manager/brightness_cubit/brightness_cubit.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../generated/l10n.dart';

class BrightnessSection extends StatelessWidget {
  const BrightnessSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            S.of(context).AppTheme,
            style: Styles.textStyleBold18,
          ),
          BlocBuilder<BrightnessCubit, BrightnessState>(
            builder: (context, state) {
              return DropdownButton(
                  iconSize: 40,
                  iconEnabledColor: kActiveIcon,
                  items: [
                    DropdownMenuItem(
                      value: 'light',
                      child: Text(
                        S.of(context).Light,
                        style: Styles.textStyleBold16,
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'dark',
                      child: Text(
                        S.of(context).Dark,
                        style: Styles.textStyleBold16,
                      ),
                    ),
                  ],
                  onChanged: (val) {
                    BlocProvider.of<BrightnessCubit>(context)
                        .switchBrightnessMode(val);
                  });
            },
          ),
        ],
      ),
    );
  }
}
