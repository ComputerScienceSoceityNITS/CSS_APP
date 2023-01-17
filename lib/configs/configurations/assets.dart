import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

class Assets {
  static late Image wing_pr;
  static late Image wing_cp;
  static late Image wing_dev;
  static late Image wing_executive;
  static late Image wing_lit;
  static late Image wing_ml;
  static late Image wing_design;

  static late Image bgAbacus;
  static late Image bgCode;
  static late Image bgFlower;
  static late Image bgMagazine;
  static late Image bgMusicController;
  static late Image cssLogoDark;
  static late Image cssLogoLight;
  static late Image cssLogo;
  static late Image eventTIMGAbacusIIT;
  static late Image eventTIMGAbacusTech;
  static late Image eventTIMGCClasses;
  static late Image eventTIMGCSGo;
  static late Image eventTIMGCSSHacks;
  static late Image eventTIMGEnigma;
  static late Image eventTIMGFarewell;
  static late Image eventTIMGFreshers;
  static late Image eventTIMGOrientation;
  static late Image framerAbhishekBharadwaz;
  static late Image framerSourabhShah;
  static late Image framerTeresaLouis;
  static late Image framerMajhiSir;
  static late Image galleryOrientation1;
  static late Image galleryOrientation2;
  static late Image galleryInspireRoom1;
  static late Image galleryInspireRoom2;
  static late Image galleryInspireRoom3;
  static late Image galleryInspireRoom4;
  static late Image algochemy;
  static late Image chasecloud9;
  static late Image fictiouscypher;
  static late Image holmesalone;
  static late Image iplauction;
  static late Image poloroid;
  static late Image rudimentalDeigesis;
  static late Image statmania;
  static late Image tecreview;
  static late Image webspyder;
  static late Image abacus;
  static late Image cclasses;
  static late Image csgo;
  static late Image csshacks;
  static late Image cssolympics;
  static late Image csswars;
  static late Image devworkshop;
  static late Image enigma;
  static late Image esperenza;
  static late Image farewell;
  static late Image freshers;
  static late Image mlclasses;
  static late Image orientation;
  static late Image speakersession;

