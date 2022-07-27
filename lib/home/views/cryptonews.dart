import 'package:crypto_with_bloc/home/bloc/crypto_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypto_with_bloc/home/repositories/crypto_repository.dart';

class CryptoNews extends StatelessWidget {
  const CryptoNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CryptoBloc(
              RepositoryProvider.of<CryptoRepository>(context),
            )..add(LoadApiEvent()),
        child: Scaffold(
            body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<CryptoBloc, CryptoState>(
            builder: (context, state) {
              if (state is CryptoLoadingState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is CryptoLoadedState) {
                return ListView.builder(
                    itemCount: state.results!.length,
                    itemBuilder: (context, index) {
                      return Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${state.results![index].slug} news',
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      );
                    });
              }
              return Container();
            },
          ),
        )));
  }
}
