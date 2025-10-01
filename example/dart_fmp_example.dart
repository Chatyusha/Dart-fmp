import 'package:dart_fmp/fmp.dart';

void main() {
  const String markdown = """---
title : The Title of This Article
date : 2025-07-07
lastmod : 2025-08-25
---

# Abstruct

Hello

""";

  final page = FMP.parseFrontMatter(LangCollections.yaml, markdown);
  print("The title is \"${page.frontMatterData["title"]}\"");
  print("Published on ${page.frontMatterData["date"]}");
  print("Last modified on ${page.frontMatterData["date"]}");

  print("\nBody \n-------\n ${page.body}");
}
