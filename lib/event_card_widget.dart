import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:palestine/event_model.dart';
import 'colorhelper.dart';

class EventCardWidget extends StatelessWidget {
  const EventCardWidget({super.key, required this.event});
  final EventModel event;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [buildLeftBorderWidget(), buildUpperPart()],
    );
  }

  Positioned buildUpperPart() {
    return Positioned(
      left: 1,
      child: Container(
        height: 81,
        width: 320,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6), color: ColorHelper.greyF9),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 13, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildCardTitleWidget(),
                      buildDateAndLocationWidget(),
                    ],
                  ),
                  const Expanded(child: SizedBox()),
                  buildGoButton()
                ],
              ),
              buildDescriptionWidget()
            ],
          ),
        ),
      ),
    );
  }

  Container buildLeftBorderWidget() {
    return Container(
      width: double.infinity,
      height: 81,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6), color: ColorHelper.green0C),
    );
  }

  Row buildDateAndLocationWidget() {
    return Row(
      children: [
        Text(
          DateFormat('EEE, d MMM, y').format(event.date),
          style: const TextStyle(fontSize: 10),
        ),
        const Icon(
          Icons.location_pin,
          size: 11,
        ),
        Text(
          event.country,
          style: const TextStyle(fontSize: 10),
        )
      ],
    );
  }

  Text buildDescriptionWidget() {
    return Text(
      event.description,
      maxLines: 2,
      style: const TextStyle(
          fontSize: 11,
          overflow: TextOverflow.ellipsis,
          fontWeight: FontWeight.w200),
    );
  }

  Container buildGoButton() {
    return Container(
      width: 51,
      height: 27,
      decoration: BoxDecoration(
          color: ColorHelper.green0C, borderRadius: BorderRadius.circular(5)),
      child: const Center(
        child: Text(
          'Go',
          style: TextStyle(color: Colors.white, fontSize: 9),
        ),
      ),
    );
  }

  buildCardTitleWidget() {
    return SizedBox(
      width: 200,
      child: Text(
        event.title,
        maxLines: 1,
        style: const TextStyle(
            overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.bold,
            color: ColorHelper.green0C,
            fontSize: 15),
      ),
    );
  }
}
