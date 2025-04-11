import 'package:flutter_bloc/flutter_bloc.dart';

class PinBloc extends Cubit<List<int>> {
  PinBloc() : super([]);
  List<int> list = [];
  pinAdd(int pin) {
    list.add(pin);
    emit(list);
  }
}
