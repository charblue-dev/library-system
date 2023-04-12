import 'package:flutter/material.dart';
import 'package:library_system/models/menu.dart';
import 'package:library_system/pages/book_list/widgets/book_grid.dart';
import 'package:library_system/widgets/menu_template.dart';

class BookListPage extends StatelessWidget {
  const BookListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MenuTemplate(
      menus: [
        Menu(
            '도서목록',
            CustomScrollView(
              slivers: [
                SliverPadding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 25, horizontal: 50),
                    sliver: const BookGrid()),
              ],
            )),
        Menu('도서추가', Container()),
      ],
    );
  }
}
