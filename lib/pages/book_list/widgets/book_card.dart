import 'package:flutter/material.dart';
import 'package:library_system/pages/book_list/models/book_card_model.dart';
import 'package:library_system/styles/typo.dart';

class BookCard extends StatelessWidget {
  final BookCardModel model;

  const BookCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final book = model.book;
    var url =
        'https://content.api.news/v3/images/bin/8791f511b22d3b0abb8b52c575bff083?width=2048';
    return Card(
      color: Colors.white,
      shadowColor: Colors.black38,
      elevation: 3,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(children: [
        Flexible(
          flex: 5,
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
            flex: 3,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              alignment: Alignment.topLeft,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '${book.id}. ${book.title}',
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
                    Text(
                      '상태 | ${model.usable ? '대출가능' : '대출불가'}',
                      style: TypoType.bodyLight.getStyle(color: Colors.grey),
                      maxLines: 1,
                    ),
                  ]),
            ))
      ]),
    );
  }
}
