import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_persistence_example/config/config.dart';
import 'package:state_persistence_example/cubits/auth_cubit.dart';
import 'package:state_persistence_example/models/user.dart';
import 'package:state_persistence_example/views/auth/details_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User authenticatedUser;

  @override
  void initState() {
    final authState = BlocProvider.of<AuthCubit>(context).state;
    if (authState is AuthStateAuthenticated) {
      authenticatedUser = authState.authenticatedUser;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 48.0, horizontal: 24.0),
          // TODO: Display user details
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Hi ${authenticatedUser.name},",
                style: CustomFonts.nunito.copyWith(fontWeight: FontWeight.w700, fontSize: 22.0),
              ),
              SizedBox(height: 5.0),
              Text(
                "Your email address is ${authenticatedUser.email}.",
                style: CustomFonts.nunito.copyWith(fontWeight: FontWeight.w600, fontSize: 18.0),
              ),
              SizedBox(height: 30.0),
              ButtonTheme(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                child: MaterialButton(
                  onPressed: () {
                    context.read<AuthCubit>().logout();
                    // Go to home screen
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => DetailsScreen()), (route) => false);
                  },
                  color: Theme.of(context).primaryColor,
                  height: 50.0,
                  elevation: 10.0,
                  textColor: Colors.white,
                  child: Center(
                    child: FittedBox(
                      child: Text(
                        'SIGN OUT',
                        style: CustomFonts.nunito.copyWith(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
