import 'package:flutter/material.dart';

class CustomNotifyProvider<Model extends ChangeNotifier>
    extends InheritedNotifier {
  const CustomNotifyProvider(
      {Key? key, required this.model, required Widget child})
      : super(key: key, child: child, notifier: model);

  final Model model;

  static Model? of<Model extends ChangeNotifier>(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<CustomNotifyProvider<Model>>()
        ?.model;
  }

  static Model? read<Model extends ChangeNotifier>(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<CustomNotifyProvider<Model>>()
        ?.widget;
    return widget is CustomNotifyProvider<Model> ? widget.model : null;
  }
}

class Provider<Model> extends InheritedWidget {
  const Provider({Key? key, required this.model, required Widget child})
      : super(key: key, child: child);

  final Model model;

  static Model? of<Model>(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider<Model>>()?.model;
  }

  static Model? read<Model>(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<Provider<Model>>()
        ?.widget;
    return widget is Provider<Model> ? widget.model : null;
  }

  @override
  bool updateShouldNotify(Provider oldWidget) {
    return model != oldWidget.model;
  }
}
