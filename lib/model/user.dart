
class User  {
	String userId;
	String phone;
	int gender = 1;
	int age = 18;

	User({this.userId,this.phone});

	 User.fromJson(Map<String, dynamic> json) {
		userId = json['userId'];
		phone = json['phone'];
		gender = json['gender'];
		gender = json['age'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['userId'] = this.userId;
		data['phone'] = this.phone;
		data['gender'] = this.gender;
		data['age'] = this.age;
		return data;
	}
}
