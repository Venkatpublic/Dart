class Tuple<E> {
  final E? _a;
  final E? _b;
  final E? _c;
  const Tuple(this._a, this._b, this._c);
  Tuple.fromList(List<E?> paramList)
    : _a = paramList.asMap().containsKey(0) ? paramList[0] : null,
      _b = paramList.asMap().containsKey(1) ? paramList[1] : null,
      _c = paramList.asMap().containsKey(2) ? paramList[2] : null;
  E? get first => _a;
  E? get second => _b;
  E? get third => _c;
  Tuple<num> operator +(Tuple<num> t) {
    if (this is Tuple<num>) {
      final thisAsTupleNum = this as Tuple<num>;
      return Tuple(
        thisAsTupleNum._a! + t._a!,
        thisAsTupleNum._b! + t._b!,
        thisAsTupleNum._c! + t._c!,
      );
    }
    return Tuple(0, 0, 0);
  }

  Tuple<num> operator -(Tuple<num> t) {
    if (this is Tuple<num>) {
      final thisAsTupleNum = this as Tuple<num>;
      return Tuple(
        thisAsTupleNum._a! - t._a!,
        thisAsTupleNum._b! - t._b!,
        thisAsTupleNum._c! - t._c!,
      );
    }
    return Tuple(0, 0, 0);
  }

  @override
  String toString() => 'Tuple(first:$first,second:$second,third:$third)';
}
