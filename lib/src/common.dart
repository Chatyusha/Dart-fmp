import 'package:dart_fmp/src/pair.dart';

class CommonTools {
  CommonTools._(); // instance化の禁止

  static Map<String, dynamic> frontMattersToMap(
    List<String> matters,
    String separator,
  ) {
    RegExp keyReg = RegExp(r"^([^:" + separator + r"]+)" + separator);
    RegExp valReg = RegExp(separator + r"(.+)$");

    final Iterable<Pair> mattersPairList = matters.map((String elem) {
      return _getKeyValuePair(elem, keyReg, valReg);
    });

    final Map<String, dynamic> frontMattersMap = Map.fromEntries(
      mattersPairList.map((Pair element) {
        return MapEntry(element.first, element.second);
      }),
    );

    return frontMattersMap;
  }

  static Pair<String, Object?> _getKeyValuePair(
    String line,
    RegExp keyReg,
    RegExp valReg,
  ) {
    final RegExp whiteSpace = RegExp(r"( |\t)");

    final String key = keyReg
        .firstMatch(line)!
        .group(1)!
        .replaceAll(whiteSpace, "");
    final Object? value = valReg
        .firstMatch(line)
        ?.group(1)
        ?.trim()
        .replaceAll(RegExp(r" +"), r" ");

    return Pair(first: key, second: value);
  }
}
