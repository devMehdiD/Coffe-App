import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class dettaile extends StatelessWidget {
  dynamic image;
  dynamic price;
  dynamic tag;
  dynamic name;
  dettaile({Key? key, this.image, this.price, this.tag, this.name})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name,
                style: TextStyle(color: Colors.brown, fontSize: 30),
              ),
            ),
            Hero(
                tag: tag,
                child: Container(
                  height: 200,
                  width: 200,
                  child: image,
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                textColor: Colors.white,
                color: Colors.brown,
                onPressed: () {},
                child: Text(
                  "BUY\$ $price ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
