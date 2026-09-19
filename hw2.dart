// HOMEWORK 2 — Safe ATM Banking Terminal Simulator

const int correctPin = 1234;

// 1) checkBalance — arrow function
void checkBalance({required String name, required double balance}) =>
    print("$name, your available balance is $balance ₸");

// 2) deposit — amount is nullable
double deposit({required double currentBalance, double? amount}) {
  // if amount is null -> 0.0
  double value = amount ?? 0.0;

  if (value <= 0) {
    print("DEPOSIT DECLINED: amount must be greater than 0");
    print("balance stays: $currentBalance ₸\n");
    return currentBalance;
  }

  double newBalance = currentBalance + value;

  print("===== DEPOSIT RECEIPT =====");
  print("deposited: $value ₸");
  print("new balance: $newBalance ₸\n");

  return newBalance;
}

// 3) withdraw — amount and pinCode are nullable
double withdraw({
  required String name,
  required double currentBalance,
  double? amount,
  int? pinCode,
}) {
  // if pinCode is null -> 0000 (wrong pin anyway)
  int pin = pinCode ?? 0000;

  if (pin != correctPin) {
    print("===== WITHDRAWAL DECLINED =====");
    print("$name, wrong PIN code. Transaction cancelled.");
    print("balance stays: $currentBalance ₸\n");
    return currentBalance;
  }

  // if amount is null -> 0.0
  double value = amount ?? 0.0;

  if (value <= 0) {
    print("===== WITHDRAWAL DECLINED =====");
    print("$name, amount must be greater than 0.");
    print("balance stays: $currentBalance ₸\n");
    return currentBalance;
  }

  if (value > currentBalance) {
    print("===== WITHDRAWAL DECLINED =====");
    print("$name, insufficient funds.");
    print("requested: $value ₸, available: $currentBalance ₸\n");
    return currentBalance;
  }

  double newBalance = currentBalance - value;

  print("===== WITHDRAWAL RECEIPT =====");
  print("$name, take your cash: $value ₸");
  print("new balance: $newBalance ₸\n");

  return newBalance;
}

void main() {
  String client = "Tomiris";
  double balance = 50000.0;

  // start
  checkBalance(name: client, balance: balance);
  print("");

  // deposit with amount
  balance = deposit(currentBalance: balance, amount: 15000);

  // deposit without amount -> null -> 0.0
  balance = deposit(currentBalance: balance);

  // withdraw with correct pin
  balance = withdraw(
    name: client,
    currentBalance: balance,
    amount: 20000,
    pinCode: 1234,
  );

  // withdraw with wrong pin
  balance = withdraw(
    name: client,
    currentBalance: balance,
    amount: 5000,
    pinCode: 1111,
  );

  // withdraw without pin -> null -> 0000 -> declined
  balance = withdraw(
    name: client,
    currentBalance: balance,
    amount: 5000,
  );

  // withdraw more than balance
  balance = withdraw(
    name: client,
    currentBalance: balance,
    amount: 999999,
    pinCode: 1234,
  );

  // withdraw without amount -> null -> 0.0 -> declined
  balance = withdraw(
    name: client,
    currentBalance: balance,
    pinCode: 1234,
  );

  // final
  checkBalance(name: client, balance: balance);
}
