part of 'onboarding_cubit.dart';

@immutable
sealed class OnboardingState {}



final class OnboardingInitial extends OnboardingState {}


final class OnboardingEmailLoading extends OnboardingState {}
final class OnboardingEmailSuccess extends OnboardingState {}

final class OnboardingEmailError extends OnboardingState {
  final String message;

  OnboardingEmailError({required this.message});
}


