import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_system/enums/navigation_type.dart';
import 'package:library_system/pages/home/cubits/navigation_cubit.dart';
import 'package:library_system/pages/home/home_view_model.dart';
import 'package:library_system/widgets/library_app_bar.dart';
import 'package:library_system/widgets/library_navigation.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<HomeViewModel>(context);

    return Scaffold(
      appBar: LibraryAppBar(navigations: const LibraryNavigation()),
      body: BlocBuilder<NavigationCubit, NavigationType>(
        bloc: vm.navigation,
        builder: (context, state) => state.widget,
      ),
      floatingActionButton: AnimSearchBar(
        rtl: true,
        onSubmitted: (String) {},
        onSuffixTap: null,
        textController: TextEditingController(),
        width: 500,
      ),
    );
  }
}
