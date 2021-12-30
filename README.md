
## intro_screen_onboarding_flutter #
Flutter Intro Screen Onboarding is a flutter plugin that helps you make a cool intro for your app. Create intro has never been easier and faster


## Bear_log_in

<img align="right" src="https://i.imgur.com/hJU9Obt.gif" height="250">

An example built using [JCToon's](https://flare.rive.app/a/JuanCarlos/files/flare/teddy/preview) Flare File as a custom UI component. <br/>
Bear will follow the cursor as you type or move it around.

## Overview

The basic idea is to use the `ctrl_face` node in JCToon's file to change the direction of Teddy's gaze, as it's shown here in the gif to the right.

This is done by using [custom `FlareControls`](lib/bear_log_in_controller.dart), available in `/lib/pages/sign_in/bear_log_in_controller.dart`.

`FlareControls` is a custom implementation of the `FlareController` interface. <br/>The interface and can be found in [flare_actor.dart](../../lib/flare_actor.dart#L13-L17) and it has three methods:

```
abstract class FlareController {
  void initialize(FlutterActorArtboard artboard);
  void setViewTransform(Mat2D viewTransform);
  bool advance(FlutterActorArtboard artboard, double elapsed);
}
```

<img align="right" src="https://i.imgur.com/WdjurVo.gif" width="300" />

An instance of `BearLogInController` is passed to the `FlareActor` in [`/lib/pages/sign_in/sign_in_page.dart`](lib/main.dart#L77). This ties the controller to this widget, and allows it to use the three overrides to perform custom actions:

```
FlareActor(
    "assets/Teddy.flr",
    controller: _bearLogInController,
    [...]
)
```

In this example, `initialize()` will grab the reference to the `ctrl_face` node through the library call `artboard.getNode("ctrl_face")`.

Moreover, by [extending `FlareControls`](../../lib/flare_actor.dart#L462), `BearLogInController` can take advantage of a concrete implementation of this interface:
- `play(String animationName)`
- `advance(double elapsed)` - a base implementation which advances and mixes multiple animations


