import 'package:airplane/cubit/page_cubit.dart';
import 'package:flutter/material.dart';
import '../../Shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomIconNavbar extends StatelessWidget {
  final String urlIcon;
  final int index;

  const CustomIconNavbar({Key? key, required this.urlIcon, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<PageCubit>().setPage(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 15,
          ),
          Image.asset(
            urlIcon,
            color: context.read<PageCubit>().state == index
                ? primaryColor
                : greyColor,
            width: 24,
            height: 24,
          ),
          Container(
            height: 2,
            width: 30,
            decoration: BoxDecoration(
                color: context.read<PageCubit>().state == index
                    ? primaryColor
                    : colorTransparent),
          )
        ],
      ),
    );
  }
}
