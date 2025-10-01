import 'package:dart_fmp/src/page.dart';

import './yaml.dart';

import './lang_collections.dart';

class FMP {
  static Page parseFrontMatter(final LangCollections lang, final String data) {
    switch (lang) {
      case LangCollections.yaml:
        return YamlTools.parseYamlFrontMatter(data);
    }
  }
}
