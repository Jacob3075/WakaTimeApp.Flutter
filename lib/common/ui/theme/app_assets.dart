abstract class AppAssets {
  static const icons = _Icons();
  static const images = _Images();
  static const animations = _Animation();
}

class _Icons {
  const _Icons();

  final time = "assets/icons/ic_time.svg";
  final code = "assets/icons/ic_code.svg";
  final codeFile = "assets/icons/ic_code_file.svg";
  final git = "assets/icons/ic_git.svg";
  final laptop = "assets/icons/ic_laptop.svg";
  final logo = "assets/icons/ic_logo.svg";
  final logoFull = "assets/icons/ic_logo_full.svg";
  final arrow = "assets/icons/ic_arrow.svg";
}

class _Images {
  const _Images();

  final launcherIcon = "assets/images/ic_launcher.png";
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
}
