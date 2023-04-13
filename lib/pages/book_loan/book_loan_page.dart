import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_system/models/menu.dart';
import 'package:library_system/pages/book_loan/cubits/loan_book_cubit.dart';
import 'package:library_system/pages/book_loan/cubits/return_book_cubit.dart';
import 'package:library_system/pages/home/home_view_model.dart';
import 'package:library_system/widgets/menu_template.dart';
import 'package:provider/provider.dart';

class BookLoanPage extends StatelessWidget {
  const BookLoanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MenuTemplate(menus: [
      Menu('도서대출', const _LoanSection()),
      Menu('도서반납', const _ReturnSection()),
    ]);
  }
}

class _LoanSection extends StatelessWidget {
  const _LoanSection();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<HomeViewModel>(context);
    final cubit = LoanBookCubit(LoanBookInit(), vm.db);

    return BlocConsumer<LoanBookCubit, LoanBookState>(
      bloc: cubit,
      builder: (context, state) => state.widget(cubit),
      listener: (context, state) => state.callback(),
    );
  }
}

class _ReturnSection extends StatelessWidget {
  const _ReturnSection();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<HomeViewModel>(context);
    final cubit = ReturnBookCubit(ReturnBookInit(), vm.db);

    return BlocConsumer<ReturnBookCubit, ReturnBookState>(
      bloc: cubit,
      builder: (context, state) => state.widget(cubit),
      listener: (context, state) => state.callback(),
    );
  }
}
