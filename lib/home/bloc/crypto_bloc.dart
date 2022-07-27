import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:crypto_with_bloc/home/repositories/crypto_repository.dart';
import 'package:crypto_with_bloc/home/model/crypto_model.dart';

part 'crypto_event.dart';
part 'crypto_state.dart';

class CryptoBloc extends Bloc<CryptoEvent, CryptoState> {
  final CryptoRepository _cryptoRepository;
  CryptoBloc(this._cryptoRepository) : super(CryptoLoadingState()) {
    on<CryptoEvent>((event, emit) async {
      final cryptoNews = await _cryptoRepository.getNews();
      emit(CryptoLoadedState(cryptoNews.count, cryptoNews.next,
          cryptoNews.previous, cryptoNews.results));
    });
  }
}
