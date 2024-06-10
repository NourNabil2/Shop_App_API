class FAVData {
  bool? status;
  String? message;


  FAVData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }
}
