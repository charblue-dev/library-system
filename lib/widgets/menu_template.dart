import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_system/models/menu.dart';
import 'package:library_system/styles/typo.dart';

class MenuTemplate extends StatelessWidget {
  final List<Menu> menus;

  const MenuTemplate({super.key, required this.menus});

  @override
  Widget build(BuildContext context) {
    final cubit = _MenuCubit(menus.first);

    return BlocBuilder<_MenuCubit, Menu>(
      bloc: cubit,
      builder: (context, state) {
        return Row(
          children: [
            BlocProvider(
              create: (context) => cubit,
              child: Expanded(
                flex: 2,
                child: Container(
                  color: const Color.fromARGB(255, 246, 246, 246),
                  child: Column(
                    children: menus.map((menu) {
                      return _MenuItem(menu: menu);
                    }).toList(),
                  ),
                ),
              ),
            ),
            Expanded(flex: 8, child: state.widget),
          ],
        );
      },
    );
  }
}

class _MenuItem extends StatelessWidget {
  final Menu menu;

  const _MenuItem({Key? key, required this.menu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<_MenuCubit>(context);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => cubit.chagneMenu(menu),
        child: Container(
          alignment: Alignment.center,
          height: 50,
          width: double.infinity,
          child: Text(
            menu.title,
            style: TypoType.bodyMedium.getStyle(),
          ),
        ),
      ),
    );
  }
}

class _MenuCubit extends Cubit<Menu> {
  _MenuCubit(super.initialState);

  chagneMenu(Menu menu) {
    emit(menu);
  }
}
