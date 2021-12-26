class FaceData {
  String about;
  Posts posts;
  String id;

  FaceData({this.about, this.posts, this.id});

  FaceData.fromJson(Map<String, dynamic> json) {
    about = json['about'];
    posts = json['posts'] != null ? new Posts.fromJson(json['posts']) : null;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['about'] = this.about;
    if (this.posts != null) {
      data['posts'] = this.posts.toJson();
    }
    data['id'] = this.id;
    return data;
  }
}

class Posts {
  List<Data> data;
  Paging paging;

  Posts({this.data, this.paging});

  Posts.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    paging =
        json['paging'] != null ? new Paging.fromJson(json['paging']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    if (this.paging != null) {
      data['paging'] = this.paging.toJson();
    }
    return data;
  }
}

class Data {
  String createdTime;
  String fullPicture;
  String message;
  List<MessageTags> messageTags;
  Attachments attachments;
  String id;

  Data(
      {this.createdTime,
      this.fullPicture,
      this.message,
      this.messageTags,
      this.attachments,
      this.id});

  Data.fromJson(Map<String, dynamic> json) {
    createdTime = json['created_time'];
    fullPicture = json['full_picture'];
    message = json['message'];
    if (json['message_tags'] != null) {
      messageTags = [];
      json['message_tags'].forEach((v) {
        messageTags.add(new MessageTags.fromJson(v));
      });
    }
    attachments = json['attachments'] != null
        ? new Attachments.fromJson(json['attachments'])
        : null;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created_time'] = this.createdTime;
    data['full_picture'] = this.fullPicture;
    data['message'] = this.message;
    if (this.messageTags != null) {
      data['message_tags'] = this.messageTags.map((v) => v.toJson()).toList();
    }
    if (this.attachments != null) {
      data['attachments'] = this.attachments.toJson();
    }
    data['id'] = this.id;
    return data;
  }
}

class MessageTags {
  String id;
  String name;
  int offset;
  int length;
  String type;

  MessageTags({this.id, this.name, this.offset, this.length, this.type});

  MessageTags.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    offset = json['offset'];
    length = json['length'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['offset'] = this.offset;
    data['length'] = this.length;
    data['type'] = this.type;
    return data;
  }
}

class Attachments {
  List<AttachmentsData> data;

  Attachments({this.data});

  Attachments.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data.add(new AttachmentsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AttachmentsData {
  String mediaType;
  String url;
  SubAttachments subattachments;
  Media media;
  String title;
  String type;
  String description;

  AttachmentsData(
      {this.mediaType,
      this.url,
      this.subattachments,
      this.media,
      this.title,
      this.type,
      this.description});

  AttachmentsData.fromJson(Map<String, dynamic> json) {
    mediaType = json['media_type'];
    url = json['url'];
    subattachments = json['subattachments'] != null
        ? new SubAttachments.fromJson(json['subattachments'])
        : null;
    media = json['media'] != null ? new Media.fromJson(json['media']) : null;
    title = json['title'];
    type = json['type'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['media_type'] = this.mediaType;
    data['url'] = this.url;
    if (this.subattachments != null) {
      data['subattachments'] = this.subattachments.toJson();
    }
    if (this.media != null) {
      data['media'] = this.media.toJson();
    }
    data['title'] = this.title;
    data['type'] = this.type;
    data['description'] = this.description;
    return data;
  }
}

class SubAttachments {
  List<SubattachmentsData> data;

  SubAttachments({this.data});

  SubAttachments.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data.add(new SubattachmentsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubattachmentsData {
  Media media;
  Target target;
  String type;
  String url;
  String description;

  SubattachmentsData(
      {this.media, this.target, this.type, this.url, this.description});

  SubattachmentsData.fromJson(Map<String, dynamic> json) {
    media = json['media'] != null ? new Media.fromJson(json['media']) : null;
    target =
        json['target'] != null ? new Target.fromJson(json['target']) : null;
    type = json['type'];
    url = json['url'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.media != null) {
      data['media'] = this.media.toJson();
    }
    if (this.target != null) {
      data['target'] = this.target.toJson();
    }
    data['type'] = this.type;
    data['url'] = this.url;
    data['description'] = this.description;
    return data;
  }
}

class Media {
  PostImages image;

  Media({this.image});

  Media.fromJson(Map<String, dynamic> json) {
    image =
        json['image'] != null ? new PostImages.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.image != null) {
      data['image'] = this.image.toJson();
    }
    return data;
  }
}

class PostImages {
  int height;
  String src;
  int width;

  PostImages({this.height, this.src, this.width});

  PostImages.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    src = json['src'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this.height;
    data['src'] = this.src;
    data['width'] = this.width;
    return data;
  }
}

class Target {
  String id;
  String url;

  Target({this.id, this.url});

  Target.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    return data;
  }
}

class Paging {
  Cursors cursors;
  String next;

  Paging({this.cursors, this.next});

  Paging.fromJson(Map<String, dynamic> json) {
    cursors =
        json['cursors'] != null ? new Cursors.fromJson(json['cursors']) : null;
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cursors != null) {
      data['cursors'] = this.cursors.toJson();
    }
    data['next'] = this.next;
    return data;
  }
}

class Cursors {
  String before;
  String after;

  Cursors({this.before, this.after});

  Cursors.fromJson(Map<String, dynamic> json) {
    before = json['before'];
    after = json['after'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['before'] = this.before;
    data['after'] = this.after;
    return data;
  }
}
