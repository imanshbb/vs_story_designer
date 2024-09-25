// const fontFamilyList = [
//   'Alegreya',
//   'B612',
//   'TitilliumWeb',
//   'Varela',
//   'Vollkorn',
//   'Rakkas',
//   'ConcertOne',
//   'YatraOne',
//   'OldStandardTT',
//   'Neonderthaw',
//   'DancingScript',
//   'SedgwickAve',
//   'IndieFlower',
//   'Sacramento',
//   'PressStart2P',
//   'FrederickatheGreat',
//   'ReenieBeanie',
//   'BungeeShade',
//   'UnifrakturMaguntia'
// ];

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vs_story_designer/vs_story_designer.dart';

class AppFonts {
  // static const fontFamilyList = [
  //   'Alegreya',
  //   'B612',
  //   'TitilliumWeb',
  //   'Varela',
  //   'Vollkorn',
  //   'Rakkas',
  //   'ConcertOne',
  //   'YatraOne',
  //   'OldStandardTT',
  //   'Neonderthaw',
  //   'DancingScript',
  //   'SedgwickAve',
  //   'IndieFlower',
  //   'Sacramento',
  //   'PressStart2P',
  //   'FrederickatheGreat',
  //   'ReenieBeanie',
  //   'BungeeShade',
  //   'UnifrakturMaguntia'
  // ];

  static const fontFamilyListENUM = [
    FontType.openSans,
    FontType.laleZar,
    FontType.alibabaBlackWoff,
    FontType.iranKharazmi,
    FontType.iranBlack,
    FontType.iranNastaliqYasDL,
    FontType.iranSansXBold,
    FontType.iranSansXHeavy,
    FontType.iranSansXRegular,
    FontType.irCompset,
    FontType.vazirMatn,
    FontType.rubik,
    FontType.handJet,
    FontType.blaka,
    FontType.qahiri,
    FontType.marhey,
    FontType.gulzar,
    FontType.harmattan,
    FontType.kufam,
    FontType.vibes,
    FontType.notoSansArabic,
    FontType.blakaHollow,
    FontType.jomhuria,
    FontType.mada,
    FontType.balooBhaiJaan2,
    FontType.arefRuqaaInk,
    FontType.baskerville,
    FontType.cormorant,
    FontType.sourceSerif,
    FontType.sourceSans,
    FontType.raleway,
    FontType.ptSans,
    FontType.pacifico,
    FontType.breeSerif,
    FontType.bonbon,
    FontType.ropaSans,
    FontType.amiri,
    FontType.greatVibes,
    FontType.zillaSlab,
    FontType.nothingYouCouldDo,
    FontType.indieFlower,
    FontType.shadowsIntoLight,
    FontType.reenieBeanie,
    FontType.sueEllenFrancisco,
    FontType.kurale,
    FontType.dancingScript,
    FontType.amatic,
    FontType.architect,
    FontType.sahitya,
    FontType.garamond,
    FontType.chewy,
    FontType.comfortaa,
    FontType.reenie,
    FontType.satisfy,
    FontType.alfaSlab,
    FontType.josefinSans,
    FontType.kaushanScript,
    FontType.marckScript,
    FontType.volkhov,
    FontType.squadaOne,
    FontType.bahianiata,
    FontType.barriecito,
    FontType.mountainsOfChristmas,
    FontType.righteous,
    FontType.geostar,
    FontType.patuaOne,
    FontType.permanent,
    FontType.playfair,
    FontType.specialElite,
    FontType.courierPrime,
    FontType.roboto,
    FontType.karma,
    FontType.rougeScript,

    FontType.siliguri,
    FontType.meeraInimai,
    FontType.slabo27px,
    FontType.poiret,
    FontType.reemKufi,
    FontType.barlow,
    FontType.comicNeue,
    FontType.typewriter,
    FontType.abrilFatface,
    FontType.bebasneue,
    FontType.inknutAntiqua,
    FontType.lobster,
    FontType.khand,
    FontType.alegreya,
    FontType.montserrat,
    FontType.oswald,
    FontType.poppins,
    FontType.lato,
    /////////////////////////////////////
    FontType.b612,
    FontType.hindSiliguri,
    FontType.titilliumWeb,
    FontType.varela,
    FontType.vollkorn,
    FontType.rakkas,
    FontType.hindGuntur,
    FontType.concertOne,
    //
    FontType.yatraOne,
    FontType.notoSansGujarati,
    FontType.oldStandardTT,
    FontType.neonderthaw,
    FontType.bungeeShade,
    FontType.passionsConflict,
    FontType.sedgwickAve,
    FontType.notoNastaliqUrdu,
    FontType.sacramento,
    FontType.pressStart2P,
    FontType.cabinSketch,
    FontType.frederickatheGreat,
    //FontType.TiroDevanagariHindi,
    FontType.rubikVinyl,
    FontType.ewert,
    FontType.unifrakturMaguntia,
  ];

