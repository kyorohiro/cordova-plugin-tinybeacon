part of umiuni2d_beacon;
/**
 *
 *
 */
class TinyBeaconFoundBeacon {
  String uuid;
  int major;
  int minor;
  TinyBeaconProximity proximity;
  double accuracy;
  int rssi;
  int timeSec;

  TinyBeaconFoundBeacon(this.uuid, this.major, this.minor, this.rssi, this.proximity, this.accuracy, this.timeSec) {}

  @override
  String toString() {
    return "uuid:${uuid}, major:${major}, minor:${minor}, proximity:${proximity}, accuracy:${accuracy}, rssi:${rssi}, time:${timeSec}";
  }

  int get lazyHashCode {
    int result = 17;
    result = 37 * result + uuid.hashCode;
    result = 37 * result + major.hashCode;
    result = 37 * result + minor.hashCode;
    return result;
  }

  int get hashCode {
    int result = lazyHashCode;
    result = 37 * result + proximity.hashCode;
    result = 37 * result + accuracy.hashCode;
    result = 37 * result + rssi.hashCode;
    result = 37 * result + timeSec.hashCode;
    return result;
  }

  bool lazyEqual(o) {
    if (!(o is TinyBeaconFoundBeacon)) {
      return false;
    }
    TinyBeaconFoundBeacon p = o;
    return (uuid == p.uuid && major == p.major && minor == p.minor);
  }

  bool operator ==(o) {
    if (false == lazyEqual(o)) {
      return false;
    }
    TinyBeaconFoundBeacon p = o;
    return (proximity == p.proximity && accuracy == p.accuracy && rssi == p.rssi && timeSec == p.timeSec);
  }
}

/**
 *
 *
 */
abstract class TinyBeaconFoundResult {
  int get timePerSec;
  List<TinyBeaconFoundBeacon> get beacons;

  @override
  String toString() {
    StringBuffer buffer = new StringBuffer();
    buffer.write("time: ${timePerSec}\n");
    for (TinyBeaconFoundBeacon b in beacons) {
      buffer.write("::beacon: ${b}\n");
    }
    return buffer.toString();
  }
}

/**
 *
 *
 */
class TinyBeaconScanInfo {
  String uuid;
  int major;
  int minor;
  TinyBeaconScanInfo(this.uuid, {this.major: null, this.minor: null}) {
    ;
  }

  String normalizeUUID() {
    if (uuid.contains("-")) {
      return uuid;
    } else {
      return "${uuid.substring(0,8)}-${uuid.substring(8,12)}" + "-${uuid.substring(12,16)}-${uuid.substring(16,20)}" + "-${uuid.substring(20)}";
    }
  }

  Map toMap() {
    Map r = {};
    r["uuid"] = normalizeUUID();
    r["major"] = major;
    r["minor"] = minor;
    return r;
  }
}
