import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_system/database/library_database.dart';
import 'package:library_system/pages/book_list/widgets/input_field.dart';
import 'package:library_system/styles/typo.dart';

final _bookId = TextEditingController();
final _memberName = TextEditingController();

class LoanBookCubit extends Cubit<LoanBookState> {
  final LibraryDatabase db;
  LoanBookCubit(super.initialState, this.db);

  insertRecord(RecordsCompanion record) async {
    emit(BookRecording());
    await db.record(record);
    emit(LoanBookFinish());
  }
}

abstract class LoanBookState {
  Widget widget(LoanBookCubit cubit);
  void callback();
}

class LoanBookInit extends LoanBookState {
  @override
  void callback() {}

  @override
  Widget widget(LoanBookCubit cubit) => _InitialWidget(cubit);
}

class BookRecording extends LoanBookState {
  @override
  void callback() {}

  @override
  Widget widget(LoanBookCubit cubit) {
    return Stack(
      children: [
        _InitialWidget(cubit),
        Container(),
        const Center(child: CircularProgressIndicator())
      ],
    );
  }
}

class LoanBookFinish extends LoanBookState {
  @override
  void callback() {
    _bookId.clear();
    _memberName.clear();
  }

  @override
  Widget widget(LoanBookCubit cubit) {
    return Center(child: Text('도서대출완료', style: TypoType.bodyBold.getStyle()));
  }
}

class _InitialWidget extends StatelessWidget {
  final LoanBookCubit cubit;
  const _InitialWidget(this.cubit);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InputField(title: '도서번호', controller: _bookId),
          const SizedBox(height: 10),
          InputField(title: '대출자명', controller: _memberName),
          const SizedBox(height: 50),
          ElevatedButton(
              onPressed: () => cubit.insertRecord(RecordsCompanion.insert(
                  memberName: _memberName.text,
                  bookId: int.parse(_bookId.text))),
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
