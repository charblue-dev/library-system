import 'package:flutter/material.dart';
import 'package:library_system/pages/book_list/models/book.dart';
import 'package:library_system/styles/typo.dart';

class BookCard extends StatelessWidget {
  final Book book;

  const BookCard({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    var url =
        'https://media.cnn.com/api/v1/images/stellar/prod/221116115144-james-webb-space-telescope-hourglass-star-formation-crop.jpg?c=original';
    return Card(
      color: Colors.white,
      shadowColor: Colors.black38,
      elevation: 3,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(children: [
        Flexible(
          flex: 2,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(url),
                fit: BoxFit.cover,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
        Flexible(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              alignment: Alignment.topLeft,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      book.title,
                      style: TypoType.subBold.getStyle(),
                    ),
                    Text(
                      '저자 | ${book.author}',
                      style: TypoType.bodyLight.getStyle(color: Colors.grey),
                      maxLines: 1,
                    ),
                    Text(
                      '출판사 | ${book.publisher}',
                      style: TypoType.bodyLight.getStyle(color: Colors.grey),
                      maxLines: 1,
                    ),
                  ]),
            ))
      ]),
    );
  }
}
