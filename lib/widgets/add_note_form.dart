import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_application/add_note_cubit/add_note_cubit.dart';
import 'package:notes_application/models/note_model.dart';

import '../notes_cubit/notes_cubit.dart';
import 'Custom_botton.dart';
import 'color_item.dart';
import 'colors_list_view.dart';
import 'custom_text_field.dart';

class addNoteForm extends StatefulWidget {
  const addNoteForm({
    super.key,
  });

  @override
  State<addNoteForm> createState() => _addNoteFormState();
}

class _addNoteFormState extends State<addNoteForm> {
  @override
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String ?title, subTitle;

  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          CustomTextField(
            onSaved: (value) {
              title = value;
            },
            hint: 'Title',

          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            onSaved: (value) {
              subTitle = value;
            },
            hint: 'content',
            maxlines: 5,
          ),
          const SizedBox(height: 20,),

          ColorsListView(),

          const SizedBox(height: 20,),

          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomBottom(
                isLoading: state is AddNoteLoading ? true : false,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    saveNote(context);

                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {

                    });
                  }
                },
              );
            },
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  void saveNote(BuildContext context) {
     DateTime now=DateTime.now();
    String formattedDay=DateFormat('yyy-MM-dd').format(now);
    var notModel = NoteModel(title: title!,
        subTitle: subTitle!,
        date: formattedDay,
        color: Colors.brown.value);
    BlocProvider.of<AddNoteCubit>(context).addNote(notModel);
  }
}

