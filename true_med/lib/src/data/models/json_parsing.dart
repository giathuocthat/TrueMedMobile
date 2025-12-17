// // json_parsing.dart
// typedef JsonParser<T> = T Function(Map<String, dynamic> json);

// /// Parse 1 object từ dynamic.
// /// - null -> null
// /// - Map -> parser(map)
// /// - String (JSON) -> decode rồi parse
// T? parseObject<T>(dynamic json, JsonParser<T> parser) {
//   if (json == null) return null;

//   if (json is Map<String, dynamic>) {
//     return parser(json);
//   }

//   // Optional: nếu backend trả "data" dạng string JSON
//   if (json is String) {
//     // ignore: avoid_dynamic_calls
//     final decoded = _tryDecodeJson(json);
//     if (decoded is Map<String, dynamic>) return parser(decoded);
//   }

//   throw FormatException(
//     'parseObject: Expected Map<String, dynamic> but got ${json.runtimeType}',
//   );
// }

// /// Parse list object từ dynamic.
// /// - null -> []
// /// - List<Map> -> map(parser)
// /// - String (JSON) -> decode rồi parse
// List<T> parseList<T>(dynamic json, JsonParser<T> parser) {
//   if (json == null) return <T>[];

//   if (json is List) {
//     return json.map((e) {
//       if (e is Map<String, dynamic>) return parser(e);
//       if (e is Map) return parser(Map<String, dynamic>.from(e));
//       throw FormatException(
//         'parseList: Each item must be Map<String, dynamic> but got ${e.runtimeType}',
//       );
//     }).toList();
//   }

//   // Optional: nếu backend trả list dạng string JSON
//   if (json is String) {
//     final decoded = _tryDecodeJson(json);
//     if (decoded is List) {
//       return decoded.map((e) {
//         if (e is Map<String, dynamic>) return parser(e);
//         if (e is Map) return parser(Map<String, dynamic>.from(e));
//         throw FormatException(
//           'parseList: Each item must be Map<String, dynamic> but got ${e.runtimeType}',
//         );
//       }).toList();
//     }
//   }

//   throw FormatException('parseList: Expected List but got ${json.runtimeType}');
// }

// /// Extension cho dynamic (data field) để gọi gọn:
// /// data.toObject(ProductModel.fromJson)
// /// data.toList(ProductModel.fromJson)
// extension JsonParsing on dynamic {
//   T? toObject<T>(JsonParser<T> parser) => parseObject(this, parser);
//   List<T> toList<T>(JsonParser<T> parser) => parseList(this, parser);
// }

// /// --------- internal helpers ---------

// dynamic _tryDecodeJson(String raw) {
//   // Để file này không phụ thuộc dart:convert ở nơi khác thì import tại đây
//   // ignore: avoid_slow_async_io
//   try {
//     // ignore: avoid_dynamic_calls
//     return _jsonDecode(raw);
//   } catch (_) {
//     return raw;
//   }
// }

// dynamic _jsonDecode(String source) {
//   // tách hàm để dễ test/mock
//   // ignore: avoid_dynamic_calls
//   return (const _JsonCodec()).decode(source);
// }

// /// Minimal wrapper để tránh import trực tiếp jsonDecode ở top-level nếu bạn muốn.
// /// Bạn có thể thay bằng: import 'dart:convert'; và jsonDecode(...) cho đơn giản.
// class _JsonCodec {
//   const _JsonCodec();
//   dynamic decode(String source) {
//     // ignore: avoid_dynamic_calls
//     return _dartConvertJsonDecode(source);
//   }
// }

// // Nếu bạn thích đơn giản, hãy xoá toàn bộ phần wrapper trên
// // và thay _dartConvertJsonDecode bằng jsonDecode từ dart:convert.
// dynamic _dartConvertJsonDecode(String source) {
//   // ignore: avoid_dynamic_calls
//   // ignore: deprecated_member_use
//   return _jsonDecodeImpl(source);
// }

// // --- Implementation thật sự dùng dart:convert ---
// dynamic _jsonDecodeImpl(String source) {
//   // Đây là cách "clean" nhất: import dart:convert ở đầu file và gọi jsonDecode
//   // Nhưng vì mình đang gửi full code 1 file, mình viết inline:
//   // ignore: unnecessary_import
//   // ignore: avoid_dynamic_calls
//   return __jsonDecode(source);
// }

// // ignore: avoid_dynamic_calls
// dynamic __jsonDecode(String source) {
//   // import dart:convert ngay trong hàm (hợp lệ trong Dart)
//   // ignore: avoid_dynamic_calls
//   // ignore: library_prefixes
//   // ignore: unnecessary_import
//   // ignore: no_leading_underscores_for_local_identifiers
//   final _ = _DartConvert();
//   return _.jsonDecode(source);
// }

// class _DartConvert {
//   dynamic jsonDecode(String source) {
//     // ignore: avoid_dynamic_calls
//     // ignore: unnecessary_import
//     // ignore: unused_local_variable
//     // Thực tế dự án bạn chỉ cần:
//     // import 'dart:convert';
//     // return jsonDecode(source);
//     throw UnimplementedError(
//       'Please simplify: import "dart:convert" and use jsonDecode(source).',
//     );
//   }
// }
extension JsonParsing on dynamic {
  List<T> toList<T>(T Function(Map<String, dynamic>) parser) {
    if (this is List) {
      return (this as List)
          .map((e) => parser(e as Map<String, dynamic>))
          .toList();
    }
    return <T>[];
  }
}
