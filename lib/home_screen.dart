import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state/bloc/bloc/internet_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            BlocBuilder<InternetBloc, InternetState>(builder: (context, state) {
          if (state is InternetGainedState) {
            return Text("connection is on");
          } else if (state is InternetLostState) {
            return Text("disconnected");
          } else {
            return Text("Loading");
          }
        }),
      ),
    );
  }
}
