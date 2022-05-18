part of 'date_time_picker_bloc.dart';


abstract class DateTimePickerState {}

class DateTimePickerInitial {
  TimeOfDay? timeOfDay;
  DateTime? dateTime;
  bool showError;
  DateTimePickerInitial({this.timeOfDay,this.dateTime,required this.showError});


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DateTimePickerInitial &&
          runtimeType == other.runtimeType &&
          timeOfDay == other.timeOfDay &&
          dateTime == other.dateTime &&
          showError == other.showError;

  @override
  int get hashCode =>
      timeOfDay.hashCode ^ dateTime.hashCode ^ showError.hashCode;

  @override
  String toString() {
    return '{DateTimePickerInitial{timeOfDay: $timeOfDay, dateTime: $dateTime, showError: $showError}';
  }

  DateTimePickerInitial copyWith({
    TimeOfDay? timeOfDay,
    DateTime? dateTime,
    bool? showError,
  }) {
    return DateTimePickerInitial(
      timeOfDay: timeOfDay ?? this.timeOfDay,
      dateTime: dateTime ?? this.dateTime,
      showError: showError ?? this.showError,
    );
  }
}
