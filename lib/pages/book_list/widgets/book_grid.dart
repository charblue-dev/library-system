import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:library_system/models/page_number.dart';
import 'package:library_system/pages/book_list/models/book_card_model.dart';
import 'package:library_system/pages/book_list/widgets/book_card.dart';
import 'package:library_system/styles/typo.dart';

class BookGrid extends StatelessWidget {
  final PageNumber? pageNumber;
  final List<BookCardModel> data;
  final VoidCallback? onNextButtonTap;
  final VoidCallback? onPrevButtonTap;

  const BookGrid({
    super.key,
    required this.data,
    this.pageNumber,
    this.onNextButtonTap,
    this.onPrevButtonTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GridView.count(
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
        ),
        if (pageNumber != null)
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              padding: const EdgeInsets.all(10),
              color: Colors.white,
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                _prevButton(),
                Text(
                  '${pageNumber!.current}',
                  style: TypoType.bodyMedium.getStyle(),
                ),
                _nextButton(),
              ]),
            ),
          )
      ],
    );
  }

  Widget _prevButton() {
    if (pageNumber!.hasPrev) {
      return IconButton(
          onPressed: () => onPrevButtonTap!(),
          icon: const Icon(
            CupertinoIcons.back,
            size: 24,
          ));
    } else {
      return const SizedBox(width: 24);
    }
  }

  Widget _nextButton() {
    if (pageNumber!.hasNext) {
      return IconButton(
          onPressed: () => onNextButtonTap!(),
          icon: const Icon(
            CupertinoIcons.forward,
            size: 24,
          ));
    } else {
      return const SizedBox(width: 24);
    }
  }
}
