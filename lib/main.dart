import 'package:crypto_with_bloc/auth/bloc/authentication_bloc.dart';
import 'package:crypto_with_bloc/auth/data/providers/authentication_firebase_provider.dart';
import 'package:crypto_with_bloc/auth/data/providers/google_sign_in_provider.dart';
import 'package:crypto_with_bloc/auth/data/repositories/authenticaiton_repository.dart';
import 'package:crypto_with_bloc/home/repositories/crypto_repository.dart';
import 'package:crypto_with_bloc/home/views/home_main_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationBloc(
        authenticationRepository: AuthenticationRepository(
          authenticationFirebaseProvider: AuthenticationFirebaseProvider(
            firebaseAuth: FirebaseAuth.instance,
          ),
          googleSignInProvider: GoogleSignInProvider(
            googleSignIn: GoogleSignIn(),
          ),
        ),
      ),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Colors.black,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MultiRepositoryProvider(
          child: HomeMainView(),
          providers: [
            RepositoryProvider(
              create: (context) => CryptoRepository(),
            ),
            // RepositoryProvider(create: (context)=>DeleteReminderService())
          ],
        ),
      ),
    );
  }
}
