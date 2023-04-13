import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_system/database/library_database.dart';
import 'package:library_system/models/page_number.dart';
import 'package:library_system/pages/book_list/models/book_card_model.dart';
import 'package:library_system/pages/book_list/widgets/book_grid.dart';

int _currentPageNumber = 0;

class GetBookListCubit extends Cubit<GetBookListState> {
  final LibraryDatabase db;
  GetBookListCubit(super.initialState, this.db);

  getBooks() async {
    emit(BookListLoading());
    final books = await db.getBooks(_currentPageNumber * 9);
    final records = await db.getRecords();
    final count = await db.countBooks();
    emit(
      GetBookListFinish(
        books,
        records,
        PageNumber(_currentPageNumber > 0, count / 9 - 1 > _currentPageNumber,
            _currentPageNumber + 1),
        this,
      ),
    );
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
  final PageNumber pageNumber;
  final GetBookListCubit cubit;

  GetBookListFinish(this.books, this.records, this.pageNumber, this.cubit);

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
    return BookGrid(
        data: data,
        pageNumber: pageNumber,
        onNextButtonTap: () {
          _currentPageNumber++;
          cubit.getBooks();
        },
        onPrevButtonTap: () {
          _currentPageNumber--;
          cubit.getBooks();
        });
  }
}
