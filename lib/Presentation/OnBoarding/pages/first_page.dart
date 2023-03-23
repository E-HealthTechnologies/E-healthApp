import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 49, right: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 59, right: 60),
            child: Hero(
              tag: 'logo',
              child: Icon(Icons.add, size: 100),
            ),
          ),
          SizedBox(height: 50),
          Text(
            'welcome title',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 22,
                color: Colors.black45),
          ),
          SizedBox(height: 10),
          Text(
            'welcome text',
            style: TextStyle(
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
