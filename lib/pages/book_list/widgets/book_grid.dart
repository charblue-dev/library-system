import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:library_system/pages/book_list/models/book.dart';
import 'package:library_system/pages/book_list/widgets/book_card.dart';

class BookGrid extends StatelessWidget {
  const BookGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.count(
      crossAxisCount: 3,
      mainAxisSpacing: 15,
      crossAxisSpacing: 15,
      childAspectRatio: 1 / 1.2,
      children: List.generate(
          9,
          (index) => BookCard(
              book: Book(
                  id: random.integer(100),
                  title: faker.lorem.word(),
                  author: faker.person.name(),
                  publisher: faker.person.lastName(),
                  imageUrl:
                      'https://media.cnn.com/api/v1/images/stellar/prod/221116115144-james-webb-space-telescope-hourglass-star-formation-crop.jpg?c=original'))),
    );
  }
}
