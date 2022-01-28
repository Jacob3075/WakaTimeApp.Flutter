import "dart:math";

abstract class AppAssets {
  static const icons = _Icons();
  static const images = _Images();
  static const animations = _Animation();
  static const illustrations = _Illustrations();
}

class _Icons {
  const _Icons();

  final time = "assets/icons/time.svg";
  final code = "assets/icons/code.svg";
  final codeFile = "assets/icons/code_file.svg";
  final git = "assets/icons/git.svg";
  final laptop = "assets/icons/laptop.svg";
  final logo = "assets/icons/logo.svg";
  final logoFull = "assets/icons/logo_full.svg";
  final arrow = "assets/icons/arrow.svg";
}

class _Images {
  const _Images();

  final launcherIcon = "assets/images/ic_launcher.png";
}

class _Illustrations {
  const _Illustrations();

  final astronaut01 = "assets/illustrations/astronaut_01.svg";
  final bookReading = "assets/illustrations/book_reading.svg";
  final emptyBox1 = "assets/illustrations/empty_box_1.svg";
  final emptyBox2 = "assets/illustrations/empty_box_2.svg";
  final emptyBox3 = "assets/illustrations/empty_box_3.svg";
  final closedBox = "assets/illustrations/closed_box.svg";
  final emptyEnvelop = "assets/illustrations/empty_envelop.svg";
  final noConnection1 = "assets/illustrations/no_connection_1.svg";
  final noConnection2 = "assets/illustrations/no_connection_2.svg";
  final noConnection3 = "assets/illustrations/no_connection_3.svg";
  final noConnection4 = "assets/illustrations/no_connection_4.svg";
  final search = "assets/illustrations/search.svg";
  final intoTheNight = "assets/illustrations/into_the_night.svg";
  final loading = "assets/illustrations/loading.svg";
  final meditation = "assets/illustrations/meditation.svg";
  final noData = "assets/illustrations/no_data.svg";
  final notFound = "assets/illustrations/not_found.svg";

  List<String> get emptyIllustrations => [
        astronaut01,
        bookReading,
        emptyBox1,
        emptyBox2,
        emptyBox3,
        emptyEnvelop,
        noData,
        notFound,
        meditation, // FIXME: CHANGE COLOR
      ];

  String get randomEmptyIllustration =>
      emptyIllustrations[Random().nextInt(emptyIllustrations.length)];
}

class _Animation {
  const _Animation();

  final blueLoading = "assets/animations/blue_loading.json";
  final dotsAndLinesLoadingPlexus = "assets/animations/dots_and_lines_loading_plexus.json";
  final emptyBox1 = "assets/animations/empty_box_1.json";
  final emptyBox2 = "assets/animations/empty_box_2.json";
  final empty = "assets/animations/empty.json";
  final error1 = "assets/animations/error_1.json";
  final error2 = "assets/animations/error_2.json";
  final errorAnimation = "assets/animations/error_animation.json";
  final expandingUiElements = "assets/animations/expanding_ui_elements.json";
  final internet = "assets/animations/internet.json";
  final jumpingBoxOnRopeLoadingAnimation =
      "assets/animations/jumping_box_on_rope_loading_animation.json";
  final liquidBlobLoaderGreen = "assets/animations/liquid_blob_loader_green.json";
  final loading1 = "assets/animations/loading_1.json";
  final loading2 = "assets/animations/loading_2.json";
  final loadingAnimation = "assets/animations/loading_animation.json";
  final loadingBlob = "assets/animations/loading_blob.json";
  final loadingPaperPlane1 = "assets/animations/loading_paper_plane_1.json";
  final loopLoadingAnimation = "assets/animations/loop_loading_animation.json";
  final noMobileInternet = "assets/animations/no_mobile_internet.json";
  final worldLocations = "assets/animations/world_locations.json";

  List<String> get otherAnimations => [
        emptyBox1,
        empty,
        internet,
        noMobileInternet,
        // emptyBox2,
      ];

  List<String> get errorAnimations => [
        error1,
        error2,
        errorAnimation,
      ];

  List<String> get loadingAnimations => [
        loadingBlob,
        loadingPaperPlane1,
        liquidBlobLoaderGreen,
        blueLoading,
        loading1,
        loopLoadingAnimation, //FIXME: CHANGE COLOR
        jumpingBoxOnRopeLoadingAnimation, //FIXME: CHANGE COLOR
        // dotsAndLinesLoadingPlexus,
        // loadingAnimation,
        // expandingUiElements,
        // worldLocations,
        // loading2,
      ];

  String get randomLoadingAnimation =>
      loadingAnimations[Random().nextInt(loadingAnimations.length)];
}
