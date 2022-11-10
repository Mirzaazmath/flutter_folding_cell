import 'package:flutter/material.dart';
import 'package:folding_cell/folding_cell/widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:  FoldingCellSimpleDemo(),
    );
  }
}

class FoldingCellSimpleDemo extends StatelessWidget {
  final _foldingCellKey = GlobalKey<SimpleFoldingCellState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(

        alignment: Alignment.center,
        child: SimpleFoldingCell.create(
          key: _foldingCellKey,
          frontWidget: _buildFrontWidget(),
          innerWidget: _buildInnerWidget(),
          cellSize: const Size(double.infinity, 140),
          padding:const  EdgeInsets.all(15),
          animationDuration:const  Duration(milliseconds: 300),
          borderRadius: 10,
          onOpen: () => print('cell opened'),
          onClose: () => print('cell closed'),
        ),
      ),
    );
  }

  Widget _buildFrontWidget() {
    return GestureDetector(
      onTap: (){
        _foldingCellKey.currentState?.toggleFold();
      },
      child: Container(
        color: Colors.blue,
        alignment: Alignment.center,
        child:Image.asset("assets/sup.webp",fit: BoxFit.fitWidth,),




      ),
    );
  }

  Widget _buildInnerWidget() {
    return GestureDetector(
      onTap: (){
        _foldingCellKey.currentState?.toggleFold();
      },

      child:
      Container(

          color:const  Color(0xFFecf2f9),
          // padding:const  EdgeInsets.only(top: 10),
          child:Image.asset("assets/bir.jpeg",fit: BoxFit.fill,)

      )
    );
  }
}