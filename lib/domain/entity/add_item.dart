import 'package:hive/hive.dart';
part 'add_item.g.dart';

@HiveType(typeId: 2)
class AddItem{
  @HiveField(0)
  String stoneImage;

  @HiveField(1)
  String stoneName;

  @HiveField(2)
  String stoneColor;

  @HiveField(3)
  String stonePrice;

  @HiveField(4)
  String stoneLocation;


  AddItem({
    required this.stoneImage,
    required this.stoneName,
    required this.stoneColor,
    required this.stonePrice,
    required this.stoneLocation,

});
}