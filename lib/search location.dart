import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ridesense/location.dart';


class search_location extends StatefulWidget {
  const search_location({super.key});

  @override
  State<search_location> createState() => _search_locationState();
}

class _search_locationState extends State<search_location> {
  static const kGoogleApiKey = 'AIzaSyB-leTfp-9_YXqntvj1Y8eRaA7ldCriOlY';
  var controller =Get.put(selected_loc());

  List<dynamic> options = [];
  List<Map<String,String>> aa = [];
  var searchcon = TextEditingController(text: "l");
  @override
  void initState() {
    // TODO: implement initState
    searchcon.addListener(() {
      onchange();
    });
    super.initState();
  }
  onchange(){
    placesugg(searchcon.text);
  }

  Future<void> getlatlong(String pi) async{
    String url =   "https://maps.googleapis.com/maps/api/place/details/json?placeid=$pi&key=$kGoogleApiKey";
    var response= await http.get(Uri.parse(url));
    var data = json.decode(response.body);
    print(data);
    controller.lat.value = data["result"]["geometry"]["location"]["lat"];
    controller.long.value = data["result"]["geometry"]["location"]["lng"];
  }
  void placesugg(String input) async{
    String apkey = "AIzaSyB-leTfp-9_YXqntvj1Y8eRaA7ldCriOlY";
    String url = "https://maps.googleapis.com/maps/api/place/autocomplete/json";
    String req = '$url?input=$input&key=$apkey';
    var response= await http.get(Uri.parse(req));
    var data = json.decode(response.body);
    print(data);
    options  = json.decode(response.body)['predictions'];



    setState(() {

    });


  }
  // Future<void> fetchPlaceDetails(String placeId) async {
  //   PlacesDetailsResponse detail = await places.getDetailsByPlaceId(placeId);
  //   if (detail.status == "OK") {
  //     double lat = detail.result.geometry!.location.lat;
  //     double lng = detail.result.geometry!.location.lng;
  //     String name = detail.result.name;
  //
  //     // Store the latitude, longitude, and name in the list 'aa'
  //     aa.add({
  //       "name": name,
  //       "lat": lat.toString(),
  //       "lng": lng.toString(),
  //     });
  //   print(aa);
  //     setState(() {});
  //   } else {
  //     print('Error fetching place details: ${detail.errorMessage}');
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 20,),
            Container(
              height: 44,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: Color(0xffFE954A))
              ),
              child: TextField(
                controller: searchcon,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search,size: 20,),
                  border: InputBorder.none,
                  hintText: "Search Your Location",
                  contentPadding: EdgeInsets.only(top: 5,right: 10),
                  hintStyle: TextStyle(fontWeight: FontWeight.w400, fontSize:20,color: Colors.black),

                ),
              ),
            ),
            Expanded(child: options.length>0?ListView.builder(
                itemCount: 5,
                itemBuilder: (context,index){
                  return  ListTile(
                    title: Text(options[index]['description']??''),
                    onTap: () async{
                        getlatlong(options[index]['place_id']??'').then((_){
                          Get.to(()=>location());
                        });

                      // fetchPlaceDetails(options[index]['place_id']);
                    },
                  );
                }):Text("Nothing Searched"))

          ],
        ),
      ),
    );
  }
}

class selected_loc extends GetxController{
  RxDouble lat=0.0.obs;
  RxDouble long=0.0.obs;
}