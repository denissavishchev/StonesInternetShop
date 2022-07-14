import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:stones/domain/entity/add_item.dart';

class AddItemWidgetModel {
  var imageStone = '';
  var nameStone = '';
  var colorStone = '';
  var priceStone = '';
  var locationStone = '';

  void addStone (BuildContext context) async{
    if (imageStone.isEmpty && nameStone.isEmpty && colorStone.isEmpty && priceStone.isEmpty && locationStone.isEmpty) return;
    if (!Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter(AddItemAdapter());
    }
    final box = await Hive.openBox<AddItem>('add_box');
    final items = AddItem(
        stoneImage: imageStone,
        stoneName: nameStone,
        stoneColor: colorStone,
        stonePrice: priceStone,
        stoneLocation: locationStone);
    await box.add(items);
    Navigator.of(context).pushNamed('/main_screen');
  }
}

class AddItemWidgetModelProvider extends InheritedWidget {
  final AddItemWidgetModel model;
  const AddItemWidgetModelProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(key: key, child: child);

  static AddItemWidgetModelProvider? watch (BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AddItemWidgetModelProvider>();
  }

  static AddItemWidgetModelProvider? read (BuildContext context) {
    final widget = context
    .getElementForInheritedWidgetOfExactType<AddItemWidgetModelProvider>()?.widget;
    return widget is AddItemWidgetModelProvider ? widget : null;
  }

  @override
  bool updateShouldNotify(AddItemWidgetModelProvider oldWidget) {
    return true;
  }
}