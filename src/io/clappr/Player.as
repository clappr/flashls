package io.clappr {

  import org.mangui.chromeless.ChromelessPlayer;

  import flash.display.LoaderInfo;
  import flash.external.ExternalInterface;
  import flash.system.Security;
  import org.mangui.hls.HLSSettings;

  public class Player extends ChromelessPlayer {

    public function Player() {
      super();
      Security.allowDomain("*");
      Security.allowInsecureDomain("*");
      ExternalInterface.addCallback("playerSetLogInfo", _setLogInfo);
      ExternalInterface.addCallback("playerSetSeekMode", _setSeekMode);
      ExternalInterface.addCallback("playerSetStartFromBitrate", _setStartFromBitrate);
      var playbackId : String = LoaderInfo(this.root.loaderInfo).parameters.playbackId;
      ExternalInterface.call("console.log", "FlasHLS Clappr (version: 0.4.2 - flashls: 0.4.2.1, id: " + playbackId + ")");
    }

    private function _setLogInfo(logInfo: Boolean) : void {
      HLSSettings.logInfo = logInfo;
    }

    private function _setSeekMode(seekMode: String) : void {
      HLSSettings.seekMode = seekMode;
    }

    private function _setStartFromBitrate(startFromBitrate: Number) : void {
      HLSSettings.startFromBitrate = startFromBitrate;
    }
  }
}
