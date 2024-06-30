part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}
final class AuthSuccess extends AuthState {}
final class AuthError extends AuthState {
  final String message;

  AuthError({required this.message});
}
final class OnboardingHomeLoading extends AuthState {}
final class OnboardingHomeSuccess extends AuthState {}
final class OnboardingHomeError extends AuthState {
  final String message;

  OnboardingHomeError({required this.message});
}


