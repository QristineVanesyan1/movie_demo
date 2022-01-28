import 'package:flutter/material.dart';
import 'package:move_demo/Theme/app_button_style.dart';
import 'package:move_demo/library/widgets/notifier_provider/notifier_provider.dart';
import 'package:move_demo/widgets/auth/auth_model.dart';

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
          children: [_HeaderWidget(), FormWidget()],
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

class FormWidget extends StatelessWidget {
  const FormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? str = null;
    final _authModel = CustomNotifyProvider.read<AuthModel>(context);

    var a = const TextStyle(color: Color(0xFF212529), fontSize: 16.0);
    var textFieldDecorator = const InputDecoration(
        isCollapsed: true,
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.all(10));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //TODO
        _ErrorMessageWidget(),
        Text(
          'Username',
          style: a,
        ),
        Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 20),
            child: TextField(
                controller: _authModel?.loginController,
                decoration: textFieldDecorator)),
        Text('Password', style: a),
        Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: TextField(
            controller: _authModel?.passwordController,
            decoration: textFieldDecorator,
            obscureText: true,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: Row(
            children: [
              _LoginWidget(),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Reset Button',
                  ),
                  style: AppButtonStyle.linkButton)
            ],
          ),
        )
      ],
    );
  }
}

class _LoginWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _authModel = CustomNotifyProvider.of<AuthModel>(context);

    final _onPressed = (_authModel?.canStartAuth == true)
        ? () => _authModel?.auth(context)
        : null;
    final child = _authModel!.isAuthProgress
        ? const CircularProgressIndicator()
        : const Text('Log in');
    return Padding(
      padding: const EdgeInsets.only(right: 30.0),
      child: TextButton(
          onPressed: _onPressed, child: child, style: AppButtonStyle.a),
    );
  }
}

class _ErrorMessageWidget extends StatelessWidget {
  const _ErrorMessageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final errorMessage = CustomNotifyProvider.of<AuthModel>(context)?.errorMessage;
    if (errorMessage == null) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Text(errorMessage,
          style: const TextStyle(color: Colors.red, fontSize: 16.0)),
    );
  }
}
