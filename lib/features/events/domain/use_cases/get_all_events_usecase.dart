import 'package:dartz/dartz.dart';

import 'package:task_app/features/events/domain/repositories/events_repository.dart';

import '../../../../core/errors/failure.dart';
import '../entities/event_entity.dart';

class GetAllEventsUseCase {
  final EventsReporsitory reporsitory;
  GetAllEventsUseCase(this.reporsitory);
  Future<Either<Failure, List<Event>>> call(
      {required String currentDate, required int pageNumber}) async {
    return await reporsitory.getallEvents(currentDate, pageNumber);
  }
}
