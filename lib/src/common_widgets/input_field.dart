import 'package:flutter/material.dart';

class InputFieldWidget extends StatefulWidget {
  final String labelText;
  final ValueChanged<String> onChanged;

  const InputFieldWidget(
      {super.key, required this.labelText, required this.onChanged});

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
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        labelText: widget.labelText,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
