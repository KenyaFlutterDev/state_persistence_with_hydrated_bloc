import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:state_persistence_example/cubits/auth_cubit.dart';
import 'package:state_persistence_example/cubits/login_cubit.dart';
import 'package:state_persistence_example/views/lauch/splash_screen.dart';

void main() async {
  // Make sure a WidgetsBinding instance exists
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize storage interface
  HydratedBloc.storage = await HydratedStorage.build();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(create: (context) => AuthCubit()),
        BlocProvider<LoginCubit>(create: (context) => LoginCubit()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}
