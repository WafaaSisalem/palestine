import 'package:flutter/material.dart';
import 'package:palestine/colorhelper.dart';

class SquareEventCard extends StatelessWidget {
  const SquareEventCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SizedBox(
        width: 205,
        height: 194,
        child: Stack(
          children: [buildBorderLowerPart(), buildUpperPart()],
        ),
      ),
    ));
  }

  buildBorderLowerPart() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9), color: ColorHelper.green0C),
    );
  }

  buildUpperPart() {
    return Positioned(
      bottom: 1,
      child: Container(
        height: 194,
        width: 205,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9), color: Colors.white),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                decoration: const BoxDecoration(
                  color: ColorHelper.greyD9,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(9),
                    topRight: Radius.circular(9),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildTitleWidget(),
                  buildDateWidget(),
                  buildLocationWidget(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  buildDateWidget() {
    return Row(
      children: const [
        Icon(
          Icons.calendar_month,
          color: ColorHelper.green0C,
          size: 14,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          'Tue ,17 May, 2032',
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 11),
        )
      ],
    );
  }

  buildLocationWidget() {
    return Row(
      children: const [
        Icon(
          Icons.location_on_outlined,
          color: ColorHelper.green0C,
          size: 14,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          'Sweden, Malmo',
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 11),
        )
      ],
    );
  }

  buildTitleWidget() {
    return const SizedBox(
      width: 260,
      child: Text(
        'Women in Business Summit',
        maxLines: 1,
        style: TextStyle(
            overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.w400,
            color: ColorHelper.green0C,
            fontSize: 12),
      ),
    );
  }
}
