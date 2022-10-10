import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/event_entity.dart';

abstract class EventsReporsitory{
   Future<Either<Failure,List<Event>>> getallEvents(String currentDate,int pageNumber);

}
