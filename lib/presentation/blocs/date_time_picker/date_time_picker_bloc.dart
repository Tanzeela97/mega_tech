import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'date_time_picker_event.dart';

part 'date_time_picker_state.dart';

class DateTimePickerBloc
    extends Bloc<DateTimePickerEvent, DateTimePickerInitial> {
  final _initialDateTime = DateTime.now();

  DateTimePickerBloc()
      : super(DateTimePickerInitial(dateTime: null, timeOfDay: null,showError: false)) {
    on<PickDate>((event, emit) async {
      DateTime? dateTime = await showDatePicker(
          context: event.context,
          initialDate: _initialDateTime,
          firstDate: DateTime(1900),
          lastDate: DateTime(2100));
      emit(state.copyWith(dateTime: dateTime));
    });
    //////////////PickTime/////////////////////
    on<PickTime>((event, emit) async {
      TimeOfDay? timeOfDay = await showTimePicker(
          context: event.context,
          initialTime: TimeOfDay(
              hour: _initialDateTime.hour, minute: _initialDateTime.minute),);
      emit(state.copyWith(timeOfDay: timeOfDay));
    });
  }
}
