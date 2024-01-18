import 'package:dio/dio.dart';
import 'package:marvel_app/data/network/service/character_service.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

class DioMock extends Mock implements Dio {}

class ResponseMock extends Mock implements Response<dynamic> {}

void main() {
  group('character service status ok', () {
    late Dio client;
    late CharacterService service;
    final response = ResponseMock();

    setUp(() {
      client = DioMock();
      service = CharacterServiceImpl(client);
    });

    test(
        'GIVEN http client '
        'WHEN request characters at first page '
        'THEN get valid answer', () async {
      // GIVEN
      final dynamicResponse = {
        'code': 200,
        'status': 'Ok',
        'data': {
          'results': [],
          'info': {
            'count': 919,
            'pages': 2,
            'next': null,
            'prev': null,
          }
        }
      };

      when(() => response.statusCode).thenReturn(200);
      when(() => response.data).thenReturn(dynamicResponse);
      when(() => client.get('/character', queryParameters: {
            'apikey': 'a90a5d4be0e543b0ca9f8a782b461660',
            'ts': '1',
            'hash': 'ffd275c5130566a2916217b101f26150',
            'limit': 20,
            'offset': 0,
          })).thenAnswer((_) async => response);

      // WHEN
      final characterResponse = await service.getCharacters();

      expect(characterResponse, isNotEmpty);
    });

    test(
        'GIVEN http client '
        'WHEN request characters at first page '
        'THEN get 404 and exception', () async {
      // WHEN
      when(() => response.statusCode).thenReturn(404);
      when(() => client.get('/character', queryParameters: {
            'apikey': 'a90a5d4be0e543b0ca9f8a782b461660',
            'ts': '1',
            'hash': 'ffd275c5130566a2916217b101f26150',
            'limit': 20,
            'offset': 0,
          })).thenAnswer((_) async => response);

      // THEN
      expect(() => service.getCharacters(), throwsA((_) async => Future.error));
    });
  });
}
