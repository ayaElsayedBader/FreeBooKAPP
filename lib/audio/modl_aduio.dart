



import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';


 class ModelAduio extends StatefulWidget {
    ModelAduio({Key? key , required this.name , required  this.url}) : super(key: key);
   final String name;
   final String url;
   @override
   State<ModelAduio> createState() => _ModelAduioState();
 }

 class _ModelAduioState extends State<ModelAduio> {
   AudioPlayer audioPlayer = AudioPlayer();

   @override
   Widget build(BuildContext context) {
     return  ListTile(
       leading: Text(  widget.name),
       title: Row(


          children: [
            IconButton(onPressed: (){
              playNetworkSound(url: widget.url);
            }, icon:  Icon (Icons.play_circle_fill)),  IconButton(onPressed: (){
              audioPlayer.stop();
            }, icon:  Icon (Icons.stop)),
            IconButton(onPressed: (){
              local();
            }, icon:  Icon (Icons.stop)),
          ],
       ),
     );
   }



   playNetworkSound( { required String url }) {
    audioPlayer
         .play(

       UrlSource (url , ) ,  )
         .then(  (result) {
       if (audioPlayer.state == PlayerState.playing) {
         // تم تشغيل الصوت بنجاح.
       }
     }    );


   }


local() async{

  String url = 'رابط الملف الصوتي من الإنترنت';
  String localFilePath = 'مسار محلي لتخزين الملف الصوتي';
  await audioPlayer.setSource(UrlSource(url));
 // await audioPlayer.


}
}
