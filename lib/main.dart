import 'package:first_project/features/simple_app/domain/usecases/get_data.dart';
import 'package:first_project/features/simple_app/presentation/auth/blocs/auth/auth_bloc.dart';
import 'package:first_project/features/simple_app/presentation/auth/blocs/data/data_bloc.dart';
import 'package:first_project/features/simple_app/presentation/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/simple_app/presentation/pages/detail_page.dart';
import 'injection_container.dart' as di;

import 'features/simple_app/domain/usecases/post_login.dart';
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(
            sl(),
          ),
        ),
        BlocProvider<DataBloc>(
          create: (context) => DataBloc(
            sl(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page',),
        routes: {
          MainPage.routeName: (ctx) => MainPage(),
          DetailPage.routeName: (ctx) => DetailPage(),
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    BlocProvider.of<AuthBloc>(context).add(LoginEvent(LoginParams(
      email: "marko@gmail.com",
      password: "marko123",
    )));
  }

  void _nekaFuncija(String token) {
    BlocProvider.of<DataBloc>(context).add(GetDataEvent(DataParams(
      authToken: token,
    )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is AuthFailure) {
                  return const Text("Ne uspesan login");
                } else if (state is AuthSuccess) {
                  return Column(
                    children: [
                      Text("Pozdrav ${state.localId}"),
                      TextButton(
                        onPressed: () => _nekaFuncija(state.userToken),
                        child: const Text("Get Data"),
                      )
                    ],
                  );
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Please log in!',
                    ),
                    Text(
                      '$_counter',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
                );
              },
            ),
            BlocListener<DataBloc, DataState>(
              bloc: sl<DataBloc>(),
              child: const Text("Neki child"),
              listener: (context, state) {
                if (state is DataFailure) {
                   const Text("Ne uspesan get data");
                } else if (state is DataSuccess) {
                  Navigator.of(context).pushNamed(
                    MainPage.routeName,
                    arguments: state.listOfItems,
                  );
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
