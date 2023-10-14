import 'package:covd_19/Model/worldStatesModel.dart';
import 'package:covd_19/Services/states_services.dart';
import 'package:covd_19/view/countries_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStateScreen extends StatefulWidget {
  const WorldStateScreen({super.key});
  // static const String id ='word_states';
  @override
  State<WorldStateScreen> createState() => _WorldStateScreenState();
}

class _WorldStateScreenState extends State<WorldStateScreen> with TickerProviderStateMixin{
  late final AnimationController _controller=AnimationController(
    duration: Duration(seconds: 3),
      vsync:this )..repeat();

  @override
  void dispose() {
    // TODO: implement dispose
    _controller;
  }

  final List <Color> colorList=[
    const Color(0xff4285F4),
    const Color(0xff1aa260),
    const Color(0xffde5246)
  ];
  @override
  Widget build(BuildContext context) {
    /////////////////////////////////////////////
    StatesServices statesServices=StatesServices();//future function
    ///////////////////////////////////////////////
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*.04,),
              ////////////////////////////////
              //future Builder
              FutureBuilder(
                  future: statesServices.fetchWorldStatesRecords(),
                  builder: (context,AsyncSnapshot<WorldStatesModel> snapshot){
                    if (!snapshot.hasData ) {
                          return Expanded(
                          flex:1,
                          child: SpinKitFadingCircle(
                              color: Colors.white,
                              size: 50,
                              controller: _controller,
                          ),
                          );
                      }else {
                       return  Column(
                       children: [
                         /////
                         PieChart(
                           dataMap:{
                             "Total":double.parse(snapshot.data!.cases.toString()),
                             "Recover": double.parse(snapshot.data!.recovered.toString()),
                             "Deaths": double.parse(snapshot.data!.deaths.toString()),
                           },
                           chartValuesOptions: ChartValuesOptions(
                             showChartValuesInPercentage: true,
                           ),
                           animationDuration:Duration(milliseconds: 1200) ,
                           chartType: ChartType.ring,
                           chartRadius: MediaQuery.of(context).size.width / 2.8,
                           colorList:colorList,
                           ringStrokeWidth: 52,
                           chartLegendSpacing:42,
                           legendOptions: LegendOptions(
                             legendTextStyle: TextStyle(
                               color: Colors.white,
                               fontWeight: FontWeight.bold,
                             ),
                           ),
                         ),

                         Padding(
                           padding:  EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.06,),
                           child: Card(
                             color: Colors.grey.shade900,
                             child: Column(
                               children: [
                                 ReusableRow(title: 'Total', value: snapshot.data!.cases.toString()),
                                 ReusableRow(title: 'Deaths', value: snapshot.data!.deaths.toString()),
                                 ReusableRow(title: 'Recovered', value: snapshot.data!.recovered.toString()),
                                 ReusableRow(title: 'Active', value: snapshot.data!.active.toString()),
                                 ReusableRow(title: 'Critical', value: snapshot.data!.critical.toString()),
                                 ReusableRow(title: 'Today Deaths', value: snapshot.data!.todayDeaths.toString()),
                                 ReusableRow(title: 'Today Recovered', value: snapshot.data!.todayRecovered.toString()),
                               ],
                             ),
                           ),
                         ),
                         GestureDetector(
                           onTap:(){
                             Navigator.push(context,MaterialPageRoute(builder: (context)=>CountryListScreen()));
                         },
                           child: Container(
                             height: 50,
                             decoration: BoxDecoration(
                                 color: Color(0xff1aa260),
                                 borderRadius: BorderRadius.circular(10)
                             ),
                             child: Center(
                               child: Text('Track Countries',
                                 style: TextStyle(color: Colors.white,
                                     fontWeight: FontWeight.bold,fontSize: 20),),
                             ),
                           ),
                         ),
                         ////
                       ],
                       );
                             }
                  }),
              ////////////////////////////////

            ],
          ),
        ),
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
 String title,value;
  ReusableRow({super.key,required this.title,required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,style: TextStyle(color: Colors.white),),
              Text(value,style: TextStyle(color: Colors.white),),
            ],
          ),
          SizedBox(height: 5,),
          Divider()
        ],
      ),
    );
  }
}
