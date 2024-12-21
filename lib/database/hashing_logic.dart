import 'dart:convert';

import 'package:cryptography/cryptography.dart';
import 'dart:math';

String generateSalt([int length = 16]){
  final random = Random.secure();
  final salt = List<int>.generate(length, (_) => random.nextInt(256));
  return salt.map((byte) => byte.toRadixString(16).padLeft(2, '0')).join();
}

Future<Map<String, String>> passwordHasher(String password, [String? salt]) async {
  salt ??= generateSalt();
  final algorithm = Sha256();
  final salted = password + salt;
  final hash = await algorithm.hash(utf8.encode(salted));
  return{
    'hash': hash.bytes.map((byte) => byte.toRadixString(16).padLeft(2, '0')).join(),
    'salt': salt };
}

