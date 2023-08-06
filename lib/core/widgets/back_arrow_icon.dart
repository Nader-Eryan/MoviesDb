import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_for_tonight/features/home/presentation/manager/cubit/brightness_cubit.dart';

class BackArrowIcon extends StatelessWidget {
  const BackArrowIcon({super.key, required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    bool isDark = BlocProvider.of<BrightnessCubit>(context).isDark;
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: isDark ? Colors.black : Colors.white,
        shape: BoxShape.circle,
        border: Border.all(width: 1, color: Colors.grey.shade600),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Icons.arrow_back_ios_new,
          size: 16,
        ),
      ),
    );
  }
}
