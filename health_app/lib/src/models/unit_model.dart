

class unit {
  int id;
  String applicationUserID;
  Null account;
  List<Null> units;

  unit({this.id, this.applicationUserID, this.account, this.units});

  unit.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    applicationUserID = json['applicationUserID'];
    account = json['account'];
  /*  if (json['units'] != null) {
      units = new List<Null>();
      json['units'].forEach((v) {
        units.add(new Null.fromJson(v));
      });
    }*/
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> unitData = new Map<String, dynamic>();
    unitData['id'] = this.id;
    unitData['applicationUserID'] = this.applicationUserID;
    unitData['account'] = this.account;
    /*if (this.units != null) {
      data['units'] = this.units.map((v) => v.toJson()).toList();
    }
    return data;*/
  }
}
