import 'dart:developer';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:weather_app/api_repositories/weather_repository.dart';
import 'package:weather_app/models/weather_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:geolocator/geolocator.dart';

class WeatherCubit extends HydratedCubit<WeatherResponse> {
  WeatherCubit() : super(WeatherResponse());
  final WeatherRepo _weatherRepo = WeatherRepo();
  double currentLat = 21.1702;
  double currentLng = 72.8311;

  getWeather() async {
    try {
      await getCurrentLocation();
      emit(state.copyWith(isLoading: true));
      var response = await _weatherRepo.fetchWeather("data/2.5/forecast?lat=$currentLat&lon=$currentLng");
      emit(response.copyWith(isLoading: false));
    } catch (e) {
      log('Error: $e');
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> getCurrentLocation() async {
    // bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    // if (!serviceEnabled) {
    //   print('Location services are disabled.');
    //   return;
    // }

    // LocationPermission permission = await Geolocator.checkPermission();
    // if (permission == LocationPermission.denied) {
    //   permission = await Geolocator.requestPermission();
    //   if (permission != LocationPermission.whileInUse && permission != LocationPermission.always) {
    //     print('Location permission denied');
    //     return;
    //   }
    // }

    // Position position = await Geolocator.getCurrentPosition(
    //   desiredAccuracy: LocationAccuracy.high,
    // );

    // print('Latitude: ${position.latitude}');
    // print('Longitude: ${position.longitude}');
  }

  void updateWeather(WeatherResponse newWeather) {
    emit(newWeather.copyWith(isLoading: false));
  }

  @override
  WeatherResponse fromJson(Map<String, dynamic> json) {
    return WeatherResponse.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(WeatherResponse state) {
    return state.toJson();
  }
}
