import 'package:gitjournal/utils/markdown.dart';
import 'package:test/test.dart';

void main() {
  group('Markdown Remove Formatting', () {
    test('Test Headers', () {
      var input = '# Hello\nHow are you?';
      expect(stripMarkdownFormatting(input), 'Hello How are you?');
    });

    test('Test Header2', () {
      var input = """Test Header
----------

Hello
      """;

      expect(stripMarkdownFormatting(input), 'Test Header Hello');
    });

    test('Itemized LIsts', () {
      var input = """Itemized lists
look like:

  * this one
  * that one
      """;

      expect(stripMarkdownFormatting(input),
          'Itemized lists look like: this one that one');
    });
  });
}
