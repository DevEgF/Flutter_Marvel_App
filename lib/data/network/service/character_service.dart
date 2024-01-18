import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:marvel_app/data/network/response/character_response.dart';
import 'package:marvel_app/data/utils/generate_marvel_hash.dart';

abstract class CharacterService {
  Future<CharacterResponse> getCharacters([int page = 1]);
}

@Injectable(as: CharacterService)
class CharacterServiceImpl implements CharacterService {
  const CharacterServiceImpl(this._client);

  final Dio _client;

  @override
  Future<CharacterResponse> getCharacters([int page = 1]) async {
    const marvelApiUrl = 'https://gateway.marvel.com/v1/public/characters';

    final timestamp = DateTime.now().microsecondsSinceEpoch.toString();
    const publicKey = 'a90a5d4be0e543b0ca9f8a782b461660';
    const privateKey = '8f1a5462409f23ea911ebec64faab3a8dd1a7751';

    String hash = generateMarvelHash(timestamp, publicKey, privateKey);

    Map<String, dynamic> queryParams = {
      'apikey': publicKey,
      'ts': timestamp,
      'hash': hash,
      'limit': 20,
      'offset': (page - 1) * 20,
    };

    final response = await _client.get(
      marvelApiUrl,
      queryParameters: queryParams,
    );

    final characterResponse = CharacterResponse.fromJson(response.data);
    return characterResponse;
  }
}
