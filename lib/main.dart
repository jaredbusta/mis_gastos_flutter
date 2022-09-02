import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:mis_gastos/User/bloc/user_bloc.dart';
import 'package:mis_gastos/User/ui/screen/sign_in_screen.dart';
import 'package:mis_gastos/firebase_options.dart';
// import 'package:supabase/supabase.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light));
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // const supabaseUrl = 'https://mpitargpbdjqhlkoilea.supabase.co';
  // const supabaseKey =
  //     'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1waXRhcmdwYmRqcWhsa29pbGVhIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NjE0NjIyNTIsImV4cCI6MTk3NzAzODI1Mn0.I1aMbGvuDg9JGcAbl-KqXZHdGc7vIojIEzgI-OYKyFE';
  // final client = SupabaseClient(supabaseUrl, supabaseKey);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        bloc: UserBloc(),
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const SignInScreen()));
  }
}
