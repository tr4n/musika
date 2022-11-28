class ZingResponse<T extends ToJsonAble> {
  int? err;
  String? msg;
  T? data;

  ZingResponse.fromJson(Map<String, dynamic> json) {
    err = json['err'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['err'] = err;
    data['msg'] = msg;
    data["data"] = this.data?.toJson();
    return data;
  }
}

abstract class ToJsonAble<T> {
  Map<String, dynamic> toJson();
}
