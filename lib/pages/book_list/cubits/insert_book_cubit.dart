import 'package:drift/drift.dart' as d;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_system/database/library_database.dart';
import 'package:library_system/pages/book_list/widgets/input_field.dart';
import 'package:library_system/styles/typo.dart';

class InsertBookCubit extends Cubit<InsertBookState> {
  final LibraryDatabase db;
  InsertBookCubit(super.initialState, this.db);

  insertBook(BooksCompanion book) async {
    emit(BookInserting());
    await db.setBook(book);
    emit(InsertBookFinish());
  }
}

abstract class InsertBookState {
  Widget widget(
      InsertBookCubit cubit,
      TextEditingController title,
      TextEditingController author,
      TextEditingController publisher,
      TextEditingController imageUrl);
  void callback(TextEditingController title, TextEditingController author,
      TextEditingController publisher, TextEditingController imageUrl);
}

class InsertBookInit extends InsertBookState {
  @override
  void callback(TextEditingController title, TextEditingController author,
      TextEditingController publisher, TextEditingController imageUrl) {}

  @override
  Widget widget(
          InsertBookCubit cubit,
          TextEditingController title,
          TextEditingController author,
          TextEditingController publisher,
          TextEditingController imageUrl) =>
      _DefaultWidget(cubit, title, author, publisher, imageUrl);
}

class BookInserting extends InsertBookState {
  @override
  void callback(TextEditingController title, TextEditingController author,
      TextEditingController publisher, TextEditingController imageUrl) {}

  @override
  Widget widget(
      InsertBookCubit cubit,
      TextEditingController title,
      TextEditingController author,
      TextEditingController publisher,
      TextEditingController imageUrl) {
    return Stack(
      children: [
        _DefaultWidget(cubit, title, author, publisher, imageUrl),
        Container(),
        const Center(child: CircularProgressIndicator())
      ],
    );
  }
}

class InsertBookFinish extends InsertBookState {
  @override
  void callback(TextEditingController title, TextEditingController author,
      TextEditingController publisher, TextEditingController imageUrl) {
    title.clear();
    author.clear();
    publisher.clear();
    imageUrl.clear();
  }

  @override
  Widget widget(
      InsertBookCubit cubit,
      TextEditingController title,
      TextEditingController author,
      TextEditingController publisher,
      TextEditingController imageUrl) {
    return Center(child: Text('도서추가완료', style: TypoType.bodyBold.getStyle()));
  }
}

class _DefaultWidget extends StatelessWidget {
  final InsertBookCubit cubit;
  final TextEditingController title, author, publisher, imageUrl;

  const _DefaultWidget(
    this.cubit,
    this.title,
    this.author,
    this.publisher,
    this.imageUrl, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InputField(title: '도서명', controller: title),
          const SizedBox(height: 10),
          InputField(title: '저자', controller: author),
          const SizedBox(height: 10),
          InputField(title: '출판사', controller: publisher),
          const SizedBox(height: 10),
          InputField(title: '이미지 주소', controller: imageUrl),
          const SizedBox(height: 50),
          ElevatedButton(
              onPressed: () => {
                    cubit.insertBook(BooksCompanion.insert(
                      title: title.text,
                      author: author.text,
                      publisher: publisher.text,
                      imageUrl: d.Value(imageUrl.text),
                    ))
                  },
              child: Text(
                '추가',
                style: TypoType.bodyLight.getStyle(),
              )),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
