import 'package:flutter/material.dart';
import 'package:library_system/pages/book_list/models/book_card_model.dart';
import 'package:library_system/pages/book_list/widgets/book_card.dart';

class BookGrid extends StatelessWidget {
  final List<BookCardModel> data;

  const BookGrid({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
      crossAxisCount: 3,
      mainAxisSpacing: 15,
      crossAxisSpacing: 15,
      childAspectRatio: 1 / 1.2,
      children: List.generate(
        data.length,
        (index) => BookCard(
          model: data[index],
        ),
      ),
    );
  }
}
