// LAB 1 Ex1 — Safe E-Commerce Order Processor

double processOrder({
  required String orderId,
  required double itemPrice,
  String? promoCode,
  double? deliveryFee,
}) {
  // if deliveryFee is null -> use default 500.0
  double fee = deliveryFee ?? 500.0;

  double discount = 0;
  if (promoCode == 'SAVE10') {
    discount = itemPrice * 0.1;
  }

  double total = itemPrice - discount + fee;

  print("===== ORDER $orderId =====");
  print("item price: $itemPrice ₸");
  print("promo code: ${promoCode ?? 'no promo'}");
  print("discount: $discount ₸");
  print("delivery fee: $fee ₸");
  print("TOTAL: $total ₸");
  print("");

  return total;
}

void main() {
  // with promo and custom delivery
  double total1 = processOrder(
    orderId: "A-101",
    itemPrice: 12000,
    promoCode: 'SAVE10',
    deliveryFee: 800,
  );

  // no promo, no delivery fee -> default 500
  double total2 = processOrder(
    orderId: "A-102",
    itemPrice: 4500,
  );

  // wrong promo code -> no discount
  double total3 = processOrder(
    orderId: "A-103",
    itemPrice: 9990,
    promoCode: 'SALE50',
  );

  print("returned totals: $total1, $total2, $total3");
}
