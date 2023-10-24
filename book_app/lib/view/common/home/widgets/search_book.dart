import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remixicon/remixicon.dart';

import '../../../../bloc/book/book_bloc.dart';
import '../../../../style/style.dart';

class SearchBook extends StatefulWidget {
  const SearchBook({
    super.key,
    required this.size,
    this.pass,
    this.label,
    required this.onChanged,
    this.format,
  });
  final bool? pass;
  final Size size;
  final String? label;
  final Function(String)? onChanged;
  final bool? format;

  @override
  _LoginFormFieldState createState() => _LoginFormFieldState(
        size: size,
        pass: pass,
        label: label,
        obscure: pass ?? false,
        onChanged: onChanged,
        format: format,
      );
}

class _LoginFormFieldState extends State<SearchBook> {
  _LoginFormFieldState({
    required this.onChanged,
    required this.size,
    this.pass,
    this.label,
    required this.obscure,
    this.format,
  });
  final FocusNode _focusNode = FocusNode();
  final bool? pass;
  final Size size;
  final String? label;
  bool obscure = false;
  final Function(String)? onChanged;
  final bool? format;

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      setState(() {});
    });
  }

  void obscurePass() {
    this.obscure = !this.obscure;
    setState(() {});
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        textSelectionTheme: const TextSelectionThemeData(
            selectionColor: Color.fromARGB(255, 141, 56, 56),
            selectionHandleColor: ColorPalette.primary),
      ),
      child: BlocBuilder<BookBloc, BookState>(
        builder: (context, state) => Padding(
          padding: const EdgeInsets.only(
            left: 40,
            right: 40,
            bottom: 15,
          ),
          child: TextField(
            inputFormatters: (format ?? false)
                ? [FilteringTextInputFormatter.allow(RegExp("[0-9]"))]
                : null,
            textAlign: TextAlign.left,
            keyboardType: (format ?? false) ? TextInputType.number : null,
            focusNode: _focusNode,
            cursorColor: ColorPalette.textColor,
            cursorWidth: 1.5,
            cursorRadius: const Radius.circular(0.5),
            onChanged: onChanged,
            style: TextStyle(
              color: _focusNode.hasFocus
                  ? ColorPalette.textColor
                  : ColorPalette.unFocused,
            ),
            decoration: InputDecoration(
                suffixIcon: !obscure
                    ? Padding(
                        padding: const EdgeInsets.all(5),
                        child: GestureDetector(
                          onTap: () => state.loadingBooks
                              ? null
                              : BlocProvider.of<BookBloc>(context)
                                  .add(const SearchBooks()),
                          child: Container(
                            decoration: BoxDecoration(
                                color: state.loadingBooks ||
                                        state.searchData.isEmpty
                                    ? ColorPalette.unFocused
                                    : ColorPalette.primary,
                                borderRadius: BorderRadius.circular(50)),
                            child: state.loadingBooks
                                ? const Padding(
                                    padding: EdgeInsets.all(10),
                                    child: SizedBox(
                                      width: 2,
                                      height: 2,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 2.5,
                                      ),
                                    ),
                                  )
                                : const Icon(
                                    Remix.search_line,
                                    size: 22.5,
                                    color: ColorPalette.background,
                                    weight: 0.5,
                                  ),
                          ),
                        ),
                      )
                    : null,
                labelText: label,
                labelStyle: TextStyle(
                  color: _focusNode.hasFocus
                      ? ColorPalette.textColor
                      : ColorPalette.unFocused,
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide:
                        const BorderSide(color: ColorPalette.unFocused)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide(color: ColorPalette.primary)),
                contentPadding: const EdgeInsets.only(left: 20, right: 20)),
          ),
        ),
      ),
    );
  }
}
