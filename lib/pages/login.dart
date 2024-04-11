import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

import '../bloc/login_bloc/authentication_bloc.dart';
import '../custom_widget/input_filld.dart';
import '../custom_widget/password_input_filed.dart';
import '../custom_widget/submit_button.dart';
import '../utils/custom_validator.dart';


class LoginScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final AuthenticationBloc authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    bool  visibility =true;
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            if (state is SuccessState) {
              // Navigate to home page
            } else if (state is FailerState) {
              // Show error message
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CustomInputText(

                    labelText: 'Email',
                    controller: usernameController,
                    obscureText: false,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    onChanged: (value) {
                      // Handle username change
                    },
                    validator: CustomValidator.validateEmail,
                    leftIcon: Icons.email,
                    rightIcon: Icons.clear,
                    onRightIconPressed: () {
                      usernameController.text="";
                    },
                    rightSvgIcon: '',
                    leftSvgIcon: '',
                    leftAssetIcon: '',
                    rightAssetIcon: '',
                    onLeftIconPressed: () {  },
                  ),
                  const SizedBox(height: 10,),
                 PasswordInputText(
                    labelText: 'Password',
                    controller: passwordController,

                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    onChanged: (value) {
                      // Handle username change
                    },
                    validator: CustomValidator.validatePassword,
                    leftIcon: Icons.password,
                    rightIcon: Icons.visibility_off,
                    onLeftIconPressed: (){},
                    onRightIconPressed: () {
                     passwordController.text="";
                   },
                  ),

                  const SizedBox(height: 10,),
                  CustomSubmitButton(
                    text: "Submit",

                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        /*   authenticationBloc.add(LoginRequested(
                        usernameController.text,
                        passwordController.text,
                      ));*/
                        print('Form is valid');
                      }
                    }, key: null,

                  ),
                  /*  RaisedButton(
                  onPressed: () {
                    authenticationBloc.add(LoginRequested(
                      usernameController.text,
                      passwordController.text,
                    ));
                  },
                  child: Text('Login'),
                ),*/
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
