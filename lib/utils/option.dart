sealed class Option<T> {
  const Option();

  bool isSome() => this is Some<T>;
  bool isNone() => this is None<T>;

  T unwrap() => (this as Some<T>).value;
}

class Some<T> extends Option<T> {
  const Some(this.value);
  final T value;
}

class None<T> extends Option<T> {
  const None();
}
