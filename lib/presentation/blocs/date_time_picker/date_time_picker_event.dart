part of 'date_time_picker_bloc.dart';

@immutable
abstract class DateTimePickerEvent {
  const DateTimePickerEvent();
}

class PickDate extends DateTimePickerEvent{
  final BuildContext context;
  const PickDate({required this.context});
}
class PickTime extends DateTimePickerEvent{
  final BuildContext context;
  const PickTime({required this.context});
}