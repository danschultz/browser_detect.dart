part of browser_detect;

typedef bool _VendorMatcher();

typedef Match _VersionMatcher();

class Browser {
  final String name;

  BrowserVersion _version;
  final Iterable<_VendorMatcher> _vendorMatchers;
  final Iterable<_VersionMatcher> _versionMatchers;
  Browser(this.name, this._vendorMatchers, this._versionMatchers);
  bool get isChrome => this == _chrome;
  bool get isCurrent => _vendorMatchers.any((matcher) => matcher());

  bool get isFirefox => this == _firefox;
  bool get isIe => this == _ie;

  bool get isOpera => this == _opera;
  bool get isSafari => this == _safari;

  BrowserVersion get version {
    if (_version == null) {
      var value = _versionMatchers
          .map((matcher) => matcher())
          .firstWhere((match) => match != null)
          .group(1);
      _version = new BrowserVersion(value);
    }
    return _version;
  }

  String toString() => "$name $version".trim();
}
class _UnknownBrowser extends Browser {
  _UnknownBrowser() : super("Unknown Browser", [() => true], []);
}
