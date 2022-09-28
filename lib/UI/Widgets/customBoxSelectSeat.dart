import 'package:airplane/cubit/seat_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:airplane/Shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBoxSelectSeat extends StatelessWidget {
  final String idSeat;
  final bool isAvailable;

  const CustomBoxSelectSeat(
      {Key? key, required this.idSeat, this.isAvailable = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSelected = context.watch<SeatCubitCubit>().isSelected(idSeat);

    backgroundColor() {
      if (isAvailable) {
        if (isSelected) {
          return primaryColor;
        } else {
          return availableColor;
        }
      } else {
        return unavailableColor;
      }
    }

    borderColor() {
      if (!isAvailable) {
        return unavailableColor;
      } else {
        return primaryColor;
      }
    }

    child() {
      if (isSelected) {
        return Center(
          child: Text(
            'YOU',
            style: whiteTextStyle.copyWith(fontWeight: semiBold),
          ),
        );
      } else {
        return SizedBox();
      }
    }

    return GestureDetector(
      onTap: () {
        if (isAvailable) {
          context.read<SeatCubitCubit>().selectSeat(idSeat);
        }
      },
      child: Container(
          margin: EdgeInsets.only(right: 10, top: 10),
          height: 48,
          width: 48,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: backgroundColor(),
              border: Border.all(color: borderColor())),
          child: child()),
    );
  }
}
