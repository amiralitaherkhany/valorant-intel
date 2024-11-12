abstract class UseCase<T, P> {
  T call(P params);
}

class NoParams {}
