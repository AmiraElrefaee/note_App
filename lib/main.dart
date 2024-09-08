import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_application/constants.dart';
import 'package:notes_application/models/note_model.dart';
import 'package:notes_application/views/Notes_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_note_cubit/add_note_cubit.dart';

void main() async {

  await Hive.initFlutter();
  await Hive.openBox(kNotesBox);
  Hive.registerAdapter(NoteModelAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:[

        BlocProvider(create: (context)=>AddNoteCubit()),
      ],
      child: MaterialApp(
      
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          brightness: Brightness.dark,
              fontFamily: 'Poppins',
        ),
        home: NotesView(),
      
      ),
    );
  }
}

