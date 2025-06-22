import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/core/resources/app_colors.dart';
import 'package:notes_app/cubits/create_note/create_note_cubit.dart';
import 'package:notes_app/cubits/create_note/create_notes_states.dart';
import 'package:notes_app/widgets/bottom_sheet_body.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateNoteCubit(),
      child: BlocConsumer<CreateNoteCubit, CreateNoteStates>(
        listener: (context, state) {
          if (state is CreateNoteLoading) {
            showDialog(
              context: context,
              builder: (context) {
                return Center(
                  child: AlertDialog(
                    backgroundColor: Colors.transparent,
                    title: CircularProgressIndicator(
                      color: AppColors.textFieldColor,
                    ),
                  ),
                );
              },
            );
          }
          if (state is CreateNoteSuccess) {
            Navigator.pop(context);
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.green,
                content: Text(
                  'Creates Note Successfully',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.whiteColor,
                  ),
                ),
                duration: Duration(seconds: 2),
              ),
            );
          }
          if (state is CreateNoteFailure) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(
                    "Error",
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textFieldColor,
                    ),
                  ),
                  content: Text(
                    state.message!,
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Ok"),
                    ),
                  ],
                );
              },
            );
          }
        },
        builder: (context, state) {
          return BottomSheetBody();
        },
      ),
    );
  }
}
