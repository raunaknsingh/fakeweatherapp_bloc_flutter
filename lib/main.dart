import 'package:flutter/material.dart';
import 'package:weather_bloc_flutter/bloc/weather_bloc.dart';
import 'package:weather_bloc_flutter/data/weather_repository.dart';

import 'pages/weather_search_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: BlocProvider(
        create: (context) => WeatherBloc(FakeWeatherRepository()),
        child: WeatherSearchPage(),
      ),
    );
  }
}
