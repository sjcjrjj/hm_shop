import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/home.dart';

class HmSuggestion extends StatefulWidget {
  final SpecialOfferResult specialOfferResult;
  const HmSuggestion({super.key, required this.specialOfferResult});

  @override
  State<HmSuggestion> createState() => _HmSuggestionState();
}

class _HmSuggestionState extends State<HmSuggestion> {

  List<GoodsItem> _getDisplayItems (){
    if(widget.specialOfferResult.subTypes.isEmpty)
    {
      return [];
    }
    return widget.specialOfferResult.subTypes.first.goodsItems.items.take(3).toList();
  }
  Widget _buildHeader () {
    return Row(children: [
        Text("特惠推荐", style: TextStyle(color: const Color.fromARGB(255, 115, 45, 7), fontSize: 18, fontWeight: FontWeight.w700)),
        SizedBox(width: 10),
        Text("精选省攻略", style: TextStyle(color: const Color.fromARGB(255, 121, 43, 6), fontSize: 12),)
    ],);
  }
  Widget _builderLeft() {
    return Container(
      width: 100,
      height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(image: AssetImage("lib/assets/home_cmd_inner.png"), fit: BoxFit.cover)
      ),
    );
  }

  List<Widget> _getChildrenList(){
    List<GoodsItem> list = _getDisplayItems();
    return List.generate(list.length, (int index){
      return Column(      
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(8),
              child: Image.network(errorBuilder: (context, error, StackTrace) {
                  return Image.asset("lib/assets/home_cmd_inner.png", fit: BoxFit.cover, height: 140, width: 100,);
              }, 
              list[index].picture, width: 100, height: 140, fit:BoxFit.cover),
              ),
              SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color.fromARGB(255, 250, 22, 22)
              ),
              child:Text("￥${list[index].price}", style: TextStyle(color: Colors.white),)
            )
          ],
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
    child: Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color:Colors.blue,
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(image: AssetImage("lib/assets/home_cmd_sm.png"),
        fit:BoxFit.cover)

        ),
      alignment: Alignment.center,
      // height:300,
      child: Column(
        children:[
          _buildHeader(),
          SizedBox(height: 10,),
          Row(children: [
            _builderLeft(),
            Expanded(child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _getChildrenList(),
            ))
          ],)
        ],
      )
    ),
    );
  }
}