// ignore_for_file: prefer_const_constructors
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state/cubits/internet_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocConsumer<InternetCubit, InternetState>(
          listener: (context, state) {
            if (state == InternetState.gain) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("data is connected"),
                  backgroundColor: Colors.green,
                  duration: Duration(seconds: 3),
                ),
              );
            } else if (state == InternetState.lost) {
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
            if (state == InternetState.gain) {
              return Text("connection is on");
            } else if (state == InternetState.lost) {
              // ignore: prefer_const_constructors
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
