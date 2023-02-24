class Customer {
  int customer_id;
  String customer_name;
  String customer_email;
  String customer_password;

  Customer(
    this.customer_id,
    this.customer_name,
    this.customer_email,
    this.customer_password,
  );

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        int.parse(json["customer_id"]),
        json["customer_name"],
        json["customer_email"],
        json["customer_password"],
      );

  Map<String, dynamic> toJson() => {
        'customer_id': customer_id.toString(),
        'customer_name': customer_name,
        'customer_email': customer_email,
        'customer_password': customer_password,
      };
}
