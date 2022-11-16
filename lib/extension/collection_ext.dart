import 'package:collection/collection.dart';
T? cast<T>(x) => x is T ? x : null;

extension CollectionExt<E> on Iterator<E> {

}
