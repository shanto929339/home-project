
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();

}
var textControler=TextEditingController();
final controlar = PageController();
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Theme.of(context).colorScheme.inversePrimary,
       leading: IconButton(icon: const Icon(Icons.drag_handle_sharp),onPressed: (){},),
        centerTitle: true,
        title: const Text("E-Commerce",style: TextStyle(fontSize: 35,color: Colors.amber),),
        actions: [
         IconButton(onPressed: (){
           ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("I am Notification")));
         }, icon: const Icon(Icons.notifications)),
        ],

      ),
      bottomNavigationBar: BottomNavigationBar(

        selectedItemColor: Colors.blue,
        unselectedItemColor:Colors.white,
        items: const [

          BottomNavigationBarItem(icon: Icon(Icons.home,),label:"Home",backgroundColor:Colors.black,),

          BottomNavigationBarItem(icon: Icon(Icons.search,),label:"Seacrch",backgroundColor:Colors.black),

          BottomNavigationBarItem(icon: Icon(Icons.settings,),label:"Go",backgroundColor:Colors.black),

          BottomNavigationBarItem(icon: Icon(Icons.person_pin,),label:"Settings",backgroundColor:Colors.black),

        ],

      ),

      body: SingleChildScrollView(
        child:Padding(
          padding:const EdgeInsets.all(20),
          child: Center(
            child: Column(

              children: [
                const SizedBox(height:20 ,),


                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child:TextField(
                    showCursor: true,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                          borderSide: BorderSide.none
                      ),
                      prefixIcon:IconButton(
                          icon:const Icon(Icons.search),

                          onPressed: (){
                            textControler.clear();
                          }
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 50,),
                Container(

                  height: 150,
                  width: 300,
                  color: Colors.grey,
                  child: CarouselSlider(items: [1,2,3,4,5,6].map((e){
                    return Container(
                    margin: const EdgeInsets.symmetric(horizontal:0),
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                      ),
                      child: Center(
                        child: Text("Page$e"),
                      ),
                    );
                  }).toList(),options: CarouselOptions(height: 150),),
                ),
                const SizedBox(height: 10,),

                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Text("Brand",style:TextStyle(decoration: TextDecoration.underline, color: Colors.green,decorationColor: Colors.black
                    ),),
                    Text("See All" ,style:TextStyle(decoration: TextDecoration.underline, color: Colors.green, decorationColor: Colors.black),),
                  ],
                ),
                SingleChildScrollView(
                  child:
                  SizedBox(
                    height: 50,
                    child:ListView.builder(
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,

                        itemBuilder: (context,index)=> Container(
                          height: 100,
                          width: 100,
                          margin: const EdgeInsets.all(1),
                          color: Colors.green,
                          child: Center(
                            child: Text("Item$index"),
                          ),
                        )),
                  ),
                ),
              ]
            ),
          ),

        ),

      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


