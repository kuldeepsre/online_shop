import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Enum for navigation events
// Custom classes for navigation events
class GoToHomeEvent {
  String title;
  GoToHomeEvent({required this.title});
}

class GoToProfileEvent{
String title;
GoToProfileEvent({required this.title});
}

class GoToPageViewMoreEvent {
  String title;
  GoToPageViewMoreEvent({required this.title});
}

class GoToPageSettingEvent {
  String title;
  GoToPageSettingEvent({required this.title});
}
class GoToPageLanguageEvent {

}

// States for navigation
abstract class NavigationState {}

class NavigationInitial extends NavigationState {}

class NavigationHome extends NavigationState {}

class NavigationProfile extends NavigationState {}

class NavigationViewMore extends NavigationState {}

class NavigationSetting extends NavigationState {}
class NavigationLanguage extends NavigationState {}

class NavigationBloc extends Bloc<Object, NavigationState> {
  NavigationBloc() : super(NavigationInitial()) {
    on<GoToHomeEvent>((event, emit) {
      emit(NavigationHome());
    });

    on<GoToProfileEvent>((event, emit) {
      emit(NavigationProfile());
    });

    on<GoToPageViewMoreEvent>((event, emit) {
      emit(NavigationViewMore());
    });

    on<GoToPageSettingEvent>((event, emit) {
      emit(NavigationSetting());
    });
    on<GoToPageLanguageEvent>((event, emit) {
      emit(NavigationLanguage());
    });
  }
}

