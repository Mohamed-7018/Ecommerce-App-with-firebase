import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'input_helper.dart';

typedef void CaretMoved(Offset globalCaretPosition);
typedef void TextChanged(String text);

// Helper widget to track caret position.
class TrackingTextInput extends StatefulWidget {
  TrackingTextInput(
      {Key key,
        this.onCaretMoved,
        this.onTextChanged,
        this.hint,
        this.label,
        this.isObscured = false, this.onEditingComplete, this.focusNode, this.textInputAction, this.changed, this.controller})
      : super(key: key);
  final CaretMoved onCaretMoved;
  final TextChanged onTextChanged;
  final String hint;
  final String label;
  final bool isObscured;
  final  onEditingComplete;
  final FocusNode focusNode;
  final TextInputAction textInputAction;
  final Function changed;
  final TextEditingController controller;
  @override
  _TrackingTextInputState createState() => _TrackingTextInputState();
}

class _TrackingTextInputState extends State<TrackingTextInput> {
  final GlobalKey _fieldKey = GlobalKey();
  Timer _debounceTimer;
  @override
  initState() {
    final TextEditingController _textController = widget.controller;
    _textController.addListener(() {
      // We debounce the listener as sometimes the caret position is updated after the listener
      // this assures us we get an accurate caret position.
      if (_debounceTimer?.isActive ?? false) _debounceTimer.cancel();
      _debounceTimer = Timer(const Duration(milliseconds: 100), () {
        if (_fieldKey.currentContext != null) {
          // Find the render editable in the field.
          final RenderObject fieldBox =
          _fieldKey.currentContext?.findRenderObject();
          var caretPosition =
          fieldBox is RenderBox ? getCaretPosition(fieldBox) : null;

          widget.onCaretMoved?.call(caretPosition);
        }
      });
      widget.onTextChanged?.call(_textController.text);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: TextFormField(
          decoration: InputDecoration(
            hintText: widget.hint,
            labelText: widget.label,
          ),
          onChanged: widget.changed,
          onEditingComplete: widget.onEditingComplete,
          focusNode: widget.focusNode,
          textInputAction: widget.textInputAction,
          key: _fieldKey,
          controller: widget.controller,
          obscureText: widget.isObscured,
          validator: (value) {}),
    );
  }
}
