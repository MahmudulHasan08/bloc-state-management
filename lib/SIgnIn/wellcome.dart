import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state/SIgnIn/bloc/sign_in_bloc.dart';
import 'package:flutter_state/SIgnIn/from.dart';
import "package:get/get.dart";

class WellcomePage extends StatelessWidget {
  const WellcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CupertinoButton(
              color: Colors.red,
              child: Text("SIngIn"),
              onPressed: () => Get.to(
                () => BlocProvider(
                  create: (context) => SignInBloc(),
                  child: FromScreen(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
