import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state/bloc/bloc/internet_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocConsumer<InternetBloc, InternetState>(
          listener: (context, state) {
            if (state is InternetGainedState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("data is connected"),
                  backgroundColor: Colors.green,
                  duration: Duration(seconds: 3),
                ),
              );
            } else if (state is InternetLostState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("data is disconnected"),
                  backgroundColor: Colors.red,
                  duration: Duration(seconds: 3),
                ),
              );
            }
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is InternetGainedState) {
              return Text("connection is on");
            } else if (state is InternetLostState) {
              return Text("disconnected");
            } else {
              return Text("Loading");
            }
          },
        ),
      ),
    );
  }
}
