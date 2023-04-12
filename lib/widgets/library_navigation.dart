import 'package:flutter/material.dart';
import 'package:library_system/enums/navigation_type.dart';
import 'package:library_system/pages/home/home_view_model.dart';
import 'package:library_system/styles/typo.dart';
import 'package:provider/provider.dart';

class LibraryNavigation extends StatelessWidget {
  const LibraryNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<HomeViewModel>(context);

    return Row(
      children: [
        TextButton(
          onPressed: () => vm.navigation.onNavChange(NavigationType.bookList),
          child: Text('도서관리', style: TypoType.bodyLight.getStyle()),
        ),
        const Padding(padding: EdgeInsets.only(right: 10)),
        TextButton(
          onPressed: () => vm.navigation.onNavChange(NavigationType.bookLoan),
          child: Text('대출관리', style: TypoType.bodyLight.getStyle()),
        ),
      ],
    );
  }
}
