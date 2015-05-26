package io.clappr {

  import org.mangui.chromeless.ChromelessPlayer;

  import flash.display.LoaderInfo;
  import flash.external.ExternalInterface;
  import flash.system.Security;

  public class Player extends ChromelessPlayer {

    public function Player() {
      super();
      Security.allowDomain("*");
      Security.allowInsecureDomain("*");
      var playbackId = LoaderInfo(this.root.loaderInfo).parameters.playbackId;
      ExternalInterface.call("console.log", "FlasHLS Clappr (version: 0.3.1 - flashls: 0.4.0.7, id: " + playbackId + ")");
    }
  }
}
