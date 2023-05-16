import 'package:flutter/material.dart';

//ignore: must_be_immutable
class TransButton extends StatelessWidget {
  String lable;
  Color _buttColorOff = Color(0x4F2F2F2F);
  Color _buttColorOffL = Color(0x1F2F2F2F);
  Color _buttColorOn = Color(0x9F49CAAE);
  Color _buttColorOnL = Color(0x3F49CAAE);
  Function onTab;
  bool state;
  TransButton({
    super.key,
    required this.lable,
    this.state = true,
    required this.onTab,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 7, vertical: 2),
        alignment: Alignment.center,
        height: 23,
        width: lable.length.toDouble() * 6 + 30,
        decoration: BoxDecoration(
          color: state ? _buttColorOnL : _buttColorOffL,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
              color: state ? _buttColorOn : _buttColorOff,
              width: 1,
              strokeAlign: BorderSide.strokeAlignInside),
        ),
        child: Center(
          child: Text(
            lable,
            style: TextStyle(
                color: state ? _buttColorOn : _buttColorOff,
                fontSize: 13,
                fontWeight: FontWeight.w400),
          ),
        ),
      ),
      onTap: () {
        onTab();
      },
    );
  }
}
