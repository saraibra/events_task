import 'package:flutter/material.dart';
import 'package:task_app/core/resources/theme_manager.dart';
import 'core/service_locator.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'features/events/presentation/bloc/events_bloc.dart';
import 'features/events/presentation/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('ar_EG',null);
    return  MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              di.sl<EventsBloc>()..add(GetAllEventsEvent())),
        
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: getApplicationTheme(),
        home: HomeScreen(),
      ),
    );
  }
}

