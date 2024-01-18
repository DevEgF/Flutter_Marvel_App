import 'package:injectable/injectable.dart';
import 'package:marvel_app/data/network/response/character_response.dart';
import 'package:marvel_app/data/network/service/character_service.dart';

abstract class CharacterRepository {
  Future<CharacterResponse> getCharacter(int page);
}

@Injectable(as: CharacterRepository)
class CharacterRepositoryImpl implements CharacterRepository {
  const CharacterRepositoryImpl(this.service);

  final CharacterService service;

  @override
  Future<CharacterResponse> getCharacter(int page) =>
      service.getCharacters(page);
}
