R Function(U) Function(T) curry2<T, U, R>(R Function(T, U) f) {
  return (T t) => (U u) => f(t, u);
}

R Function(V) Function(U) Function(T) curry3<T, U, V, R>(
    R Function(T, U, V) f) {
  return (T t) => (U u) => (V v) => f(t, u, v);
}

R Function(W) Function(V) Function(U) Function(T) curry4<T, U, V, W, R>(
    R Function(T, U, V, W) f) {
  return (T t) => (U u) => (V v) => (W w) => f(t, u, v, w);
}

T Function() always<T>(T t) {
  return () => t;
}

var constant = always;

R Function(U, T) flip<T, U, R>(R Function(T, U) f) {
  return (U u, T t) => f(t, u);
}
