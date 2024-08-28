import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/bloc/weather_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/models/weather_response_model.dart';

class WeathersListScreen extends StatefulWidget {
  const WeathersListScreen({super.key});

  @override
  State<WeathersListScreen> createState() => _WeathersListScreenState();
}

class _WeathersListScreenState extends State<WeathersListScreen> {
  @override
  void initState() {
    // TODO: implement initState
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<WeatherCubit>().getWeather();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weathers List"),
      ),
      body: BlocBuilder<WeatherCubit, WeatherResponse>(
        builder: (context, state) {
          return state.isLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: (state.list ?? []).length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("${state.list![index].main?.temp ?? 0} C"),
                      subtitle: Text(DateFormat('d MMM yyyy, h:mm a').format(DateTime.fromMillisecondsSinceEpoch(state.list![index].dt! * 1000))),
                    );
                  },
                );
        },
      ),
    );
  }
}
