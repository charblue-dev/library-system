import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_system/enums/navigation_type.dart';

class NavigationCubit extends Cubit<NavigationType> {
  NavigationCubit() : super(NavigationType.bookList);

  onNavChange(NavigationType type) {
    emit(type);
  }
}
