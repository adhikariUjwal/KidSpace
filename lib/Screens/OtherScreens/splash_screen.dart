import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kidspace/Screens/OtherScreens/login_screen.dart';
import 'package:kidspace/Widgets/bottom_bar.dart';
import 'package:kidspace/blocs/internet_bloc/internet_bloc.dart';
import 'package:kidspace/blocs/internet_bloc/internet_state.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/background/Splash screen.png"),fit: BoxFit.cover)),
          child: Center(
            child: BlocBuilder<InternetBloc, InternetState>(
              builder: (context, state) {
                if (state is InternetGainedState) {
                  return const LoginScreen();
                } else {
                  return AlertDialog(
                    alignment: AlignmentDirectional.bottomEnd,
                    title: const Text('Network Problem'),
                    content: const Text("Internet connection not available!"),
                    actionsAlignment: MainAxisAlignment.spaceBetween,
                    actions: <Widget>[
                      const CircularProgressIndicator(),
                      TextButton(
                          onPressed: () {
                            SystemNavigator.pop();
                          },
                          child: const Text("Exit")),
                    ],
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
