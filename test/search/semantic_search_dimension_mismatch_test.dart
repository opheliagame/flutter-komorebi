import 'package:flutter_komorebi/src/features/search/data/semantic_search_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('isVectorDimensionMismatch', () {
    test('detects the "does not match stored dimension" query-time error', () {
      final error = ArgumentError(
        'Query embedding dimension 640 does not match stored dimension 512',
      );

      expect(isVectorDimensionMismatch(error), isTrue);
    });

    test('detects the "dimension mismatch" write-time error', () {
      final error = Exception(
        'Embedding dimension mismatch: shard was opened with dim=512, '
        'got dim=640',
      );

      expect(isVectorDimensionMismatch(error), isTrue);
    });

    test('returns false for unrelated errors', () {
      expect(isVectorDimensionMismatch(StateError('disk full')), isFalse);
      expect(isVectorDimensionMismatch(Exception('network error')), isFalse);
    });
  });
}
