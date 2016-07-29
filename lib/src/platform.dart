part of browser_detect;

class Platform {
  final String name;

  bool get isMac => this == _mac;

  bool get isWindows => this == _windows;

  bool get isUnix => this == _unix;

  bool get isLinux => this == _linux;

  /// Anything that is not any of Mac, Windows, Unix or Linux
  bool get isOther => !(isMac || isWindows || isUnix || isLinux);

  bool get _matchesCurrent => _platformMatches.any((matcher) => matcher());

  final Iterable<_PlatformMatcher> _platformMatches;

  Platform(this.name, this._platformMatches);

  String toString() => "$name".trim();
}

class _UnknownPlatform extends Platform {
  _UnknownPlatform() : super("Unknown Platform", [() => true]);
}

typedef bool _PlatformMatcher();
