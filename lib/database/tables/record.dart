import 'package:drift/drift.dart';
import 'package:library_system/database/tables/book.dart';

@DataClassName('Record')
class Records extends Table {
  TextColumn get memberName => text()();
  IntColumn get bookId => integer().references(Books, #id)();
}
