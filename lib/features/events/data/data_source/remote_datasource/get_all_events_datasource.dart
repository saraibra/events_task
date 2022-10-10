import 'dart:convert';

import 'package:task_app/core/utils/constants.dart';
import 'package:task_app/features/events/data/models/event_model.dart';
import 'package:http/http.dart' as http;

import '../../../../../core/errors/exception.dart';

abstract class EventsRemoteDataSource {
  Future<List<EventModel>> getAllEvents(
      {required String currentDate, required int pageNumber});
}

class EventsRemoteDataSourceImplement implements EventsRemoteDataSource {
  final http.Client client;
  
  EventsRemoteDataSourceImplement({required this.client});

  @override
  Future< List<EventModel>> getAllEvents(
      {required String currentDate, required int pageNumber}) async {
        String getEventsEndPoint =
      'http://test.meetntrain.com/v1/profile/events/upcoming/8357/?page=$pageNumber&date_gte=$currentDate';
    final response = await client.get(Uri.parse(getEventsEndPoint),
        headers: {'Authorization': token, 'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      List<EventModel> eventslist = [];
      final decodedJson = json.decode(response.body);
      decodedJson.forEach((event)=>eventslist.add(  EventModel.fromJson(event)));

      return eventslist;
    } else {
      throw ServerException();
    }
  }
}
