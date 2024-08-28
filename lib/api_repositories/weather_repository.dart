import 'package:weather_app/models/weather_response_model.dart';
import 'package:weather_app/services/api_service.dart';

class WeatherRepo extends ApiService {
  Future<WeatherResponse> fetchWeather(String endPoint) async {
    var response = await get(endPoint: endPoint, queryParameters: {"appid": ""});

    if (response['cod'] != "200") {
      return WeatherResponse(
        message: 1,
        cod: "200",
      );
    }
    return WeatherResponse.fromJson(response);
  }
}
