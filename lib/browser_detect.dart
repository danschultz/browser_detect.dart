library browser_detect;

import 'dart:html';
import 'dart:math';

part "src/browser.dart";
part "src/browesr_version.dart";

Browser _browser;
Browser get browser {
  if (_browser == null) {
    _browser = _browsers.firstWhere((browser) => browser._matcher(),
        orElse: () => new _UnknownBrowser());
  }
  return _browser;
}

Iterable<Browser> _browsers = [_chrome, _safari, _opera, _ie, _firefox];

Browser _chrome = new Browser("Chrome",
    () => _matchVendor("Google"),
    () => new RegExp(r"Chrome/(.*)\s").firstMatch(window.navigator.appVersion).group(1));

Browser _safari = new Browser("Safari",
    () => _matchVendor("Apple"),
    () => new RegExp(r"Version/(.*)\s").firstMatch(window.navigator.appVersion).group(1));

Browser _opera = new Browser("Opera",
    () => _matchVendor("Opera"),
    () => new RegExp(r"OPR/(.*)\s").firstMatch(window.navigator.appVersion).group(1));

Browser _ie = new Browser("IE",
    () => window.navigator.appName.contains("Microsoft"),
    () => new RegExp(r"MSIE (.*);").firstMatch(window.navigator.appVersion).group(1));

Browser _firefox = new Browser("Firefox",
    () => window.navigator.userAgent.contains("Firefox"),
    () => new RegExp(r"rv:/?(.*)\)").firstMatch(window.navigator.userAgent).group(1));

bool _matchVendor(String name) {
  var vendor = window.navigator.vendor;
  return vendor != null && vendor.contains(name);
}
