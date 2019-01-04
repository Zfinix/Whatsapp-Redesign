class ContactModel {
  List<Contact> contact;

  ContactModel({this.contact});

  ContactModel.fromJson(Map<String, dynamic> json) {
    if (json['contact'] != null) {
      contact = new List<Contact>();
      json['contact'].forEach((v) {
        contact.add(new Contact.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.contact != null) {
      data['contact'] = this.contact.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Contact {
  String firstName;
  String lastName;
  String profilePic;
  List<Call> calls;
  List<Status> status;

  Contact(
      {this.firstName,
      this.lastName,
      this.profilePic,
      this.calls,
      this.status});

  Contact.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    profilePic = json['profile_pic'];
    if (json['calls'] != null) {
      calls = new List<Call>();
      json['calls'].forEach((v) {
        calls.add(new Call.fromJson(v));
      });
    }
    if (json['status'] != null) {
      status = new List<Status>();
      json['status'].forEach((v) {
        status.add(new Status.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['profile_pic'] = this.profilePic;
    if (this.calls != null) {
      data['calls'] = this.calls.map((v) => v.toJson()).toList();
    }
    if (this.status != null) {
      data['status'] = this.status.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Call {
  String date;
  String time;
  bool incoming;
  bool video;
  bool recieved;

  Call({this.date, this.time, this.incoming, this.video, this.recieved});

  Call.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    time = json['time'];
    incoming = json['incoming'];
    video = json['video'];
    recieved = json['recieved'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['time'] = this.time;
    data['incoming'] = this.incoming;
    data['video'] = this.video;
    data['recieved'] = this.recieved;
    return data;
  }
}

class Status {
  String msg;
  String date;
  String img;

  Status({this.msg, this.date, this.img});

  Status.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    date = json['date'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    data['date'] = this.date;
    data['img'] = this.img;
    return data;
  }
}