import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stones/items_widget.dart';

import '../domain/entity/add_item.dart';

class ItemsWidgetModel extends ChangeNotifier {
  var _items = <AddItem>[];

  List<AddItem> get items => _items.toList();

  ItemsWidgetModel(){
    _setup();
  }

  void add(BuildContext context) {
      Navigator.of(context).pushNamed('/add_item_screen');
  }

  void _readItemsFromHive(Box<AddItem> box){
    _items = box.values.toList();
    notifyListeners();
  }

  void _setup() async {
    if (!Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter(AddItemAdapter());
    }
    final box = await Hive.openBox<AddItem>('add_box');
    _readItemsFromHive(box);
    box.listenable().addListener(() {
      _items = box.values.toList();
    });
  }
}

class ItemsWidgetModelProvider extends InheritedWidget {
  final ItemsWidgetModel model;
  const ItemsWidgetModelProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(
      key: key,
      // notifier: model,
      child: child
  );

  static ItemsWidgetModelProvider? watch (BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ItemsWidgetModelProvider>();
  }

  static ItemsWidgetModelProvider? read (BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<ItemsWidgetModelProvider>()?.widget;
    return widget is ItemsWidgetModelProvider ? widget : null;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    throw UnimplementedError();
  }

}