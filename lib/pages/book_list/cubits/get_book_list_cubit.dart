import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_system/database/library_database.dart';
import 'package:library_system/pages/book_list/models/book_card_model.dart';
import 'package:library_system/pages/book_list/widgets/book_grid.dart';

class GetBookListCubit extends Cubit<GetBookListState> {
  final LibraryDatabase db;
  GetBookListCubit(super.initialState, this.db);

  getBooks() async {
    emit(BookListLoading());
    final books = await db.getBooks(0);
    final records = await db.getRecords();
    emit(GetBookListFinish(books, records));
  }
}

abstract class GetBookListState {
  Widget get widget;
  void callback();
}

class GetBookListInit extends GetBookListState {
  @override
  void callback() {}

  @override
  Widget get widget => Container();
}

class BookListLoading extends GetBookListState {
  @override
  void callback() {}

  @override
  Widget get widget => const Center(child: CircularProgressIndicator());
}

class GetBookListFinish extends GetBookListState {
  final List<Book> books;
  final List<Record> records;

  GetBookListFinish(this.books, this.records);

  @override
  void callback() {}

  @override
  Widget get widget {
    final data = List.generate(
      books.length,
      (index) => BookCardModel(
          book: books[index],
          usable: !records.any((element) => element.bookId == books[index].id)),
    );
    return BookGrid(data: data);
  }
}
