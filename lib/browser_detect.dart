library browser_detect;

import 'dart:html';
import 'dart:math';

part "src/browser.dart";
part "src/browser_version.dart";
part "src/platform.dart";

/// [Browser] detected by browser_detect to allow you to add browser-specific code when necessary
final Browser browser = _determineBrowser();

/// [Platform] detected by browser_detect to allow you to add platform-specific code when necessary
final Platform platform = _determinePlatform();

Browser _determineBrowser() {
  return _browsers.firstWhere((browser) => browser._matchesCurrent,
      orElse: () => _unknownBrowser);
}

Iterable<Browser> _browsers = [_chrome, _safari, _opera, _ie, _firefox];

Browser _chrome = new Browser("Chrome",
    [() => _matchVendor("Google")],
    [() => new RegExp(r"Chrome/(.*)\s").firstMatch(window.navigator.appVersion)]);

Browser _safari = new Browser("Safari",
    [() => _matchVendor("Apple")],
    [() => new RegExp(r"Version/(.*)\s").firstMatch(window.navigator.appVersion)]);

Browser _opera = new Browser("Opera",
    [() => _matchVendor("Opera")],
    [() => new RegExp(r"OPR/(.*)\s").firstMatch(window.navigator.appVersion)]);

Browser _ie = new Browser("IE",
    [() => window.navigator.appName.contains("Microsoft"),
     () => window.navigator.appVersion.contains("Trident"),
     () => window.navigator.appVersion.contains("Edge")],
    [() => new RegExp(r"MSIE (.+?);").firstMatch(window.navigator.appVersion),
     () => new RegExp(r"rv:(.*)\)").firstMatch(window.navigator.appVersion),
     () => new RegExp(r"Edge/(.*)$").firstMatch(window.navigator.appVersion)]);

Browser _firefox = new Browser("Firefox",
    [() => window.navigator.userAgent.contains("Firefox")],
    [() => new RegExp(r"rv:(.*)\)").firstMatch(window.navigator.userAgent)]);

Browser _unknownBrowser = new _UnknownBrowser();

bool _matchVendor(String name) {
  var vendor = window.navigator.vendor;
  return vendor != null && vendor.contains(name);
}

Platform _determinePlatform() {
  return _platforms.firstWhere((platform) => platform._matchesCurrent,
      orElse: () => _unknownPlatform);
}

Iterable<Platform> _platforms = [_mac, _windows, _unix, _linux];

Platform _mac = new Platform('Mac', [() => _matchPlatform('Mac')]);

Platform _windows = new Platform('Win', [() => _matchPlatform('Win')]);

Platform _unix = new Platform('X11', [() => _matchPlatform('X11')]);

Platform _linux = new Platform('Linux', [() => _matchPlatform('Linux')]);

Platform _unknownPlatform = new _UnknownPlatform();

bool _matchPlatform(String name) {
  var appVersion = window.navigator.appVersion;
  return appVersion != null && appVersion.contains(name);
}
