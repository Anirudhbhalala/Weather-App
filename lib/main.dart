import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:weather_app/bloc/weather_cubit.dart';
import 'package:weather_app/screens/weathers_list_screen.dart';
import 'package:weather_app/services/api_interceptors.dart';

Dio dio = Dio();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  dio.interceptors.add(ApiInterceptor());
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => WeatherCubit(),
        child: const WeathersListScreen(),
      ),
    );
  }
}
