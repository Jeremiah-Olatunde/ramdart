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

T tap<T>(Function(T) f, T t){
  f(t);
  return t;
}

Iterable<T> times<T>(T Function(int) f, int n){
  return [ for(int i = 1; i < n + 1; i++) f(i) ];
}

Iterable<T> adjust<T>(int n, T Function(T) f, Iterable<T> xs){
  return xs.indexed.map((pair) => pair.$1 == n ? f(pair.$2) : pair.$2);
}

List<T> adjustRecursive<T>(int n, T Function(T) f, List<T> xs){
  return switch(xs){
    [] => [],
    [T head, ...List<T> rest] => [n == 0 ? f(head) : head] + adjustRecursive(n - 1, f, rest),
  };
}

bool all<T>(bool Function(T) predicate, List<T> xs){
  return xs.every(predicate);
}

bool allRecursive<T>(bool Function(T) predicate, List<T> xs){
  return switch(xs){
    [] => true,
    [T head, ...List<T> rest] => predicate(head) && allRecursive(predicate, rest),
  };
}