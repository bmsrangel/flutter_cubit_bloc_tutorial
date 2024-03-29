import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/weather_bloc.dart';

class CityInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: TextField(
        onSubmitted: (value) => submitCityName(context, value),
        onChanged: (value) => print(value),
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: "Enter a city",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          suffixIcon: Icon(Icons.search),
        ),
      ),
    );
  }

  void submitCityName(BuildContext context, String cityName) {
    final WeatherBloc weatherBloc = context.read<WeatherBloc>();
    weatherBloc.add(GetWeather(cityName));
  }
}
