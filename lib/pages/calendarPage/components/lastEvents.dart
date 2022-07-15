import 'package:flutter/material.dart';

import '../../../constant.dart';
import '../../../models/event.dart';
import 'lastEventsCardBody.dart';

class LastEvents extends StatelessWidget {
  const LastEvents({
    Key? key,
    required bool isLoad,
    required List<Event> events,
  }) : _isLoad = isLoad, _events = events, super(key: key);

  final bool _isLoad;
  final List<Event> _events;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: const [
              Text(
                'Ближайшие события',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: lightInfoColor,
                    fontFamily: 'SF'),
              ),
            ],
          ),
          _isLoad
              ? ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _events.length,
            itemBuilder: (context, index) => LastEventCardBody(
              event: _events[index],
            ),
          )
              : const Padding(
            padding: EdgeInsets.only(top: 30),
            child: CircularProgressIndicator(
              color: blueBgColor,
            ),
          ),
        ],
      ),
    );
  }
}