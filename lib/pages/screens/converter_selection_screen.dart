import 'package:flutter/material.dart';

class ConvertSelectionScreen extends StatelessWidget {
  //url encoding: https://www.w3schools.com/tags/ref_urlencode.asp
  List<String> _items = ['Binary to Decimal', 'Text to Url Encoding', 'Metrics Converter', 'Weight Converter'];


  BoxDecoration _buildShadowAndRoundedCorners(){
    return BoxDecoration(
      color: Color(0xff282B33),
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          spreadRadius: 2,
          blurRadius: 10,
          color: Colors.black54
        )
      ]
    );
  }

  Widget _itemBuilder(BuildContext context, String title){
    return Container(
      width: 175, height: 175,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      decoration: _buildShadowAndRoundedCorners(),
      child: Text(title, style: Theme.of(context).textTheme.headline5,),
    );
  }



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Converter Menu', style: Theme.of(context).textTheme.headline6,),
      ),
      body: GridView.builder(
        itemCount: _items.length,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 170,
          childAspectRatio: 1
        ),
        itemBuilder: (_, index){
          return _itemBuilder(context, _items[index]);
        },
      ),
    );
  }
}
