import 'package:flutter/material.dart';
import 'package:stones/colors.dart';

class SidebarTile extends StatelessWidget {
  const SidebarTile({Key? key, required this.icon, required this.text, required this.onTap}) : super(key: key);

  final IconData icon;
  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
        child: Container(
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: beachBlue),),
          ),
          child: InkWell(
            splashColor: beachBlue,
            onTap: onTap,
            child: SizedBox(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(icon, color: Colors.white,),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(text, style: const TextStyle(fontSize: 16, color: Colors.white),),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}
