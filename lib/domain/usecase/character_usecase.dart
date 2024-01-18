import 'package:injectable/injectable.dart';
import 'package:marvel_app/data/network/response/character_response.dart';
import 'package:marvel_app/data/repositories/character_repository.dart';

abstract class CharacterUseCase {
  Future<CharacterResponse> fetchCharacter(int page);
}

@Injectable(as: CharacterUseCase)
class CharacterUseCaseImpl implements CharacterUseCase {
  const CharacterUseCaseImpl(this.repository);

  final CharacterRepository repository;

  @override
  Future<CharacterResponse> fetchCharacter(int page) =>
      repository.getCharacter(page);
}
