part of 'character_cubit.dart';

sealed class CharacterState extends Equatable {
  const CharacterState();

  @override
  List<Object> get props => [];
}

final class CharacterInitial extends CharacterState {}
