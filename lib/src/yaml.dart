import './common.dart';
import './page.dart';

class YamlTools {
  YamlTools._();

  static Page parseYamlFrontMatter(String stringData) {
    final RegExp pattern = RegExp(
      r"---\n(?<frontMatterContents>((.+)\n)*(.+))\n---",
    );

    final RegExpMatch? frontMatter = pattern.firstMatch(stringData);
    if (frontMatter == null) {
      throw FormatException("Cannot find front matters.", stringData);
    }

    final String? frontMatterContentsString = frontMatter.namedGroup(
      "frontMatterContents",
    );

    if (frontMatterContentsString == null) {
      throw FormatException(
        "Cannot extract the contents from the front matter",
        frontMatter,
      );
    }

    final List<String> frontMatterContentsList = frontMatterContentsString
        .split("\n");

    final data = CommonTools.frontMattersToMap(frontMatterContentsList, ":");
    final body = stringData.split(pattern)[1];
    return Page(data, body);
  }
}