  static late LottieBuilder lottieAccounting;
  static late LottieBuilder lottieLoader;
  static late LottieBuilder lottieNetworking;
  static late LottieBuilder lottieRainMan;
  static late LottieBuilder lottieSingSong;
  static late LottieBuilder lottieTeam;
  static late LottieBuilder lottieTechno;
  static late LottieBuilder lottieCssGlobeLight;
  static late LottieBuilder lottieCssGlobeDark;
  Assets() {
    wing_pr = Image.asset('assets/wing_images/pr.jpg');
    wing_cp = Image.asset('assets/wing_images/cp.png');
    wing_dev = Image.asset('assets/wing_images/dev.jpg');
    wing_executive = Image.asset('assets/wing_images/executive.jpg');
    wing_lit = Image.asset('assets/wing_images/lit.jpg');
    wing_ml = Image.asset('assets/wing_images/ml.jpg');
    wing_design = Image.asset('assets/wing_images/design.jpg');
    bgAbacus = Image.asset('assets/images/background/abacus.jpg');
    bgCode = Image.asset('assets/images/background/code.jpeg');
    bgFlower = Image.asset('assets/images/background/flower.jpeg');
    bgMagazine = Image.asset('assets/images/background/magazine.jpeg');
    bgMusicController =
        Image.asset('assets/images/background/music_controller.jpeg');
    cssLogoDark = Image.asset('assets/images/CSS_logo/CSS_logo_dark.png');
    cssLogoLight = Image.asset('assets/images/CSS_logo/CSS_logo_light.png');
    cssLogo = Image.asset('assets/images/CSS_logo/logo.png');
    eventTIMGAbacusIIT =
        Image.asset('assets/images/event_thumbnails/Abacus-Iit.png');
    eventTIMGAbacusTech =
        Image.asset('assets/images/event_thumbnails/Abacus-tech.png');
    eventTIMGCClasses =
        Image.asset('assets/images/event_thumbnails/C-classes.png');
    eventTIMGCSGo = Image.asset('assets/images/event_thumbnails/cs-go.jpg');
    eventTIMGCSSHacks =
        Image.asset('assets/images/event_thumbnails/CSS-hack.png');
    eventTIMGEnigma = Image.asset('assets/images/event_thumbnails/Enigma.png');
    eventTIMGFarewell =
        Image.asset('assets/images/event_thumbnails/farewell.jpg');
    eventTIMGFreshers =
        Image.asset('assets/images/event_thumbnails/freshers.jpg');
    eventTIMGOrientation =
        Image.asset('assets/images/event_thumbnails/orientation.jpg');
    framerAbhishekBharadwaz =
        Image.asset('assets/images/framers/Abhishek Bharadwaz.png');
    framerSourabhShah = Image.asset('assets/images/framers/Sourabh Shah.jpg');
    framerTeresaLouis = Image.asset('assets/images/framers/Teresa Louis.jpg');
    framerMajhiSir = Image.asset('assets/images/framers/MajhiSir.jpeg');
    galleryOrientation1 =
        Image.asset('assets/images/gallery/CSS Orientation1-min.jpg');
    galleryOrientation2 =
        Image.asset('assets/images/gallery/CSS Orientation2-min.jpg');
    galleryInspireRoom1 =
        Image.asset('assets/images/gallery/Inspire Room1-min.jpg');
    galleryInspireRoom2 =
        Image.asset('assets/images/gallery/Inspire Room2-min.jpg');
    galleryInspireRoom3 =
        Image.asset('assets/images/gallery/Inspire Room3-min.jpg');
    galleryInspireRoom4 =
        Image.asset('assets/images/gallery/Inspire Room4-min.jpg');
    lottieAccounting = Lottie.asset('assets/lottie/accounting.json');
    lottieLoader = Lottie.asset('assets/lottie/loader.json');
    lottieNetworking = Lottie.asset('assets/lottie/networking.json');
    lottieRainMan = Lottie.asset('assets/lottie/rainman.json');
    lottieSingSong = Lottie.asset('assets/lottie/sing_song.json');
    lottieTeam = Lottie.asset('assets/lottie/team.json');
    lottieTechno = Lottie.asset('assets/lottie/techno.json');
    lottieCssGlobeLight = Lottie.asset('assets/lottie/cssglobe_light.json');
    lottieCssGlobeDark = Lottie.asset('assets/lottie/cssglobe_dark.json');
    algochemy = Image.asset('assets/images/event_thumbnails/algochemy.jpeg');
    chasecloud9 =
        Image.asset('assets/images/event_thumbnails/chasecloud9.jpeg');
    fictiouscypher =
        Image.asset('assets/images/event_thumbnails/fictiouscypher.jpeg');
    holmesalone =
        Image.asset('assets/images/event_thumbnails/holmesalone.jpeg');
    iplauction = Image.asset('assets/images/event_thumbnails/iplauction.jpeg');
    poloroid = Image.asset('assets/images/event_thumbnails/poloroid.jpeg');
    rudimentalDeigesis =
        Image.asset('assets/images/event_thumbnails/rugimentaldiegesis.jpeg');
    statmania = Image.asset('assets/images/event_thumbnails/statmania.jpeg');
    tecreview = Image.asset('assets/images/event_thumbnails/tecreview.jpeg');
    webspyder = Image.asset('assets/images/event_thumbnails/webspyder.jpeg');
    abacus = Image.asset('assets/images/event_thumbnails/abacus.png');
    cclasses = Image.asset('assets/images/event_thumbnails/C-classes.png');
    csgo = Image.asset('assets/images/event_thumbnails/cs-go.jpg');
    csshacks = Image.asset('assets/images/event_thumbnails/CSS-hack.png');
    cssolympics =
        Image.asset('assets/images/event_thumbnails/cssolympics.jpeg');
    csswars = Image.asset('assets/images/event_thumbnails/csswars.jpeg');
    devworkshop = Image.asset('assets/images/event_thumbnails/devworkshop.png');
    enigma = Image.asset('assets/images/event_thumbnails/Enigma.png');
    esperenza = Image.asset('assets/images/event_thumbnails/esperenza.jpeg');
    farewell = Image.asset('assets/images/event_thumbnails/farewell.jpg');
    freshers = Image.asset('assets/images/event_thumbnails/freshers.jpg');
    mlclasses = Image.asset('assets/images/event_thumbnails/mlclasses.jpeg');
    orientation = Image.asset('assets/images/event_thumbnails/orientation.jpg');
    speakersession =
        Image.asset('assets/images/event_thumbnails/speakersession.jpeg');
  }
}
