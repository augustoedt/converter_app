import 'package:bin2dec/managers/theme_manager.dart';
import 'package:bin2dec/services/theme_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

class MenuScreen extends StatelessWidget  with GetItMixin{

  //url encoding: https://www.w3schools.com/tags/ref_urlencode.asp
  BoxDecoration _buildShadowAndRoundedCorners(){
    return BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: const Color(0xff26282F),
      boxShadow: [
        BoxShadow(
          spreadRadius: 5,
          blurRadius: 10,
          color: Colors.black54
        )
      ]
    );
  }

  Widget _itemBuilder(BuildContext context, MenuItemModel item){

    return Container(
      width: 175, height: 160,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: _buildShadowAndRoundedCorners(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(flex: 3, child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(item.image, fit: BoxFit.cover,),
          )),
          Flexible(flex: 2, child: Padding(
            padding: const EdgeInsets.only(top: 13,left: 10, right: 10),
            child: Text(
              item.title,
              textAlign: TextAlign.center,
              softWrap: true,
              maxLines: null,
              style: Theme.of(context).textTheme.subtitle1,
            )
          )),
        ],
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Converter Menu', style: Theme.of(context).textTheme.headline6,),
        actions: [
          IconButton(
            icon: Icon(Icons.palette),
            onPressed: (){
            },
          )
        ],
      ),
      body: Center(
        heightFactor: 1,
        child: Wrap(
          children: menuItems.map((e) => _itemBuilder(context, e)).toList(),
        ),
      ),
    );
  }
}

List<MenuItemModel> menuItems = [
  MenuItemModel(image: 'assets/bintodec.png',title: 'Binary\nDecimal'),
  MenuItemModel(image: 'assets/urlencoder.png',title: 'Url-Encoder\nDecoder')
];

class MenuItemModel{
  final String title;
  final String image;
  MenuItemModel({
    this.title,
    this.image
  });
}