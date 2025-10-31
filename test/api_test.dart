import 'package:flutter_test/flutter_test.dart';
import 'package:what_the_duck/model/duck.dart';

void main() {
  group('fetchRandomDuck', () {
    test('returns a Duck with a valid imageUrl', () async {
      final duck = await fetchRandomDuck();
      expect(duck, isNotNull);
      expect(duck!.imageUrl, isNotEmpty);
      expect(Uri.tryParse(duck.imageUrl)?.hasAbsolutePath, isTrue);
      expect(duck.imageUrl, anyOf(contains('.jpg'), contains('.png'), contains('.gif')));
    });
  });
}
