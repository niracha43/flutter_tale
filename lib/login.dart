import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:mobile_project/bloc/authen/authen_bloc.dart';
import 'package:mobile_project/home_page.dart';

import 'constants.dart';

class Login extends StatelessWidget {
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        backgroundColor: kSecondaryColor,
        elevation: 0.0,
      ),
      body: BlocProvider(
        create: (BuildContext context) => AuthenBloc(),
        child: BlocListener<AuthenBloc, AuthenState>(
          listener: (context, state) {
            print(state.status);
            if (state.status == FormzStatus.submissionSuccess) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            }
          },
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50.0),
                topRight: Radius.circular(50.0),
              ),
            ),
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  BlocBuilder<AuthenBloc, AuthenState>(
                    builder: (context, state) {
                      return TextField(
                        onChanged: (username) {
                          BlocProvider.of<AuthenBloc>(context)
                            ..add(LoginUsernameChanged(username));
                        },
                        autocorrect: true,
                        decoration: InputDecoration(
                          hintText: 'Enter your email',
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 3,
                            ),
                          ),
                          prefixIcon: IconTheme(
                            data: IconThemeData(
                              color: Theme.of(context).primaryColor,
                            ),
                            child: Icon(Icons.email),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 20),
                  BlocBuilder<AuthenBloc, AuthenState>(
                    builder: (context, state) {
                      return TextField(
                        onChanged: (password) {
                          BlocProvider.of<AuthenBloc>(context)
                            ..add(LoginPasswordChanged(password));
                        },
                        autocorrect: true,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Enter your password',
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 3,
                            ),
                          ),
                          prefixIcon: IconTheme(
                            data: IconThemeData(
                              color: Theme.of(context).primaryColor,
                            ),
                            child: Icon(Icons.lock),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              // setState(() {
                              //   hidePassword = !hidePassword;
                              // });
                            },
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.4),
                            icon: Icon(hidePassword
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Center(
                      child: BlocBuilder<AuthenBloc, AuthenState>(
                        builder: (context, state) {
                          return FlatButton(
                            onPressed: () {
                              BlocProvider.of<AuthenBloc>(context)
                                ..add(LoginSubmitted());
                            },
                            padding: EdgeInsets.all(16),
                            color: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'LOGIN',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  size: 25,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
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
