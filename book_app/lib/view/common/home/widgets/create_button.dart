import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/book/book_bloc.dart';
import '../../../../style/style.dart';

class CreateButton extends StatelessWidget {
  const CreateButton({super.key, required this.size, required this.onPressed});
  final Size size;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookBloc, BookState>(
      builder: (context, state) => Padding(
        padding: const EdgeInsets.only(
          left: 40,
          right: 40,
        ),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              splashFactory: NoSplash.splashFactory,
              fixedSize: const Size.fromHeight(45),
              backgroundColor: state.loadingCreate ||
                      state.newBookTitle.isEmpty ||
                      state.newBookAutor.isEmpty
                  ? ColorPalette.unFocused
                  : ColorPalette.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            onPressed: onPressed,
            child: state.loadingCreate
                ? const Padding(
                    padding: EdgeInsets.all(0),
                    child: SizedBox(
                      width: 25,
                      height: 25,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2.5,
                      ),
                    ),
                  )
                : const Text(
                    'Registrar',
                    style: TextStyle(color: ColorPalette.textLightColor),
                  ),
          ),
        ),
      ),
    );
  }
}
