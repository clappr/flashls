package io.clappr {

  import org.mangui.chromeless.ChromelessPlayer;

  import flash.display.LoaderInfo;
  import flash.external.ExternalInterface;
  import flash.system.Security;
  import org.mangui.hls.HLSSettings;
  import org.mangui.hls.utils.Log;

  public class Player extends ChromelessPlayer {

    private static const CLAPPR_VERSION : String = "0.4.9";
    private static const FLASHLS_VERSION : String = "0.4.4.16";

    public function Player() {
      super();
      Security.allowDomain("*");
      Security.allowInsecureDomain("*");
    }

    override protected function _setupExternalCallers() : void {
      super._setupExternalCallers();
      ExternalInterface.addCallback("playerSetAutoStartLoad", _setAutoStartLoad);
      ExternalInterface.addCallback("playerSetCapLevelToStage", _setCapLevelToStage);
      ExternalInterface.addCallback("playerSetMaxLevelCappingMode", _setMaxLevelCappingMode);
      ExternalInterface.addCallback("playerSetMinBufferLength", _setMinBufferLength);
      ExternalInterface.addCallback("playerSetMinBufferLengthCapping", _setMinBufferLengthCapping);
      ExternalInterface.addCallback("playerSetMaxBufferLength", _setMaxBufferLength);
      ExternalInterface.addCallback("playerSetMaxBackBufferLength", _setMaxBackBufferLength);
      ExternalInterface.addCallback("playerSetLowBufferLength", _setLowBufferLength);
      ExternalInterface.addCallback("playerSetMediaTimePeriod", _setMediaTimePeriod);
      ExternalInterface.addCallback("playerSetFpsDroppedMonitoringPeriod", _setFpsDroppedMonitoringPeriod);
      ExternalInterface.addCallback("playerSetFpsDroppedMonitoringThreshold", _setFpsDroppedMonitoringThreshold);
      ExternalInterface.addCallback("playerSetCapLevelonFPSDrop", _setCapLevelonFPSDrop);
      ExternalInterface.addCallback("playerSetSmoothAutoSwitchonFPSDrop", _setSmoothAutoSwitchonFPSDrop);
      ExternalInterface.addCallback("playerSetSwitchDownOnLevelError", _setSwitchDownOnLevelError);
      ExternalInterface.addCallback("playerSetSeekMode", _setSeekMode);
      ExternalInterface.addCallback("playerSetKeyLoadMaxRetry", _setKeyLoadMaxRetry);
      ExternalInterface.addCallback("playerSetKeyLoadMaxRetryTimeout", _setKeyLoadMaxRetryTimeout);
      ExternalInterface.addCallback("playerSetFragmentLoadMaxRetry", _setFragmentLoadMaxRetry);
      ExternalInterface.addCallback("playerSetFragmentLoadMaxRetryTimeout", _setFragmentLoadMaxRetryTimeout);
      ExternalInterface.addCallback("playerSetFragmentLoadSkipAfterMaxRetry", _setFragmentLoadSkipAfterMaxRetry);
      ExternalInterface.addCallback("playerSetFlushLiveURLCache", _setFlushLiveURLCache);
      ExternalInterface.addCallback("playerSetInitialLiveManifestSize", _setInitialLiveManifestSize);
      ExternalInterface.addCallback("playerSetManifestLoadMaxRetry", _setManifestLoadMaxRetry);
      ExternalInterface.addCallback("playerSetManifestLoadMaxRetryTimeout", _setManifestLoadMaxRetryTimeout);
      ExternalInterface.addCallback("playerSetManifestRedundantLoadmaxRetry", _setManifestRedundantLoadmaxRetry);
      ExternalInterface.addCallback("playerSetStartFromBitrate", _setStartFromBitrate);
      ExternalInterface.addCallback("playerSetStartFromLevel", _setStartFromLevel);
      ExternalInterface.addCallback("playerSetAutoStartMaxDuration", _setAutoStartMaxDuration);
      ExternalInterface.addCallback("playerSetSeekFromLevel", _setSeekFromLevel);
      ExternalInterface.addCallback("playerSetUseHardwareVideoDecoder", _setuseHardwareVideoDecoder);
      ExternalInterface.addCallback("playerSetLogInfo", _setLogInfo);
      ExternalInterface.addCallback("playerSetLogDebug", _setlogDebug);
      ExternalInterface.addCallback("playerSetLogDebug2", _setlogDebug2);
      ExternalInterface.addCallback("playerSetLogWarn", _setLogWarn);
      ExternalInterface.addCallback("playerSetLogError", _setLogError);
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

    private function _setAutoStartLoad(autoStartLoad: Boolean) : void {
      HLSSettings.autoStartLoad = autoStartLoad;
    }

    private function _setCapLevelToStage(capLevelToStage: Boolean) : void {
      HLSSettings.capLevelToStage = capLevelToStage;
    }

    private function _setMaxLevelCappingMode(maxLevelCappingMode: String) : void {
      HLSSettings.maxLevelCappingMode = maxLevelCappingMode;
    }

    private function _setMinBufferLength(minBufferLength: Number) : void {
      HLSSettings.minBufferLength = minBufferLength;
    }

    private function _setMinBufferLengthCapping(minBufferLengthCapping: Number) : void {
      HLSSettings.minBufferLengthCapping = minBufferLengthCapping;
    }

    private function _setMaxBufferLength(maxBufferLength: Number) : void {
      HLSSettings.maxBufferLength = maxBufferLength;
    }

    private function _setMaxBackBufferLength(maxBackBufferLength: Number) : void {
      HLSSettings.maxBackBufferLength = maxBackBufferLength;
    }

    private function _setLowBufferLength(lowBufferLength: Number) : void {
      HLSSettings.lowBufferLength = lowBufferLength;
    }

    private function _setMediaTimePeriod(mediaTimePeriod: int) : void {
      HLSSettings.mediaTimePeriod = mediaTimePeriod;
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

    private function _setSwitchDownOnLevelError(switchDownOnLevelError: Boolean) : void {
      HLSSettings.switchDownOnLevelError = switchDownOnLevelError;
    }

    private function _setSeekMode(seekMode: String) : void {
      HLSSettings.seekMode = seekMode;
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

    private function _setFlushLiveURLCache(flushLiveURLCache: Boolean) : void {
      HLSSettings.flushLiveURLCache = flushLiveURLCache;
    }

    private function _setInitialLiveManifestSize(initialLiveManifestSize: uint) : void {
      HLSSettings.initialLiveManifestSize = initialLiveManifestSize;
    }

    private function _setManifestLoadMaxRetry(manifestLoadMaxRetry: int) : void {
      HLSSettings.manifestLoadMaxRetry = manifestLoadMaxRetry;
    }

    private function _setManifestLoadMaxRetryTimeout(manifestLoadMaxRetryTimeout: Number) : void {
      HLSSettings.manifestLoadMaxRetryTimeout = manifestLoadMaxRetryTimeout;
    }

    private function _setManifestRedundantLoadmaxRetry(manifestRedundantLoadmaxRetry: int) : void {
      HLSSettings.manifestRedundantLoadmaxRetry = manifestRedundantLoadmaxRetry;
    }

    private function _setStartFromBitrate(startFromBitrate: Number) : void {
      HLSSettings.startFromBitrate = startFromBitrate;
    }

    private function _setStartFromLevel(startFromLevel: Number) : void {
      HLSSettings.startFromLevel = startFromLevel;
    }

    private function _setAutoStartMaxDuration(autoStartMaxDuration: Number) : void {
      HLSSettings.autoStartMaxDuration = autoStartMaxDuration;
    }

    private function _setSeekFromLevel(seekFromLevel: Number) : void {
      HLSSettings.seekFromLevel = seekFromLevel;
    }

    private function _setuseHardwareVideoDecoder(useHardwareVideoDecoder: Boolean) : void {
      HLSSettings.useHardwareVideoDecoder = useHardwareVideoDecoder;
    }

    private function _setLogInfo(logInfo: Boolean) : void {
      HLSSettings.logInfo = logInfo;
    }

    private function _setlogDebug(logDebug: Boolean) : void {
      HLSSettings.logDebug = logDebug;
    }

    private function _setlogDebug2(logDebug2: Boolean) : void {
      HLSSettings.logDebug2 = logDebug2;
    }

    private function _setLogWarn(logWarn: Boolean) : void {
      HLSSettings.logWarn = logWarn;
    }

    private function _setLogError(logError: Boolean) : void {
      HLSSettings.logError = logError;
    }
  }
}
