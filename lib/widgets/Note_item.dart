import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotemItem extends StatelessWidget {
  const NotemItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top :24,bottom:24,left:16),
      decoration: BoxDecoration(
        // color: const Color(0xffFFCC80),
        color: Colors.red,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title: Text('Flutter tips',
            style: TextStyle(
              color: Colors.black,
              fontSize: 30
            ),),
            subtitle: Padding(
              padding: const EdgeInsets.only(top :16,bottom: 16),
              child: Text('Build your career with amira hamed',
              style: TextStyle(
                color: Colors.black.withOpacity(.5),
                fontSize: 20
              ),
              ),
            ),
            trailing: IconButton(
              onPressed: (){},
              icon: Icon(
                FontAwesomeIcons.trash,
                size: 28,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Text('2-9-2024',
            style: TextStyle(
                color: Colors.black.withOpacity(.4),fontSize: 20
            ),),
          ),
        ],
      ),
    );
  }
}
