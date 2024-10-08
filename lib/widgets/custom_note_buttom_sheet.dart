import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../add_note_cubit/add_note_cubit.dart';
import '../notes_cubit/notes_cubit.dart';
import 'Custom_botton.dart';
import 'add_note_form.dart';
import 'custom_text_field.dart';

class AddNoteBottonSheet extends StatelessWidget {
  const AddNoteBottonSheet({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNotetFailure) {
            print(' failde  ${state.errMessage}');
          }
          else if (state is AddNoteSucces) {
            BlocProvider.of<NotesCubit>(context).fetchAllNote();
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNoteLoading? true : false,
            child: Padding(
              padding:  EdgeInsets.only(left: 16, right: 16,
              bottom: MediaQuery.of(context).viewInsets.bottom
              ),
              child: const SingleChildScrollView(
                  child: addNoteForm()),
            ),
          );
        },
      ),
    );
  }
}

