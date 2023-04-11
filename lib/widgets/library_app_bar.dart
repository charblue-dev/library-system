import 'package:flutter/material.dart';
import 'package:library_system/styles/typo.dart';

class LibraryAppBar extends PreferredSize {
  LibraryAppBar({super.key})
      : super(
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
            backgroundColor: Colors.white,
            flexibleSpace: Container(
              height: 80,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(children: [
                const Icon(Icons.local_library, color: Colors.amber, size: 30),
                const Padding(padding: EdgeInsets.only(right: 10)),
                Text('지코바 도서관', style: TypoType.subMedium.getStyle()),
                const Padding(padding: EdgeInsets.only(right: 18)),
                TextButton(
                  onPressed: () {},
                  child: Text('도서관리', style: TypoType.bodyLight.getStyle()),
                ),
                const Padding(padding: EdgeInsets.only(right: 10)),
                TextButton(
                  onPressed: () {},
                  child: Text('대출관리', style: TypoType.bodyLight.getStyle()),
                )
              ]),
            ),
          ),
        );
}
