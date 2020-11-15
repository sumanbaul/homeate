import 'package:flutter/material.dart';
import 'package:homeate/widget/pieChart.dart';

class Temperature extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
      alignment: Alignment.topLeft,
      child: LayoutBuilder(
        builder: (context, constraint) => Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(193, 214, 233, 1),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  spreadRadius: 5,
                  blurRadius: 17,
                  offset: Offset(-5, -5),
                  color: Colors.white),
              BoxShadow(
                spreadRadius: 0,
                blurRadius: 20,
                offset: Offset(7, 7),
                color: Color.fromRGBO(146, 182, 216, 1),
              ),
            ],
          ),
          child: Stack(
            children: [
              Center(
                child: SizedBox(
                  width: constraint.maxWidth * 0.45,
                  child: CustomPaint(
                    child: Center(),
                    foregroundPainter: PieChart(
                      width: constraint.maxWidth * 0.2,
                      categories: kCategories,
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  height: constraint.maxWidth * 0.35,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(193, 214, 233, 1),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 1,
                          offset: Offset(-2, -2),
                          color: Colors.black.withOpacity(0.1)),
                      BoxShadow(
                        spreadRadius: -2,
                        blurRadius: 10,
                        offset: Offset(5, 5),
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      '37.3',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 32,
                          color: Colors.black87),
                    ),
                  ),
                ),
              ),
              Stack(children: <Widget>[
                Positioned(
                  top: 10.0,
                  right: -5.0,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 5)
                      ],
                    ),
                    child: Column(
                      children: <Widget>[
                        Text(
                          '92.2 %',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: Colors.black87),
                        ),
                        Text('Humidity',
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 11,
                                color: Colors.black87)),
                      ],
                    ),
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
