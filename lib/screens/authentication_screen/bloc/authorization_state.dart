part of 'authorization_bloc.dart';

abstract class AuthorizationState extends Equatable {
  const AuthorizationState();

  @override
  List<Object> get props => [];
}

class AuthorizationInitial extends AuthorizationState {}

class AuthorizationShowupState extends AuthorizationState {}

class SignupScreenShowupState extends AuthorizationState {}
