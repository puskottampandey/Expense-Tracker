import 'package:flutter_bloc/flutter_bloc.dart';

class PinBloc extends Cubit<String> {
  PinBloc() : super('');
  String check = "start";
  pinAdd(String pin) {
    if (state.length < 4) {
      emit(state + pin);
    }
  }

  pinremove() {
    if (state.isNotEmpty) {
      emit(state.substring(0, state.length - 1));
    }
  }
}
