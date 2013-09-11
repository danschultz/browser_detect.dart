part of browser_detect;

class Browser {
  final String name;

  bool get isChrome => this == _chrome;
  bool get isSafari => this == _safari;
  bool get isOpera => this == _opera;
  bool get isIe => this == _ie;
  bool get isFirefox => this == _firefox;

  BrowserVersion get version => new BrowserVersion(_version());

  final _Matcher _matcher;
  final _Version _version;

  const Browser(this.name, this._matcher, this._version);

  String toString() => "$name $version".trim();
}

class _UnknownBrowser extends Browser {
  _UnknownBrowser() : super("Unknown Browser", () => true, () => "");
}

typedef bool _Matcher();
typedef String _Version();