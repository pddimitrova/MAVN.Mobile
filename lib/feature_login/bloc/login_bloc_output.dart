import 'package:lykke_mobile_mavn/library_bloc/core.dart';

abstract class LoginState extends BlocState {}

class LoginUninitializedState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginErrorState extends LoginState {
  LoginErrorState(this.error);

  final String error;

  @override
  List get props => super.props..addAll([error]);
}

class LoginSuccessState extends LoginState {}

class LoginSuccessEvent extends BlocEvent {}

class LoginErrorDeactivatedAccountEvent extends BlocEvent {}
