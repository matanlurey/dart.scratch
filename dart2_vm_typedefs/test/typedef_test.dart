import 'package:test/test.dart';

class CacheBucket {
  final CacheConfig cacheConfig;
  const CacheBucket._({this.cacheConfig: const CacheConfig()});
  const CacheBucket() : this._();
}

class CacheEntry<K, V> {
  final K key;
  final V value;
  const CacheEntry(this.key, this.value);
}

typedef Iterable<CacheEntry<K, V>> CacheEvictionFn<K, V>(
  List<CacheEntry<K, V>> entries,
);

Iterable<CacheEntry<K, V>> identityCacheEviction<K, V>(
  List<CacheEntry<K, V>> entries,
) =>
    entries;

class CacheConfig {
  final CacheEvictionFn cacheEvictionFn;
  const CacheConfig({this.cacheEvictionFn = identityCacheEviction});
}

void main() {
  test('should not blow up spectacularly', () {
    new CacheBucket();
  });
}
