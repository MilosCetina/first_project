import 'package:first_project/features/simple_app/presentation/auth/blocs/auth/auth_bloc.dart';
import 'package:first_project/features/simple_app/presentation/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if(state is AuthInitial){
        return const SplashPage();
      } else if(state is AuthFailure){

      }
    });
  }
}
