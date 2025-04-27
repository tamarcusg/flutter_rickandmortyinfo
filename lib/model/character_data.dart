import 'package:intl/intl.dart';

DateFormat dateFormat = DateFormat.yMd();

class CharacterData {
  final int id;
  final String name;
  final String imageUrl;
  final String species;
  final String status;
  final String origin;
  final String? type;
  final String createdDate;

  const CharacterData({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.species,
    required this.status,
    required this.origin,
    this.type,
    required this.createdDate,
  });

  String get formattedDate => dateFormat.format(DateTime.parse(createdDate));
}