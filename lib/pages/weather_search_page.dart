import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_bloc_tutorial/bloc/weather_bloc.dart';
import 'package:flutter_cubit_bloc_tutorial/data/model/weather.dart';
import 'package:flutter_cubit_bloc_tutorial/pages/widgets/city_input_field.dart';

class WeatherSearchPage extends StatefulWidget {
  @override
  _WeatherSearchPageState createState() => _WeatherSearchPageState();
}

class _WeatherSearchPageState extends State<WeatherSearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Search'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        alignment: Alignment.center,
        child: BlocConsumer<WeatherBloc, WeatherState>(
          listener: (context, state) {
            if (state is WeatherError) {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
          cubit: BlocProvider.of<WeatherBloc>(context),
          builder: (context, state) {
            if (state is WeatherInitial) {
              return _buildInitialInput();
            } else if (state is WeatherLoading) {
              return _buildLoading();
            } else if (state is WeatherLoaded) {
              return _buildColumnWithData(state.weather);
            } else {
              return _buildInitialInput();
            }
          },
        ),
      ),
    );
  }

  Widget _buildInitialInput() {
    return Center(
      child: CityInputField(),
    );
  }

  Widget _buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Column _buildColumnWithData(Weather weather) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          weather.cityName,
          style: TextStyle(
            fontSize: 40.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          "${weather.temperatureCelsius.toStringAsFixed(1)} °C",
          style: TextStyle(
            fontSize: 80.0,
          ),
        ),
        CityInputField(),
      ],
    );
  }
}
