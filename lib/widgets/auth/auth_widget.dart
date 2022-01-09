import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:move_demo/Theme/app_button_style.dart';
import 'package:move_demo/widgets/main_screen/main_screen_widget.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  _AuthWidgetState createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login to your account'),
        ),
        body: ListView(
          children: [_HeaderWidget(), _FormWidget()],
        ));
  }
}

class _HeaderWidget extends StatefulWidget {
  const _HeaderWidget({Key? key}) : super(key: key);

  @override
  __HeaderWidgetState createState() => __HeaderWidgetState();
}

class __HeaderWidgetState extends State<_HeaderWidget> {
  @override
  Widget build(BuildContext context) {
    var textStyle = const TextStyle(fontSize: 16, color: Colors.black);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0),
            child: Text(
              'In order to use the editing and rating capabilities of TMDB, as well as get personal recommendations you will need to login to your account. If you do not have an account, registering for an account is free and simple.',
              style: textStyle,
            ),
          ),
          TextButton(
              onPressed: () {},
              style: AppButtonStyle.linkButton,
              child: Text('Register')),
          Text(
              "If you signed up but didn't get your verification email, click here to have it resent.",
              style: textStyle),
          TextButton(
              onPressed: () {},
              style: AppButtonStyle.linkButton,
              child: Text('Verification mail')),
        ],
      ),
    );
  }
}

class _FormWidget extends StatefulWidget {
  const _FormWidget({Key? key}) : super(key: key);

  @override
  __FormWidgetState createState() => __FormWidgetState();
}

class __FormWidgetState extends State<_FormWidget> {
  String? str = null;
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
 

    var a = const TextStyle(color: Color(0xFF212529), fontSize: 16.0);
    var textFieldDecorator = InputDecoration(
        isCollapsed: true,
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.all(10));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (str != null)
          Text(str!, style: TextStyle(color: Colors.red, fontSize: 16.0)),
        Text(
          'Username',
          style: a,
        ),
        Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 20),
            child: TextField(
                controller: _loginController, decoration: textFieldDecorator)),
        Text('Password', style: a),
        Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: TextField(
            controller: _passwordController,
            decoration: textFieldDecorator,
            obscureText: true,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: TextButton(
                    onPressed: _auth,
                    child: Text(
                      'log in',
                    ),
                    style: AppButtonStyle.a),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'Reset Button',
                  ),
                  style: AppButtonStyle.linkButton)
            ],
          ),
        )
      ],
    );
  }

  void _auth() {
    final login = _loginController.text;
    final password = _passwordController.text;
    if (login == 'admin' && password == 'admin') {
      print('OK');
      str = null;
      Navigator.of(context).pushReplacementNamed('/main_screen');
    } else {
      str = 'asdfsdfafsd';
    }
    setState(() {});
  }
}
