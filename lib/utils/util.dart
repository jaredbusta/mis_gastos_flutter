import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';

class Util {
  static int color(String hexColor) {
    return int.parse(hexColor.replaceAll("#", "0xff"));
  }

  static dynamic encode({Key? key, required text, required seed}) {
    var digest;
    var _key = utf8.encode(seed);
    var bytes = utf8.encode(text);
    var hmacSha256 = Hmac(sha256, _key); // HMAC-SHA256
    digest = hmacSha256.convert(bytes);
    var b64 = base64.encode(digest.bytes);
    return "$digest";
    // return json.encode({b64: b64, digest: "$digest"});
  }
}
