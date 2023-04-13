import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_system/database/library_database.dart';
import 'package:library_system/pages/book_list/models/book_card_model.dart';
import 'package:library_system/pages/book_list/widgets/book_grid.dart';
import 'package:library_system/pages/book_list/widgets/input_field.dart';
import 'package:library_system/styles/typo.dart';

final _searchKeyword = TextEditingController();

class SearchBookCubit extends Cubit<SearchBookState> {
  final LibraryDatabase db;

  SearchBookCubit(super.initialState, this.db);

  search(String keyword) async {
    emit(BookSearching());
    final books = await db.search(keyword);
    final records = await db.getRecords();
    emit(SearchBookFinish(books, records));
  }
}

abstract class SearchBookState {
  Widget widget(SearchBookCubit cubit);
  void callback();
}

class SearchBookInit extends SearchBookState {
  @override
  void callback() {}

  @override
  Widget widget(SearchBookCubit cubit) {
    return _InitialWidget(
      searchKeyword: _searchKeyword,
      cubit: cubit,
    );
  }
}

class BookSearching extends SearchBookState {
  @override
  void callback() {}

  @override
  Widget widget(SearchBookCubit cubit) {
    return Stack(
      children: [
        _InitialWidget(
          searchKeyword: _searchKeyword,
          cubit: cubit,
        ),
        Container(),
        const Center(child: CircularProgressIndicator())
      ],
    );
  }
}

class SearchBookFinish extends SearchBookState {
  final List<Book> books;
  final List<Record> records;

  SearchBookFinish(this.books, this.records);

  @override
  void callback() {}

  @override
  Widget widget(SearchBookCubit cubit) {
    final data = List.generate(
      books.length,
      (index) => BookCardModel(
          book: books[index],
          usable: !records.any((element) => element.bookId == books[index].id)),
    );
    return BookGrid(data: data);
  }
}

class _InitialWidget extends StatelessWidget {
  const _InitialWidget({
    super.key,
    required this.searchKeyword,
    required this.cubit,
  });

  final SearchBookCubit cubit;
  final TextEditingController searchKeyword;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InputField(
            title: '제목 검색',
            controller: searchKeyword,
          ),
          const SizedBox(height: 50),
          ElevatedButton(
              onPressed: () => cubit.search(searchKeyword.text),
              child: Text('검색', style: TypoType.bodyLight.getStyle())),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
