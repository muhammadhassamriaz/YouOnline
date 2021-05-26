class PostColors {
  bool success;
  List<ColorPostTypes> colorPostTypes;

  PostColors({this.success, this.colorPostTypes});

  PostColors.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['color_post_types'] != null) {
      colorPostTypes = <ColorPostTypes>[];
      json['color_post_types'].forEach((v) {
        colorPostTypes.add(new ColorPostTypes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.colorPostTypes != null) {
      data['color_post_types'] =
          this.colorPostTypes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ColorPostTypes {
  int id;
  String color1;
  String color2;
  String textColor;
  String image;
  String time;

  ColorPostTypes({
    this.id,
    this.color1,
    this.color2,
    this.textColor,
    this.image,
    this.time,
  });

  ColorPostTypes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    color1 = json['color_1'];
    color2 = json['color_2'];
    textColor = json['text_color'];
    image = json['image'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['color_1'] = this.color1;
    data['color_2'] = this.color2;
    data['text_color'] = this.textColor;
    data['image'] = this.image;
    data['time'] = this.time;
    return data;
  }
}
