import 'package:coffe/dettaille.dart';
import 'package:coffe/listoffes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final PageController _controller = PageController(viewportFraction: 0.35);
  final PageController _controllernames = PageController();
  double valueofpage = 0;
  final Duration _duration = Duration(milliseconds: 250);

  listentController() {
    setState(() {
      valueofpage = _controller.page!;
    });
  }

  @override
  void initState() {
    _controller.addListener(() {
      listentController();
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.addListener(() {
      listentController();
    });
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        leading:
            IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new)),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.shopping_bag))],
      ),
      body: Stack(
        children: [
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: 40,
              child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: _controllernames,
                  itemCount: names.length,
                  itemBuilder: (_, index) {
                    var name = names[index];
                    return Center(
                        child: Text(
                      "$name",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.brown,
                          fontWeight: FontWeight.w700),
                    ));
                  })),
          Positioned(
              top: 20,
              left: 0,
              right: 0,
              height: 50,
              child: Center(
                child: AnimatedSwitcher(
                  duration: _duration,
                  child: names.length > valueofpage
                      ? Text(
                          "\$ ${coffes[valueofpage.toInt()].price}",
                          key: Key("${coffes[valueofpage.toInt()].name}"),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        )
                      : null,
                ),
              )),
          Positioned(
              bottom: -size.height * 0.1,
              right: 0,
              left: 0,
              height: 100,
              child: DecoratedBox(
                decoration: BoxDecoration(boxShadow: const [
                  BoxShadow(
                      color: Colors.brown, blurRadius: 90, spreadRadius: 45),
                ]),
              )),
          Transform.scale(
            scale: 1.6,
            alignment: Alignment.bottomCenter,
            child: PageView.builder(
                scrollDirection: Axis.vertical,
                onPageChanged: (value) {
                  _controllernames.animateToPage(value,
                      duration: _duration, curve: Curves.bounceIn);
                },
                physics: BouncingScrollPhysics(),
                controller: _controller,
                itemCount: coffes.length + 1,
                itemBuilder: (_, index) {
                  if (index == 0) {
                    return SizedBox.shrink();
                  }

                  Coffes coffe = coffes[index - 1];
                  var result = valueofpage - index + 1;
                  var value = -0.4 * result + 1;
                  var opacity = value.clamp(0.0, 1.0);
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Transform(
                      alignment: Alignment.bottomCenter,
                      transform: Matrix4.identity()
                        ..translate(0.0, size.height / 2.6 * (1 - value).abs())
                        ..scale(value),
                      child: Opacity(
                        opacity: opacity,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) {
                              return dettaile(
                                image: coffe.image,
                                tag: index,
                                price: coffe.price,
                                name: coffe.name,
                              );
                            }));
                          },
                          child: Hero(tag: index, child: coffe.image),
                        ),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
