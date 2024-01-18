import 'dart:convert';
import 'package:crypto/crypto.dart';

String generateMarvelHash(
  String timestamp,
  String publicKey,
  String privateKey,
) {
  String timestampString = timestamp.toString();
  String hashInput = timestampString + privateKey + publicKey;

  var hash = md5.convert(utf8.encode(hashInput));
  return hash.toString();
}
