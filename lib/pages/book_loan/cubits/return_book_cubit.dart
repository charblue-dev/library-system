import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_system/database/library_database.dart';
import 'package:library_system/pages/book_list/widgets/input_field.dart';
import 'package:library_system/styles/typo.dart';

final _bookId = TextEditingController();

class ReturnBookCubit extends Cubit<ReturnBookState> {
  final LibraryDatabase db;
  ReturnBookCubit(super.initialState, this.db);

  deleteRecord(int bookId) async {
    emit(BookReturning());
    await db.deleteRecord(bookId);
    emit(ReturnBookFinish());
  }
}

abstract class ReturnBookState {
  Widget widget(ReturnBookCubit cubit);
  void callback();
}

class ReturnBookInit extends ReturnBookState {
  @override
  void callback() {}

  @override
  Widget widget(ReturnBookCubit cubit) => _InitialWidget(cubit);
}

class BookReturning extends ReturnBookState {
  @override
  void callback() {}

  @override
  Widget widget(ReturnBookCubit cubit) {
    return Stack(
      children: [
        _InitialWidget(cubit),
        Container(),
        const Center(child: CircularProgressIndicator())
      ],
    );
  }
}

class ReturnBookFinish extends ReturnBookState {
  @override
  void callback() {
    _bookId.clear();
  }

  @override
  Widget widget(ReturnBookCubit cubit) {
    return Center(child: Text('도서반납완료', style: TypoType.bodyBold.getStyle()));
  }
}

class _InitialWidget extends StatelessWidget {
  final ReturnBookCubit cubit;
  const _InitialWidget(this.cubit);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InputField(title: '도서번호', controller: _bookId),
          const SizedBox(height: 50),
          ElevatedButton(
              onPressed: () => cubit.deleteRecord(int.parse(_bookId.text)),
              child: Text(
                '반납',
                style: TypoType.bodyLight.getStyle(),
              )),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
