import 'package:library_system/database/library_database.dart';

class BookCardModel {
  final Book book;
  final bool usable;

  BookCardModel({
    required this.book,
    required this.usable,
  });
}
