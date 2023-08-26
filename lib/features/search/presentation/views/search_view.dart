import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:size_config/size_config.dart';
import 'package:whats_for_tonight/core/utils/constants.dart';
import 'package:whats_for_tonight/core/utils/styles.dart';
import 'package:whats_for_tonight/core/widgets/custom_error_widget.dart';
import 'package:whats_for_tonight/features/search/presentation/manager/cubit/search_cubit.dart';

import '../../../../core/widgets/separated_list.dart';
import '../../../../generated/l10n.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Column(
          children: [
            SizedBox(
              height: 25.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: TextField(
                onSubmitted: (value) {
                  BlocProvider.of<SearchCubit>(context)
                      .searchShow(showName: value);
                },
                decoration: InputDecoration(
                    hintText: S.of(context).Search,
                    hintStyle: TextStyle(color: Colors.grey.shade500),
                    prefixIcon: const Icon(
                      FontAwesomeIcons.magnifyingGlass,
                      color: kActiveIcon,
                    ),
                    iconColor: kActiveIcon,
                    filled: true,
                    focusColor: Colors.amberAccent,
                    enabledBorder: searchFieldBorder(),
                    focusedBorder: searchFieldBorder()),
              ),
            ),
            BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state is SearchSuccess) {
                  if (state.searchList.isNotEmpty) {
                    return Expanded(
                      child: MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: SeparatedList(
                          showList: state.searchList,
                        ),
                      ),
                    );
                  } else {
                    return Center(
                      child: FittedBox(
                        child: Text(
                          S.of(context).SearchForAValidShow,
                          style: Styles.textStyleBold18,
                        ),
                      ),
                    );
                  }
                } else if (state is SearchFailure) {
                  return CustomErrorWidget(errMessage: state.errMessage);
                } else if (state is SearchInitial) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 16),
                    child: Center(
                      child: Text(
                        S.of(context).SearchForAValidShow,
                        style: Styles.textStyleBold20,
                      ),
                    ),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  OutlineInputBorder searchFieldBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.shade600),
      borderRadius: BorderRadius.circular(24),
    );
  }
}
