package io.clappr {

  import org.mangui.chromeless.ChromelessPlayer;

  import flash.display.LoaderInfo;
  import flash.external.ExternalInterface;
  import flash.system.Security;
  import org.mangui.hls.HLSSettings;
  import org.mangui.hls.utils.Log;

  public class Player extends ChromelessPlayer {

    private static const CLAPPR_VERSION : String = "0.4.3";
    private static const FLASHLS_VERSION : String = "0.4.2.1";

    public function Player() {
      super();
      Security.allowDomain("*");
      Security.allowInsecureDomain("*");
    }

    override protected function _setupExternalCallers() : void {
      super._setupExternalCallers();
      ExternalInterface.addCallback("playerSetKeyLoadMaxRetry", _setKeyLoadMaxRetry);
      ExternalInterface.addCallback("playerSetKeyLoadMaxRetryTimeout", _setKeyLoadMaxRetryTimeout);
      ExternalInterface.addCallback("playerSetFragmentLoadMaxRetry", _setFragmentLoadMaxRetry);
      ExternalInterface.addCallback("playerSetFragmentLoadMaxRetryTimeout", _setFragmentLoadMaxRetryTimeout);
      ExternalInterface.addCallback("playerSetFragmentLoadSkipAfterMaxRetry", _setFragmentLoadSkipAfterMaxRetry);
      ExternalInterface.addCallback("playerSetLogInfo", _setLogInfo);
      ExternalInterface.addCallback("playerSetSeekMode", _setSeekMode);
      ExternalInterface.addCallback("playerSetStartFromBitrate", _setStartFromBitrate);
      ExternalInterface.addCallback("playerSetFpsDroppedMonitoringPeriod", _setFpsDroppedMonitoringPeriod);
      ExternalInterface.addCallback("playerSetFpsDroppedMonitoringThreshold", _setFpsDroppedMonitoringThreshold);
      ExternalInterface.addCallback("playerSetCapLevelonFPSDrop", _setCapLevelonFPSDrop);
      ExternalInterface.addCallback("playerSetSmoothAutoSwitchonFPSDrop", _setSmoothAutoSwitchonFPSDrop);
    }

    override protected function _setupExternalGetters() : void {
      super._setupExternalGetters();
      ExternalInterface.addCallback("getVersion", _getVersion);
      ExternalInterface.addCallback("getClapprVersion", _getClapprVersion);
      ExternalInterface.addCallback("getFlashlsVersion", _getFlashlsVersion);
    }

    override protected function _load(url : String) : void {
      Log.info(_getVersion());
      super._load(url);
    }

    protected function _getVersion() : String {
      var playbackId : String = LoaderInfo(this.root.loaderInfo).parameters.playbackId;
      return "FlasHLS Clappr (version: " + _getClapprVersion() + " - flashls: "+ _getFlashlsVersion() + ", id: " + playbackId + ")";
    }

    protected function _getClapprVersion() : String {
      return CLAPPR_VERSION;
    }

    protected function _getFlashlsVersion() : String {
      return FLASHLS_VERSION;
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

    private function _setFpsDroppedMonitoringPeriod(fpsDroppedMonitoringPeriod: int) : void {
      HLSSettings.fpsDroppedMonitoringPeriod = fpsDroppedMonitoringPeriod;
    }

    private function _setFpsDroppedMonitoringThreshold(fpsDroppedMonitoringThreshold: Number) : void {
      HLSSettings.fpsDroppedMonitoringThreshold = fpsDroppedMonitoringThreshold;
    }

    private function _setCapLevelonFPSDrop(capLevelonFPSDrop: Boolean) : void {
      HLSSettings.capLevelonFPSDrop = capLevelonFPSDrop;
    }

    private function _setSmoothAutoSwitchonFPSDrop(smoothAutoSwitchonFPSDrop: Boolean) : void {
      HLSSettings.smoothAutoSwitchonFPSDrop = smoothAutoSwitchonFPSDrop;
    }
  }
}
