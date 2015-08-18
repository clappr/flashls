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
      ExternalInterface.addCallback("playerSetKeyLoadMaxRetry", _setKeyLoadMaxRetry);
      ExternalInterface.addCallback("playerSetKeyLoadMaxRetryTimeout", _setKeyLoadMaxRetryTimeout);
      ExternalInterface.addCallback("playerSetFragmentLoadMaxRetry", _setFragmentLoadMaxRetry);
      ExternalInterface.addCallback("playerSetFragmentLoadMaxRetryTimeout", _setFragmentLoadMaxRetryTimeout);
      ExternalInterface.addCallback("playerSetFragmentLoadSkipAfterMaxRetry", _setFragmentLoadSkipAfterMaxRetry);
      ExternalInterface.addCallback("playerSetLogInfo", _setLogInfo);
      ExternalInterface.addCallback("playerSetSeekMode", _setSeekMode);
      ExternalInterface.addCallback("playerSetStartFromBitrate", _setStartFromBitrate);
      var playbackId : String = LoaderInfo(this.root.loaderInfo).parameters.playbackId;
      ExternalInterface.call("console.log", "FlasHLS Clappr (version: 0.4.2.1 - flashls: 0.4.2.1, id: " + playbackId + ")");
    }

    private function _setKeyLoadMaxRetry(keyLoadMaxRetry: int) : void {
      HLSSettings.keyLoadMaxRetry = keyLoadMaxRetry;
    }

    private function _setKeyLoadMaxRetryTimeout(keyLoadMaxRetryTimeout: Number) : void {
      HLSSettings.keyLoadMaxRetryTimeout = keyLoadMaxRetryTimeout;
    }

    private function _setFragmentLoadMaxRetry(fragmentLoadMaxRetry: int) : void {
      HLSSettings.fragmentLoadMaxRetry = fragmentLoadMaxRetry;
    }

    private function _setFragmentLoadMaxRetryTimeout(fragmentLoadMaxRetryTimeout: Number) : void {
      HLSSettings.fragmentLoadMaxRetryTimeout = fragmentLoadMaxRetryTimeout;
    }

    private function _setFragmentLoadSkipAfterMaxRetry(fragmentLoadSkipAfterMaxRetry: Boolean) : void {
      HLSSettings.fragmentLoadSkipAfterMaxRetry = fragmentLoadSkipAfterMaxRetry;
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
