import 'package:library_system/database/library_database.dart';
import 'package:library_system/pages/home/cubits/navigation_cubit.dart';

class HomeViewModel {
  final db = LibraryDatabase();
  final NavigationCubit navigation = NavigationCubit();
}
