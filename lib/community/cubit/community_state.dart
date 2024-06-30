part of 'community_cubit.dart';

@immutable
sealed class CommunityState {}

final class CommunityInitial extends CommunityState {}

final class CommunityLoading extends CommunityState {}

final class CommunitySuccess extends CommunityState {}

final class CommunityError extends CommunityState {
  final String message;

  CommunityError({required this.message});
}

  
