
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_application/constants.dart';

import '../models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  Color color= const Color(0xffFFCDB2);
  AddNoteCubit() : super(AddNoteInitial());

  // bool isLoading=false;
  addNote(NoteModel note)async{
    note.color=color!.value;
    // isLoading=true;
    emit(AddNoteLoading());
    //it is also true-- var NotesBox=Hive.box(kNotesBox);
    try {
      var NotesBox=Hive.box<NoteModel>(kNotesBox);

         // isLoading=false;
         emit(AddNoteSucces());
      await NotesBox.add(note);
    } catch (e) {
      // isLoading=false;
      emit(AddNotetFailure('the erro in add note cubit --${e.toString()}'));
    }

  }
}
