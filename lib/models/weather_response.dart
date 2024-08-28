// import 'package:built_value/built_value.dart';
// import 'package:built_value/serializer.dart';

// part 'weather_data.g.dart';

// @BuiltValue()
// abstract class WeatherData implements Built<WeatherData, WeatherDataBuilder> {
//   WeatherData._();

//   factory WeatherData([void Function(WeatherDataBuilder b) updates]) = _$WeatherData;

//   int get cod;
//   int get message;
//   int get cnt;
//   BuiltList<Weather> get list;
// }

// @BuiltValue()
// abstract class Weather implements Built<Weather, WeatherBuilder> {
//   Weather._();

//   factory Weather([void Function(WeatherBuilder b) updates]) = _$Weather;

//   int get dt;
//   WeatherMain get main;
// }

// @BuiltValue()
// abstract class WeatherMain implements Built<WeatherMain, WeatherMainBuilder> {
//   WeatherMain._();

//   factory WeatherMain([void Function(WeatherMainBuilder b) updates]) = _$WeatherMain;

//   double get temp;
//   double get feels_like;
//   double get temp_min;
//   double get temp_max;
//   int get pressure;
//   int get sea_level;
//   int get grnd_level;
//   int get humidity;
//   double get temp_kf;
// }
