//import 'package:covd_19/Services/Utilities/app_url.dart';
import 'package:covd_19/Services/states_services.dart';
import 'package:covd_19/view/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';



class CountryListScreen extends StatefulWidget {
  const CountryListScreen({super.key});
  //static const String id ='countries_list';
  @override
  State<CountryListScreen> createState() => _CountryListScreenState();
}

class _CountryListScreenState extends State<CountryListScreen> {
  final searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    /////////Future function
    StatesServices statesServices=StatesServices();
    return Scaffold(
     backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 5,
       backgroundColor: Colors.black12,
      ),
      body: SafeArea(
        child:Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onChanged: (value){
                  setState(() {

                  });
                },
                style: TextStyle(color: Colors.grey),
                controller: searchController,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  hintText: 'Search with country name',
                  hintStyle:TextStyle(color: Colors.grey) ,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(50.0)
                  ),
                ),
              ),
            ),
     Expanded(
           child:FutureBuilder(
         future:statesServices.countriesList(),
        builder: (context,AsyncSnapshot<List<dynamic>> snapshot ){

          if(!snapshot.hasData){
            return ListView.builder(
                itemCount:6,
                itemBuilder:(context,index){
                  return Shimmer.fromColors(
                    baseColor:Colors.blueAccent,
                    highlightColor: Colors.lightGreen,
                    child: ListTile(
                      title: Container(height: 10,width:89,color: Colors.white,),
                      subtitle: Container(height: 10,width:89,color: Colors.white,),

                      leading:Container(height: 50,width:50,color: Colors.white,),
                    ),
                  );
                });
          }else{
            return ListView.builder(
                itemCount:snapshot.data!.length,
                itemBuilder:(context,index){
                  String name =snapshot.data![index]['country'];
                  if(searchController.text.isEmpty){
                    return Column(
                      children: [
                        InkWell(
                          onTap:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailScreen(
                                name: snapshot.data![index]['country'],
                                image:  snapshot.data![index]['countryInfo']['flag'],
                                totalDeaths:  snapshot.data![index]['deaths'],
                                totalcases:  snapshot.data![index]['cases'],
                                todayRecovered:  snapshot.data![index]['recovered'],
                                critical:  snapshot.data![index]['critical'],
                                totalRecovered: snapshot.data![index][' totalRecovered'],
                                test:  snapshot.data![index]['tests'],
                                active:  snapshot.data![index]['active']
                            )));
                    },
                          child: Column(
                            children: [
                              ListTile(
                                title: Text(snapshot.data![index]['country'].toString(),
                                  style:TextStyle(color: Colors.grey.shade400) ,),
                                subtitle: Text(snapshot.data![index]['cases'].toString(),
                                  style:TextStyle(color: Colors.grey.shade400) ,),
                                leading: Image(
                                  width: 50,
                                  height: 50,
                                  image: NetworkImage(
                                      snapshot.data![index]['countryInfo']['flag']
                                  ),),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }else if(name.toLowerCase().contains(searchController.text.toLowerCase())){
                    return Column(
                      children: [
                        InkWell(
                          onTap:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailScreen(
                                name: snapshot.data![index]['country'],
                                image:  snapshot.data![index]['countryInfo']['flag'],
                                totalDeaths:  snapshot.data![index]['deaths'],
                                totalcases:  snapshot.data![index]['cases'],
                                todayRecovered:  snapshot.data![index]['recovered'],
                                critical:  snapshot.data![index]['critical'],
                                totalRecovered: snapshot.data![index][' totalRecovered'],
                                test:  snapshot.data![index]['tests'],
                                active:  snapshot.data![index]['active']
                            )));

                    },
                          child: ListTile(
                            title: Text(snapshot.data![index]['country'].toString(),
                              style:TextStyle(color: Colors.grey.shade400) ,),
                            subtitle: Text(snapshot.data![index]['cases'].toString(),
                              style:TextStyle(color: Colors.grey.shade400) ,),
                            leading: Image(
                              width: 50,
                              height: 50,
                              image: NetworkImage(
                                  snapshot.data![index]['countryInfo']['flag']
                              ),),
                          ),
                        ),
                      ],
                    );
                  }else{
                    return Container(
                      color: Colors.lightBlue,
                    );
                  }
                });
          }

        }
    ),
     ),
          ]
        ),
      ),
    );
  }
}
