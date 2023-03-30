import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 60, right: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.abc,
            size: 100,
          ),
          SizedBox(height: 10),
          Text(
            'Share title',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 22,
                color: Colors.black45),
          ),
          SizedBox(height: 20 ),
          Text(
            'Share text',
            style: TextStyle(//nothing
                fontWeight: FontWeight.w400,
                fontSize: 17,
                color: Colors.black45),
            textAlign: TextAlign.center,
          ),
        ],
        // child: PageView.builder(itemBuilder: ((context, index) => Container())),
      ),
    );
  }
}
