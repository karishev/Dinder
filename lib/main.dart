import 'package:dinder/theme/main_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/main_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // static BuildContext staticMainContext;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: BlocProvider<MainBloc>(
        create: (BuildContext context) => MainBloc()..add(InitialMainEvent()),
        child: MaterialApp(
          theme: defaultTheme,
          debugShowCheckedModeBanner: false,
          home: BlocBuilder<MainBloc, MainState>(builder: (context, state) {
            return Container(
              color: Colors.white,
              child: Center(
                child: Text("Hello"),
              ),
            );
          }),
        ),
      ),
    );
  }
}
