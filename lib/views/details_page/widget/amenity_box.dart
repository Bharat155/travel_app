import 'package:flutter/material.dart';

class AmenityBox extends StatelessWidget {

  final String name;
  final String image;

  const AmenityBox({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
      child: Container(
        width: 110,
        height: 45,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.0),
          shape: BoxShape.rectangle,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image.asset(
                image,
                width: 30,
                height: 50,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 5,),
            Text(
              name,
              style: const TextStyle(
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w600,
                fontSize: 14,
                letterSpacing: 0.4,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


