part of 'main_bloc.dart';

abstract class MainState extends Equatable {
  const MainState();

  @override
  List<Object> get props => [];
}

class MainInitial extends MainState {}

class InitialMainState extends MainState {}

class AuthentificatedMainState extends MainState {}

class UnauthentificatedMainState extends MainState {}

class UnsupportedVersionMainState extends MainState {}
