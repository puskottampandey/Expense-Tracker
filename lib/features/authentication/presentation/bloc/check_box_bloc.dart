import 'package:flutter_bloc/flutter_bloc.dart';

class CheckBoxBloc extends Cubit<bool> {
  CheckBoxBloc() : super(false);
  checkTick() {
    emit(!state);
  }
}
