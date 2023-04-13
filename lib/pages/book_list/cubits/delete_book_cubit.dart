import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_system/database/library_database.dart';
import 'package:library_system/pages/book_list/widgets/input_field.dart';
import 'package:library_system/styles/typo.dart';

class DeleteBookCubit extends Cubit<DeleteBookState> {
  final LibraryDatabase db;
  DeleteBookCubit(super.initialState, this.db);

  deleteBook(int id) async {
    emit(BookDeleting());
    await db.deleteBook(id);
    emit(DeleteBookFinish());
  }
}

abstract class DeleteBookState {
  Widget widget(DeleteBookCubit cubit, TextEditingController id);
  void callback(TextEditingController id);
}

class DeleteBookInit extends DeleteBookState {
  @override
  void callback(TextEditingController id) {}

  @override
  Widget widget(DeleteBookCubit cubit, TextEditingController id) {
    return _DefaultWidget(cubit, id);
  }
}

class BookDeleting extends DeleteBookState {
  @override
  void callback(TextEditingController id) {}

  @override
  Widget widget(DeleteBookCubit cubit, TextEditingController id) {
    return Stack(
      children: [
        _DefaultWidget(cubit, id),
        Container(),
        const Center(child: CircularProgressIndicator())
      ],
    );
  }
}

class DeleteBookFinish extends DeleteBookState {
  @override
  void callback(TextEditingController id) {
    id.clear();
  }

  @override
  Widget widget(DeleteBookCubit cubit, TextEditingController id) {
    return Center(child: Text('도서삭제완료', style: TypoType.bodyBold.getStyle()));
  }
}

class _DefaultWidget extends StatelessWidget {
  final DeleteBookCubit cubit;
  final TextEditingController id;

  const _DefaultWidget(
    this.cubit,
    this.id, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InputField(title: '일련번호', controller: id),
          const SizedBox(height: 50),
          ElevatedButton(
              onPressed: () => {cubit.deleteBook(int.parse(id.text))},
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
