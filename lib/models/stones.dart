import 'package:hive/hive.dart';
part 'stones.g.dart';

@HiveType(typeId: 0)

class Stone extends HiveObject {
  @HiveField(0)
  String? id;

  @HiveField(1)
  final String image;

  @HiveField(2)
  final String name;

  @HiveField(3)
  final String color;

  @HiveField(4)
  final String price;

  @HiveField(5)
  final String location;

  Stone({
    required this.image,
    required this.name,
    required this.color,
    required this.price,
    required this.location,
  });

}