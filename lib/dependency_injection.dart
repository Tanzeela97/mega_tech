import 'package:get_it/get_it.dart';
import 'package:megatech/presentation/blocs/date_time_picker/date_time_picker_bloc.dart';

final injector = GetIt.instance;

Future<void> init()async{


  injector.registerFactory<DateTimePickerBloc>(() => DateTimePickerBloc());
}