  static TextTheme getTextThemeENUM(FontType val) {
    switch (val) {
      case FontType.openSans:
        return GoogleFonts.openSansTextTheme();
      case FontType.laleZar:
        return GoogleFonts.lalezarTextTheme();
      case FontType.alibabaBlackWoff:
        return const TextTheme(
          bodyLarge: TextStyle(
            fontFamily: 'alibaba-black.woff2-41970917',
          ),
        );
      case FontType.iranKharazmi:
        return const TextTheme(
          bodyLarge: TextStyle(
            fontFamily: 'iran_Kharazmi',
          ),
        );
      case FontType.iranBlack:
        return const TextTheme(
          bodyLarge: TextStyle(
            fontFamily: 'IRANBlack',
          ),
        );
      case FontType.iranNastaliqYasDL:
        return const TextTheme(
          bodyLarge: TextStyle(
            fontFamily: 'IranNastaliq_YasDL.com',
          ),
        );
      case FontType.iranSansXBold:
        return const TextTheme(
          bodyLarge: TextStyle(
            fontFamily: 'IRANSansX-Bold',
          ),
        );
      case FontType.iranSansXHeavy:
        return const TextTheme(
          bodyLarge: TextStyle(
            fontFamily: 'IRANSansX-Heavy',
          ),
        );
      case FontType.iranSansXRegular:
        return const TextTheme(
          bodyLarge: TextStyle(
            fontFamily: 'IRANSansX-Regular',
          ),
        );
      case FontType.irCompset:
        return const TextTheme(
          bodyLarge: TextStyle(
            fontFamily: 'IRCompset',
          ),
        );
      case FontType.vazirMatn:
        return GoogleFonts.vazirmatnTextTheme();
      case FontType.rubik:
        return GoogleFonts.rubikTextTheme();
      case FontType.handJet:
        return GoogleFonts.handjetTextTheme();
      case FontType.blaka:
        return GoogleFonts.blakaTextTheme();
      case FontType.qahiri:
        return GoogleFonts.qahiriTextTheme();
      case FontType.marhey:
        return GoogleFonts.marheyTextTheme();
      case FontType.gulzar:
        return GoogleFonts.gulzarTextTheme();
      case FontType.harmattan:
        return GoogleFonts.harmattanTextTheme();
      case FontType.kufam:
        return GoogleFonts.kufamTextTheme();
      case FontType.vibes:
        return GoogleFonts.vibesTextTheme();
      case FontType.notoSansArabic:
        return GoogleFonts.notoSansArabicTextTheme();
      case FontType.blakaHollow:
        return GoogleFonts.blakaHollowTextTheme();
      case FontType.jomhuria:
        return GoogleFonts.jomhuriaTextTheme();
      case FontType.mada:
        return GoogleFonts.madaTextTheme();
      case FontType.balooBhaiJaan2:
        return GoogleFonts.balooBhaijaan2TextTheme();
      case FontType.arefRuqaaInk:
        return GoogleFonts.arefRuqaaInkTextTheme();
      case FontType.squadaOne:
        return GoogleFonts.squadaOneTextTheme();
      case FontType.bahianiata:
        return GoogleFonts.bahianitaTextTheme();
      case FontType.barriecito:
        return GoogleFonts.barriecitoTextTheme();
      case FontType.mountainsOfChristmas:
        return GoogleFonts.mountainsOfChristmasTextTheme();
      case FontType.righteous:
        return GoogleFonts.righteousTextTheme();
      case FontType.geostar:
        return GoogleFonts.geostarTextTheme();
      case FontType.patuaOne:
        return GoogleFonts.patuaOneTextTheme();
      case FontType.nothingYouCouldDo:
        return GoogleFonts.nothingYouCouldDoTextTheme();
      case FontType.indieFlower:
        return GoogleFonts.indieFlowerTextTheme();
      case FontType.shadowsIntoLight:
        return GoogleFonts.shadowsIntoLightTextTheme();
      case FontType.reenieBeanie:
        return GoogleFonts.reenieBeanieTextTheme();
      case FontType.sueEllenFrancisco:
        return GoogleFonts.sueEllenFranciscoTextTheme();
      case FontType.pacifico:
        return GoogleFonts.pacificoTextTheme();
      case FontType.breeSerif:
        return GoogleFonts.breeSerifTextTheme();
      case FontType.bonbon:
        return GoogleFonts.bonbonTextTheme();
      case FontType.ropaSans:
        return GoogleFonts.ropaSansTextTheme();
      case FontType.amiri:
        return GoogleFonts.amiriTextTheme();
      case FontType.greatVibes:
        return GoogleFonts.greatVibesTextTheme();
      case FontType.zillaSlab:
        return GoogleFonts.zillaSlabTextTheme();
      case FontType.sourceSans:
        return GoogleFonts.sourceSans3TextTheme();
      case FontType.raleway:
        return GoogleFonts.ralewayTextTheme();
      case FontType.ptSans:
        return GoogleFonts.ptSansTextTheme();
      case FontType.oswald:
        return GoogleFonts.oswaldTextTheme();

      case FontType.poppins:
        return GoogleFonts.poppinsTextTheme();

      case FontType.lato:
        return GoogleFonts.latoTextTheme();

      case FontType.montserrat:
        return GoogleFonts.montserratTextTheme();

      case FontType.alegreya:
        return GoogleFonts.alegreyaTextTheme();

      case FontType.khand:
        return GoogleFonts.khandTextTheme();

      case FontType.baskerville:
        return GoogleFonts.baskervvilleTextTheme();

      case FontType.cormorant:
        return GoogleFonts.cormorantTextTheme();

      case FontType.sourceSerif:
        return GoogleFonts.sourceSerif4TextTheme();

      case FontType.kurale:
        return GoogleFonts.kuraleTextTheme();

      case FontType.dancingScript:
        return GoogleFonts.dancingScriptTextTheme();

      case FontType.amatic:
        return GoogleFonts.amaticScTextTheme();

      case FontType.architect:
        return GoogleFonts.architectsDaughterTextTheme();

      case FontType.sahitya:
        return GoogleFonts.sahityaTextTheme();

      case FontType.garamond:
        return GoogleFonts.ebGaramondTextTheme();

      case FontType.chewy:
        return GoogleFonts.chewyTextTheme();

      case FontType.comfortaa:
        return GoogleFonts.comfortaaTextTheme();

      case FontType.reenie:
        return GoogleFonts.reenieBeanieTextTheme();

      case FontType.satisfy:
        return GoogleFonts.satisfyTextTheme();

      case FontType.alfaSlab:
        return GoogleFonts.alfaSlabOneTextTheme();

      case FontType.josefinSans:
        return GoogleFonts.josefinSansTextTheme();

      case FontType.kaushanScript:
        return GoogleFonts.kaushanScriptTextTheme();

      case FontType.marckScript:
        return GoogleFonts.marckScriptTextTheme();

      case FontType.volkhov:
        return GoogleFonts.volkhovTextTheme();

      case FontType.permanent:
        return GoogleFonts.permanentMarkerTextTheme();

      case FontType.playfair:
        return GoogleFonts.playfairDisplayTextTheme();

      case FontType.specialElite:
        return GoogleFonts.specialEliteTextTheme();

      case FontType.courierPrime:
        return GoogleFonts.courierPrimeTextTheme();

      case FontType.roboto:
        return GoogleFonts.robotoTextTheme();

      case FontType.karma:
        return GoogleFonts.karmaTextTheme();

      case FontType.rougeScript:
        return GoogleFonts.rougeScriptTextTheme();

      case FontType.siliguri:
        return GoogleFonts.hindSiliguriTextTheme();

      case FontType.meeraInimai:
        return GoogleFonts.meeraInimaiTextTheme();

      case FontType.slabo27px:
        return GoogleFonts.slabo27pxTextTheme();

      case FontType.poiret:
        return GoogleFonts.poiretOneTextTheme();

      case FontType.reemKufi:
        return GoogleFonts.reemKufiTextTheme();

      case FontType.barlow:
        return GoogleFonts.barlowCondensedTextTheme();

      case FontType.comicNeue:
        return GoogleFonts.comicNeueTextTheme();

      case FontType.abrilFatface:
        return GoogleFonts.abrilFatfaceTextTheme();

      case FontType.bebasneue:
        return GoogleFonts.bebasNeueTextTheme();

      case FontType.inknutAntiqua:
        return GoogleFonts.inknutAntiquaTextTheme();

      case FontType.lobster:
        return GoogleFonts.lobsterTextTheme();
      ///////////////////////////////////////////////////
      case FontType.b612:
        return GoogleFonts.b612TextTheme();
      case FontType.hindSiliguri:
        return GoogleFonts.hindSiliguriTextTheme();
      case FontType.titilliumWeb:
        return GoogleFonts.titilliumWebTextTheme();
      case FontType.varela:
        return GoogleFonts.varelaTextTheme();
      case FontType.vollkorn:
        return GoogleFonts.vollkornTextTheme();
      case FontType.rakkas:
        return GoogleFonts.rakkasTextTheme();
      case FontType.hindGuntur:
        return GoogleFonts.hindGunturTextTheme();
      case FontType.concertOne:
        return GoogleFonts.concertOneTextTheme();
      case FontType.yatraOne:
        return GoogleFonts.yatraOneTextTheme();
      case FontType.notoSansGujarati:
        return GoogleFonts.notoSansGujaratiTextTheme();
      case FontType.oldStandardTT:
        return GoogleFonts.oldStandardTtTextTheme();
      case FontType.neonderthaw:
        return GoogleFonts.neonderthawTextTheme();
      case FontType.bungeeShade:
        return GoogleFonts.bungeeShadeTextTheme();
      case FontType.passionsConflict:
        return GoogleFonts.passionsConflictTextTheme();
      case FontType.sedgwickAve:
        return GoogleFonts.sedgwickAveTextTheme();
      case FontType.notoNastaliqUrdu:
        return GoogleFonts.notoNastaliqUrduTextTheme();
      case FontType.sacramento:
        return GoogleFonts.sacramentoTextTheme();
      case FontType.pressStart2P:
        return GoogleFonts.pressStart2pTextTheme();
      case FontType.cabinSketch:
        return GoogleFonts.cabinSketchTextTheme();
      case FontType.frederickatheGreat:
        return GoogleFonts.frederickaTheGreatTextTheme();
      // case  FontType.TiroDevanagariHindi:return GoogleFonts.
      case FontType.rubikVinyl:
        return GoogleFonts.rubikTextTheme();
      case FontType.ewert:
        return GoogleFonts.ewertTextTheme();
      case FontType.unifrakturMaguntia:
        return GoogleFonts.unifrakturMaguntiaTextTheme();

////////////////////////////////////////////////
      default:
        return GoogleFonts.openSansTextTheme();
    }
  }
}

  // rubik,
  // handJet,
  // vazirMatn,
  // blaka,
  // quhiri,
  // marhey,
  // gulzar,
  // harmattan,
  // kufam,
  // vibes,
  // notoSansArabic,
  // blakaHollow,
  // jomhuria,
  // mada,
  // balooBhaiJaan2,
  // arefRuqaaInk



// const fontFamilyList = [
////////////////////////   ‘Roboto’,
//   'Alegreya',
//   'B612’,
//   'Hind Siliguri',
//   'TitilliumWeb',
//   'Varela',
//   'Vollkorn',
//   'Rakkas’,
//   'Hind Guntur',
//   'ConcertOne',
//   'YatraOne’,
//   'Noto SansGujarati',
//   'OldStandardTT',
//    'Neonderthaw',
//    'DancingScript’,
//    'BungeeShade’,
//    'PassionsConflict',
//    'SedgwickAve’,
//    'Noto NastaliqUrdu',
//    'IndieFlower',
//    'Sacramento',
//    'PressStart2P’,
//    'CabinSketch',
//    'FrederickatheGreat’,
//    'SpecialElite',
//    'TiroDevanagariHindi',
//    'RubikVinyl',
//    'Ewert',
//    'ReenieBeanie',
//   'UnifrakturMaguntia'
// ];