import 'package:task_app/features/events/data/data_source/remote_datasource/get_all_events_datasource.dart';
import 'package:task_app/features/events/domain/entities/event_entity.dart';
import 'package:task_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:task_app/features/events/domain/repositories/events_repository.dart';

import '../../../../core/errors/exception.dart';
import '../../../../core/network/network_info.dart';

class EventRepositoryImp extends EventsReporsitory {
  final EventsRemoteDataSource eventsRemoteDataSource;
  final NetworkInfo networkInfo;

  EventRepositoryImp(this.eventsRemoteDataSource, this.networkInfo);
  @override
  Future<Either<Failure, List<Event>>> getallEvents(
      String currentDate, int pageNumber) async {
    if (await networkInfo.isConnected) {
      try {
        final events = await eventsRemoteDataSource.getAllEvents(
            currentDate: currentDate, pageNumber: pageNumber);
        return Right(events);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
