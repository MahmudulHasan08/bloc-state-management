import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state/bloc/counter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return Text("incement data ${state.count.toString()}");
            },
          ),
          SizedBox(
            height: 20,
          ),
          BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return CupertinoButton(
                color: Colors.blue,
                child: Text("Increment"),
                onPressed: () {
                  context.read<CounterBloc>().add(IncrementCounterEvent());
                },
              );
            },
          ),
          SizedBox(
            height: 20,
          ),
          CupertinoButton(
            color: Colors.blue,
            child: Text("Decrement"),
            onPressed: () {
              context.read<CounterBloc>().add(DecrementCounterEvent());
            },
          ),
        ],
      ),
    ));
  }
}
