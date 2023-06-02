import 'package:flutter/material.dart';

class InputFieldWidget extends StatefulWidget {
  final String labelText;
  final ValueChanged<String> onChanged;
  final TextStyle labelStyle;
  final TextStyle inputStyle;

  const InputFieldWidget(
      {super.key,
      required this.labelText,
      required this.onChanged,
      required this.labelStyle,
      required this.inputStyle});

  @override
  InputFieldWidgetState createState() => InputFieldWidgetState();
}

class InputFieldWidgetState extends State<InputFieldWidget> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      widget.onChanged(_controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          labelStyle: widget.labelStyle,
          labelText: widget.labelText,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
