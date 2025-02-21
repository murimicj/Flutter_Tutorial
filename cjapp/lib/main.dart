import 'package:flutter/material.dart';
final Color mainColor = Color(0xFFFF5656);

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MountsApp()//SplashPage()
    )
  );
}

class SplashPage extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    Future.delayed(const Duration(seconds: 2),(){
      Navigator.of(context)
      .push (MaterialPageRoute(builder: (context)=>MountsApp()));
    });
    return Container(
      color: mainColor,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Icon(Icons.terrain, color: Colors.white, size: 90),
          ),
          // Align(
          //   alignment:Alignment.bottomCenter,
          //   child:CircularProgressIndicator(
          //      valueColor: AlwaysStoppedAnimation<Color>(Colors.white)
          //     )
          //   ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 80),
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              )
            )
          )
          
        ],
      ),
    );
  }
}

class MountsApp extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Center(
          child: Icon(
            Icons.terrain,
            color: mainColor,
            size: 40
          )
        ),
        actions:[
          SizedBox(width: 40, height: 40)
        ],
        iconTheme: IconThemeData(color:mainColor)
      ),
      drawer: Drawer(
        child: Container(
          padding: EdgeInsets.all(30),
          color: mainColor,
          alignment: Alignment.bottomLeft,
          child: Icon(Icons.terrain, color: Colors.white, size:80)
        )
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
       children: [
        AppHeader(),
        AppSearch(),
        Expanded(
          child: AppMountListView()
          ),
       ],
      )
    );
  }

}

//-----WIDGETS-----
class AppHeader extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Container(
      padding: EdgeInsets.only(left: 30, top: 30, right: 30),
      child: Row(
        children:[
          //here all widgetsClipOval(
           ClipOval(
            
            child: Image.network(
                 'https://avatars.githubusercontent.com/u/5081804?v=4', 
               width: 50,
               height: 50,
               fit: BoxFit.cover
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // add these Text widgets inside the **children** property of the Column widget:

                Text('Hello, Charles',
                   style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)    
                    ),
                    Text('Good morning',
                       style: TextStyle(color: mainColor, fontSize: 12)    
                  )
            ],
          )
        ],
      )
    );
  }
}


class AppSearch extends StatelessWidget{
@override
  
  Widget build(BuildContext context){
    return Container(
      padding: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Discover',
            style:TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 25
            )
            ),
          SizedBox(height: 20),
          Row(
            children: [],)
        ],
        )
      
    );
  }

}

// app mount list view widget
class AppMountListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: mountItems.length,
        itemBuilder:(context, index) {
          MountModel currentMount = mountItems[index];

          return Container(
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(10),
            width: 150,
            decoration: BoxDecoration(
              
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage(currentMount.path ),
                fit: BoxFit.cover
                )
            )
          );
        }
        )
    );
  }
}
//----MODELS----

class MountModel {
  String path;
  String name;
  String location;
  String description;
  MountModel({
    this.path = '',
    this.name = '',
    this.location = '',
    this.description = ''
  });
}
final List<MountModel> mountItems = [
  MountModel(
      path:
          'https://sa.kapamilya.com/absnews/abscbnnews/media/2021/afp/01/17/20210116-mt-semeru-indonesia-ash-afp-s.jpg',
      name: 'Mount Semeru',
      description:
          'Semeru, or Mount Semeru, is an active volcano in East Java, Indonesia. It is located in the subduction zone, where the Indo-Australia plate subducts under the Eurasia plate. It is the highest mountain on the island of Java.',
      location: 'East Java'),
  MountModel(
      path:
          'https://media-cdn.tripadvisor.com/media/photo-s/04/a5/6f/ce/dsc-5622jpg.jpg',
      name: 'Mount Merbaru',
      description:
          'Mount Merbabu is a dormant stratovolcano in Central Java province on the Indonesian island of Java. The name Merbabu could be loosely translated as Mountain of Ash from the Javanese combined words; Meru means mountain and awu or abu means ash.',
      location: 'Central Java'),
  MountModel(
      path: 'https://cdn.dlmag.com/wp-content/uploads/2019/07/maunaloa1.jpg',
      name: 'Mauna Loa',
      description:
          'Mauna Loa is one of five volcanoes that form the Island of Hawaii in the U.S. state of Hawai in the Pacific Ocean. The largest subaerial volcano in both mass and volume, Mauna Loa has historically been considered the largest volcano on Earth, dwarfed only by Tamu Massif.',
      location: 'Hawaii'),
  MountModel(
      path:
          'https://cdn.images.express.co.uk/img/dynamic/78/590x/mount-vesuvius-1100807.jpg',
      name: 'Mount Vesuvius',
      description:
          'Mount Vesuvius is a somma-stratovolcano located on the Gulf of Naples in Campania, Italy, about 9 km east of Naples and a short distance from the shore. It is one of several volcanoes which form the Campanian volcanic arc.',
      location: 'Italy'),
  MountModel(
      path:
          'https://upload.wikimedia.org/wikipedia/commons/0/04/PopoAmeca2zoom.jpg',
      name: 'Mount Popocatépetl',
      description:
          'Popocatépetl is an active stratovolcano located in the states of Puebla, Morelos, and Mexico in central Mexico. It lies in the eastern half of the Trans-Mexican volcanic belt. At 5,426 m it is the second highest peak in Mexico, after Citlaltépetl at 5,636 m.',
      location: 'Mexico')
];

