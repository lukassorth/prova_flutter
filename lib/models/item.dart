class Item {
  String? text;
  int? id;

  Item({this.text, this.id});

  Item.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    data['id'] = id;
    return data;
  }
}