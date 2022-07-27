part of 'crypto_bloc.dart';

abstract class CryptoState extends Equatable {
  const CryptoState();
}

class CryptoLoadingState extends CryptoState {
  @override
  List<Object> get props => [];
}

class CryptoLoadedState extends CryptoState {
  int? count;
  String? next;
  dynamic previous;
  List<Result>? results;

  CryptoLoadedState(this.count, this.next, this.previous, this.results);

  @override
  // TODO: implement props
  List<Object?> get props => [count, next, previous, results];
}
