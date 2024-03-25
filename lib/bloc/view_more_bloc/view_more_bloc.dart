import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'view_more_event.dart';
part 'view_more_state.dart';

class ViewMoreBloc extends Bloc<ViewMoreEvent, ViewMoreState> {
  ViewMoreBloc() : super(ViewMoreInitial()) {
    on<ViewMoreEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
