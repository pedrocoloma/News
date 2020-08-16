import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingFeed extends StatelessWidget {
  const LoadingFeed({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300],
        highlightColor: Colors.grey[100],
        child: ListView.builder(
            itemBuilder: (_, __) => Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 10.0,
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: 180,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Container(
                        width: double.infinity,
                        height: 70,
                        color: Colors.white,
                      ),
                    ],
                  ),
                )),
      ),
    );
  }
}
