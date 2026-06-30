class OrderPayload {
  OrderPayload(this.orders);
  List<OrderData> orders=[];

  factory OrderPayload.fromJson(Map<String, dynamic> json) {
    final List<OrderData> parsedOrders = [];

    json.forEach((key, value) {

      if (value is Map<String, dynamic>) {
        parsedOrders.add(OrderData.fromJson(value));
      }
    });
    return OrderPayload(parsedOrders);
  }
}

class OrderData {
  final OrderInfo? orderInfo;
  final String? status;
  final List<DeliveryAttempt>? deliveryAttempts;

  OrderData({
    this.orderInfo,
    this.status,
    this.deliveryAttempts,
  });

  factory OrderData.fromJson(Map<String, dynamic> json) {
    return OrderData(
      orderInfo: json['OrderInfo'] != null ? OrderInfo.fromJson(json['OrderInfo']) : null,
      status: json['status'] as String?,
      deliveryAttempts: json['deliveryAttempts'] != null
          ? (json['deliveryAttempts'] as List).map((i) => DeliveryAttempt.fromJson(i as Map<String, dynamic>)).toList()
          : null,
    );
  }
}

class OrderInfo {
  final String? tracking;
  final String? reference;
  final String? client;
  final String? phone;
  final String? adresse;
  final int? wilayaId;
  final String? commune;
  final String? montant;
  final String? produit;
  final String? driverName;
  final String? driverPhone;
  final String? created_at;
  final int? typeId;
  final int? stopDesk;

  OrderInfo({
    this.tracking,
    this.reference,
    this.client,
    this.phone,
    this.adresse,
    this.wilayaId,
    this.commune,
    this.montant,
    this.produit,
    this.driverName,
    this.driverPhone,
    this.created_at,
    this.typeId,
    this.stopDesk,
  });

  factory OrderInfo.fromJson(Map<String, dynamic> json) {
    return OrderInfo(
      tracking: json['tracking'] as String?,
      reference: json['reference'] as String?,
      client: json['client'] as String?,
      phone: json['phone'] as String?,
      adresse: json['adresse'] as String?,
      wilayaId: json['wilaya_id'] as int?,
      commune: json['commune'] as String?,
      montant: json['montant'] as String?,
      produit: json['produit'] as String?,
      driverName: json['driver_name'] as String?,
      driverPhone: json['driver_phone'] as String?,
      created_at: json['created_at'] as String?,
      typeId: json['type_id'] as int?,
      stopDesk: json['stop_desk'] as int?,
    );
  }
}

class DeliveryAttempt {
  final String? text_tentative; // Handles textual fallback logs safely
  final String? content; // Handles textual fallback logs safely

  DeliveryAttempt({
    this.text_tentative,
    this.content,
  });

  factory DeliveryAttempt.fromJson(Map<String, dynamic> json) {
    return DeliveryAttempt(
      text_tentative: json['text_tentative'] as String?,
      content: json['content'] as String?,
    );
  }
}

