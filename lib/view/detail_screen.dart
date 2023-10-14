import 'package:covd_19/view/word_states.dart';
import 'package:flutter/material.dart';

//import '../Services/states_services.dart';

class DetailScreen extends StatefulWidget {
  String image;
  String name;
  var  totalcases,totalDeaths,totalRecovered,active,critical,todayRecovered,test;
  DetailScreen({super.key,
    required this.name,
    required this.image,
    required this.totalDeaths,
    required this.totalcases,
    required this.todayRecovered,
    required this.critical,
    required this.totalRecovered,
    required this.test,
  required this.active,
  });
static const String id='detail_screen';
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(

      //  shadowColor: Colors.grey.shade500,
        elevation: 3,
        title: Text(widget.name,style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 100,),
          Stack(
            children: [

              Padding(
                padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height*.067),
                child: Card(
                  color: Colors.grey.shade900,
                  //use reusable function
                  child: Column(
                    children: [
                      ReusableRow(title: 'cases', value: widget.totalcases.toString()),
                      ReusableRow(title: 'totalRecovered', value: widget.totalRecovered.toString()),
                      ReusableRow(title: 'critical', value: widget.critical.toString()),
                      ReusableRow(title: 'tests', value: widget.test.toString()),
                      ReusableRow(title: 'active', value: widget.active.toString()),
                      ReusableRow(title: 'cases', value: widget.totalcases.toString()),
                      ReusableRow(title: 'deaths', value: widget.totalDeaths.toString()),
                    ],
                  ),
                ),
              ),
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(widget.image),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
