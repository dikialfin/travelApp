import 'package:airplane/Shared/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomInterest extends StatelessWidget {
  final String interest;

  const CustomInterest({Key? key, required this.interest}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/img/icons/icon_check.png'))),
          ),
          SizedBox(
            width: 6,
          ),
          Text(
            interest,
            style: blackTextStyle.copyWith(fontWeight: regular),
          )
        ],
      ),
    );
  }
}
