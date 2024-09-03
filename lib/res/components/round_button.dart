import 'package:flutter/material.dart';
import 'package:mvvm/res/color_names.dart';

class RoundButton extends StatefulWidget {
  final String value;
  final VoidCallback onPress;
  final bool loading;
  const RoundButton({super.key,required this.value, required this.onPress,this.loading=false});

  @override
  State<RoundButton> createState() => _RoundButtonState();
}

class _RoundButtonState extends State<RoundButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPress,
      child: Container(
        height: 50,
        width: 250,
        decoration: BoxDecoration(
          color: ColorNames.greenColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: (widget.loading)?CircularProgressIndicator(color: Colors.white,):Text(widget.value),
        ),
      ),
    );
  }
}
