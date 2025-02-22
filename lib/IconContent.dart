
import 'package:flutter/cupertino.dart';

class IconContent extends StatelessWidget {
   IconContent({required this.icon , required this.label});
   final IconData icon;
   final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
    mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size:80,
        ),
        SizedBox(
          height:15,
        ),
        Text(label,
        style: TextStyle(fontSize: 20,color: Color(0xFF8D8E98),
        ),),
      ],
    );
  }
}
