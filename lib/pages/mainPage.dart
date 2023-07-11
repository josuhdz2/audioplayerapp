import 'package:audio_application/pages/ambientPage.dart';
import 'package:audio_application/pages/soundsPage.dart';
import 'package:flutter/material.dart';
import 'package:wear/wear.dart';
class MainPage extends StatelessWidget
{
  final screenHeight;
  final screenWidth;
  const MainPage(this.screenHeight, this.screenWidth,{ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context)
  {
    return AmbientMode
    (
      builder: (context, mode, child)=>mode==WearMode.active?UserPage(screenHeight, screenWidth):const AmbientPage()
    );
    /*return Scaffold
    (
      body: SizedBox.expand
      (
        child: Center
        (
          child: Column
          (
            mainAxisAlignment: MainAxisAlignment.center,
            children:
            const [
              Text('Pagina principal')
            ],
          ),
        ),
      ),
    );*/
  }
}
class UserPage extends StatelessWidget
{
  final screenHeight;
  final screenWidth;
  const UserPage(this.screenHeight, this.screenWidth, { Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      body: Center
      (
        child: SizedBox
        (
          height: screenHeight,
          width: screenWidth,
          child: Column
          (
            mainAxisAlignment: MainAxisAlignment.center,
            children:
            [
              InkWell
              (
                child: Row
                (
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                  const [
                    Icon(Icons.arrow_back),
                    //Image.asset('assets/outline_arrow.png', scale: 1.8,),
                    Text
                    (
                      'Regresar',
                      style: TextStyle
                      (
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
                onTap: ()
                {
                  Navigator.of(context).pop();
                },
              ),
              const SizedBox
              (
                height: 20
              ),
              const Text('Relax Application'),
              const FlutterLogo(size: 60),
              ElevatedButton
              (
                onPressed: ()
                {
                  Navigator.of(context).push(MaterialPageRoute
                  (
                    builder:(context)
                    {
                      return SoundsPage(screenHeight, screenWidth);
                    }
                  ));
                },
                child:const Text('Iniciar audios')
              )
            ],
          ),
        ),
      )
    );
  }
}