import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User {
  final int value;
  User(this.value);
  User copyWith({int? value}) {
    return User(value ?? 0);
  }
}

class UserDataProvider {
  var user = User(0);
  final prefs = SharedPreferences.getInstance();

  Future<void> setInSharedPrefs(String key) async {
    await (await prefs).setInt(key, user.value);
  }

  Future<void> loadValue(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final a = prefs.getInt(key);
    user = User(a ?? 0);
  }
}

class AgeRepository {
  final UserDataProvider data = UserDataProvider();
  User get user => data.user;
  Future<void> init() async {
    data.loadValue('value');
  }

  void increment() async {
    data.user = user.copyWith(value: user.value + 1);
  }

  void decrement() async {
    data.user = user.copyWith(value: user.value - 1);
  }
}

class ViewModelState {
  const ViewModelState({required this.value});
  final String value;
}

class ViewModel extends ChangeNotifier {
  ViewModel() {
    age.init();
    _updateState();
  }
  final AgeRepository age = AgeRepository();
  var _state = const ViewModelState(value: '');
  void ondIncrementButtonPressed() async {
    age.increment();
    _updateState();
  }

  void ondDecrementButtonPressed() async {
    age.decrement();
    _updateState();
  }

  void _updateState() {
    _state = ViewModelState(value: _state.value);
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
          create: (_) => ViewModel(), child: MyHomePage()),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
          child: Column(
        children: [_TextWidget(), _IncrementWidget(), _DecrementWidget()],
      )),
    ));
  }
}

class _TextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _value = context.select((ViewModel vm) => vm.age.user.value);
    return Text(_value.toString());
  }
}

class _IncrementWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _viewModel = context.read<ViewModel>();

    return ElevatedButton.icon(
        onPressed: () async => _viewModel.ondIncrementButtonPressed(),
        icon: const Icon(Icons.plus_one),
        label: const Text('plus one'));
  }
}

class _DecrementWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _viewModel = context.read<ViewModel>();

    return ElevatedButton.icon(
        onPressed: () async => _viewModel.ondDecrementButtonPressed(),
        icon: const Icon(Icons.padding),
        label: const Text('minus one'));
  }
}
