import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:state_persistence_example/config/config.dart';
import 'package:state_persistence_example/cubits/auth_cubit.dart';
import 'package:state_persistence_example/cubits/login_cubit.dart';
import 'package:state_persistence_example/views/home/home_screen.dart';

class DetailsScreen extends StatelessWidget {
  final GlobalKey<FormBuilderState> _detailsFormKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: FormBuilder(
              key: _detailsFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/fdk_logo.png', height: MediaQuery.of(context).size.height * 0.2),
                  SizedBox(height: 30.0),
                  Text(
                    'Enter your details to continue',
                    style: CustomFonts.nunito.copyWith(fontSize: 24.0, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Name',
                    style: CustomFonts.nunito.copyWith(fontWeight: FontWeight.w600, fontSize: 18.0),
                  ),
                  SizedBox(height: 5.0),
                  FormBuilderTextField(
                    name: 'name',
                    style: CustomFonts.nunito.copyWith(fontWeight: FontWeight.w600, fontSize: 16.0),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person_outline),
                      hintText: 'Enter your full names',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.lightBlue),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.lightBlue),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                    ),
                    validator: FormBuilderValidators.compose([FormBuilderValidators.required(context)]),
                  ),
                  SizedBox(height: 15.0),
                  Text(
                    'Email Address',
                    style: CustomFonts.nunito.copyWith(fontWeight: FontWeight.w600, fontSize: 18.0),
                  ),
                  SizedBox(height: 5.0),
                  FormBuilderTextField(
                    name: 'email',
                    style: CustomFonts.nunito.copyWith(fontWeight: FontWeight.w600, fontSize: 16.0),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.mail_outline),
                      hintText: 'Enter your email address',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.lightBlue),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.lightBlue),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context),
                      FormBuilderValidators.email(context),
                    ]),
                  ),
                  SizedBox(height: 30.0),
                  BlocConsumer<LoginCubit, LoginState>(
                    listener: (context, state) {
                      if (state is LoginStateSuccess) {
                        // authenticate user
                        context.read<AuthCubit>().authenticateUser(state.user);

                        // Go to home screen
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeScreen()), (route) => false);
                      }
                    },
                    builder: (context, state) {
                      if (state is LoginStateProgress) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return ButtonTheme(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          ),
                          child: MaterialButton(
                            onPressed: () {
                              if (_detailsFormKey.currentState.saveAndValidate()) {
                                context.read<LoginCubit>().login(_detailsFormKey.currentState.value);
                              }
                            },
                            color: Theme.of(context).primaryColor,
                            height: 60.0,
                            elevation: 10.0,
                            textColor: Colors.white,
                            child: Center(
                              child: FittedBox(
                                child: Text(
                                  'SUBMIT',
                                  style: CustomFonts.nunito.copyWith(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
