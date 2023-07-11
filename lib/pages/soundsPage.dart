import 'package:audio_application/pages/ambientPage.dart';
import 'package:audio_application/pages/soundPlayerPage.dart';
import 'package:flutter/material.dart';
import 'package:wear/wear.dart';
const img='assets/images/';
List<String> screens=['rain', 'forest', 'sunset', 'ocean'];
class SoundsPage extends StatelessWidget
{
  final screenheight;
  final screenwidth;
  const SoundsPage(screenHeight, screenWidth, { Key? key, this.screenheight, this.screenwidth}) : super(key: key);
  @override
  Widget build(BuildContext context)
  {
    return AmbientMode
    (
      builder: (context, mode, child)=>mode==WearMode.active?const HomeRoute():const AmbientPage()
    );
  }
}
class HomeRoute extends StatelessWidget
{
  const HomeRoute({ Key? key }) : super(key: key);
  soundButton(sound, context)
  {
    return GestureDetector
    (
      onTap: ()
      {
        Navigator.push
        (
          context, MaterialPageRoute
          (
            builder:(context)=>PlayRoute(sound: sound)
          )
        );
      },
      child: Column
      (
        children:
        [
          Padding
          (
            padding: const EdgeInsets.only
            (
              top: 8.0
            ),
            child: Image.asset
            (
              'assets/icons/$sound.png',
              scale: 1.2,
            ),
          ),
          Text
          (
            sound.toUpperCase(),
            style: const TextStyle
            (
              color: Colors.white,
              fontSize: 16,
              letterSpacing: 3.0
            ),
          )
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context)
  {
    var width=MediaQuery.of(context).size.width;
    return Scaffold
    (
      body: Stack
      (
        children:
        [
          Positioned
          (
            top: 0,
            left: 0,
            child: Image.asset('${img}bkgnd_2.jpg', fit: BoxFit.fill)
          ),
          Padding
          (
            padding: const EdgeInsets.all(8.0),
            child: InkWell
            (
              child: Row
              (
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                const [
                  Icon(Icons.arrow_back),
                  //Image.asset('assets/outline_arrow.png', scale: 1.8),
                  SizedBox(width: 5),
                  Text
                  (
                    'Regresar',
                    style: TextStyle
                    (
                      fontSize: 20,
                      fontWeight: FontWeight.w300
                    ),
                  )
                ],
              ),
              onTap: ()
              {
                Navigator.of(context).pop();
              },
            ),
          ),
          Positioned
          (
            top: 40,
            width:width,
            child: const Padding
            (
              padding: EdgeInsets.only(top: 8.0),
              child: Center
              (
                child: Text
                (
                  'Relax',
                  style: TextStyle
                  (
                    color: Colors.white,
                    fontSize: 20,
                    letterSpacing: 13.0,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
            )
          ),
          Padding
          (
            padding: const EdgeInsets.only(top: 70.0),
            child: Center
            (
              child: SingleChildScrollView
              (
                physics: const BouncingScrollPhysics(),
                child: Column
                (
                  children:
                  [
                    soundButton('rain', context),
                    soundButton('forest', context),
                    soundButton('sunset', context),
                    soundButton('ocean', context),
                    const SizedBox(width: 40)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}