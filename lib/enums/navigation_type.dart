import 'package:flutter/material.dart';
import 'package:library_system/pages/book_list/book_list_page.dart';
import 'package:library_system/pages/book_loan/book_loan_page.dart';

enum NavigationType { bookList, bookLoan }

extension NavigationExtension on NavigationType {
  Widget get widget {
    switch (this) {
      case NavigationType.bookList:
        return const BookListPage();
      case NavigationType.bookLoan:
        return const BookLoanPage();
    }
  }
}
