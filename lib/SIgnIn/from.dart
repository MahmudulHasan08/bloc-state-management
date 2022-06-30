import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state/SIgnIn/bloc/sign_in_bloc.dart';

class FromScreen extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: BlocBuilder<SignInBloc, SignInState>(
                  builder: (context, state) {
                    if (state is SingInErrorState) {
                      return Text(
                        state.errorMessag,
                        style: const TextStyle(color: Colors.red, fontSize: 20),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black54, width: 1),
                ),
                height: 50,
                width: double.maxFinite,
                child: Center(
                  child: TextField(
                    onChanged: (val) {
                      BlocProvider.of<SignInBloc>(context).add(
                        SignInTextFieldChangeEvent(
                            _emailController.text, _passController.text),
                      );
                    },
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: "Email",
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black54, width: 1),
                ),
                height: 50,
                width: double.maxFinite,
                child: Center(
                  child: TextField(
                    controller: _passController,
                    onChanged: (val) {
                      BlocProvider.of<SignInBloc>(context).add(
                        SignInTextFieldChangeEvent(
                            _emailController.text, _passController.text),
                      );
                    },
                    decoration: InputDecoration(
                      hintText: "Password",
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<SignInBloc, SignInState>(
                builder: (context, state) {
                  if (state is SignInLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(color: Colors.red),
                    );
                  }
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: (state is SingInvalidState)
                          ? Colors.blue
                          : Colors.grey,
                    ),
                    onPressed: () {
                      if (state is SingInvalidState) {
                        BlocProvider.of<SignInBloc>(context).add(
                          SignInButtonEvent(
                              _emailController.text, _passController.text),
                        );
                      }
                    },
                    child: Text(
                      "Sign In",
                      style: TextStyle(fontSize: 20),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
