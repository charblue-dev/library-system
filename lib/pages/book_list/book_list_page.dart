import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_system/models/menu.dart';
import 'package:library_system/pages/book_list/cubits/delete_book_cubit.dart';
import 'package:library_system/pages/book_list/cubits/get_book_list_cubit.dart';
import 'package:library_system/pages/book_list/cubits/insert_book_cubit.dart';
import 'package:library_system/pages/home/home_view_model.dart';
import 'package:library_system/widgets/menu_template.dart';
import 'package:provider/provider.dart';

class BookListPage extends StatelessWidget {
  const BookListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MenuTemplate(
      menus: [
        Menu('도서목록', const _BookListSection()),
        Menu('도서검색', const _BookListSection()),
        Menu('도서추가', const _InsertBookSection()),
        Menu('도서삭제', const _DeleteBookSection()),
      ],
    );
  }
}

class _DeleteBookSection extends StatelessWidget {
  const _DeleteBookSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<HomeViewModel>(context);
    final cubit = DeleteBookCubit(DeleteBookInit(), vm.db);
    final id = TextEditingController();

    return BlocConsumer<DeleteBookCubit, DeleteBookState>(
      bloc: cubit,
      builder: (context, state) => state.widget(cubit, id),
      listener: (context, state) => state.callback(id),
    );
  }
}

class _InsertBookSection extends StatelessWidget {
  const _InsertBookSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<HomeViewModel>(context);
    final cubit = InsertBookCubit(InsertBookInit(), vm.db);
    final title = TextEditingController();
    final author = TextEditingController();
    final publisher = TextEditingController();
    final imageUrl = TextEditingController();

    return BlocConsumer<InsertBookCubit, InsertBookState>(
      bloc: cubit,
      builder: (context, state) =>
          state.widget(cubit, title, author, publisher, imageUrl),
      listener: (context, state) =>
          state.callback(title, author, publisher, imageUrl),
    );
  }
}

class _BookListSection extends StatelessWidget {
  const _BookListSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<HomeViewModel>(context);
    final cubit = GetBookListCubit(GetBookListInit(), vm.db);
    cubit.getBooks();

    return BlocConsumer<GetBookListCubit, GetBookListState>(
      bloc: cubit,
      builder: (context, state) => state.widget,
      listener: (context, state) => state.callback(),
    );
  }
}
