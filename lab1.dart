// LAB 1 — Tasks 1-5

void main() {
  // ---------- TASK 1: multiplication table 1-10 ----------
  print("TASK 1: MULTIPLICATION TABLE 1-10");
  for (int i = 1; i <= 10; i++) {
    String row = "";
    for (int j = 1; j <= 10; j++) {
      row += "${(i * j).toString().padLeft(4)}";
    }
    print(row);
  }

  // ---------- TASK 2: next day ----------
  print("\nTASK 2: NEXT DAY");
  List<String> dates = [
    "05.09.2026",
    "28.02.2024",
    "28.02.2026",
    "29.02.2026",
    "28.02.2100",
    "31.12.2025",
    "31.12.1999",
    "28.02.2000",
    "30.04.2026",
    "31.04.2026",
  ];
  for (String d in dates) {
    print("$d -> ${nextDay(d)}");
  }

  // ---------- TASK 3: vowel counter ----------
  print("\nTASK 3: VOWEL COUNTER");
  String text = "flutter mobile development";
  print("\"$text\" -> ${countVowels(text)}");

  // ---------- TASK 4: manual min & max finder ----------
  print("\nTASK 4: MIN & MAX");
  List<int> numbers = [14, 88, 3, 42, 99, 12, 67];
  List<int> numbers1 = [234, 34, 123, 44, 949, 112, 67];
  printMinMax(numbers);
  printMinMax(numbers1);

  // ---------- TASK 5: prime number checker ----------
  print("\nTASK 5: PRIME CHECKER");
  for (int n in [3, 6, 1, 2, 17, 25, 97, 100]) {
    print("$n -> ${isPrime(n) ? "prime number" : "not prime number"}");
  }
}

// ===== TASK 2 helpers =====
bool isLeapYear(int year) {
  // divisible by 4, except centuries, except every 400th year
  // 2000, 2400 -> leap; 2100, 2200, 2300 -> not leap
  if (year % 400 == 0) return true;
  if (year % 100 == 0) return false;
  return year % 4 == 0;
}

int daysInMonth(int month, int year) {
  switch (month) {
    case 1:
    case 3:
    case 5:
    case 7:
    case 8:
    case 10:
    case 12:
      return 31;
    case 4:
    case 6:
    case 9:
    case 11:
      return 30;
    case 2:
      return isLeapYear(year) ? 29 : 28;
    default:
      return 0;
  }
}

String twoDigits(int n) => n < 10 ? "0$n" : "$n";

String nextDay(String date) {
  List<String> parts = date.split(".");
  if (parts.length != 3) return "invalid date";

  int? day = int.tryParse(parts[0]);
  int? month = int.tryParse(parts[1]);
  int? year = int.tryParse(parts[2]);
  if (day == null || month == null || year == null) return "invalid date";

  if (month < 1 || month > 12) return "invalid date";
  if (day < 1 || day > daysInMonth(month, year)) return "invalid date";

  day++;
  if (day > daysInMonth(month, year)) {
    day = 1;
    month++;
    if (month > 12) {
      month = 1;
      year++;
    }
  }
  return "${twoDigits(day)}.${twoDigits(month)}.$year";
}

// ===== TASK 3 helper =====
int countVowels(String text) {
  const vowels = "aeiouAEIOU";
  int count = 0;
  for (int i = 0; i < text.length; i++) {
    if (vowels.contains(text[i])) count++;
  }
  return count;
}

// ===== TASK 4 helper =====
void printMinMax(List<int> list) {
  if (list.isEmpty) {
    print("list is empty");
    return;
  }
  int max = list[0];
  int min = list[0];
  for (int i = 1; i < list.length; i++) {
    if (list[i] > max) max = list[i];
    if (list[i] < min) min = list[i];
  }
  print("$list -> max: $max, min: $min");
}

// ===== TASK 5 helper =====
bool isPrime(int n) {
  if (n < 2) return false;
  for (int i = 2; i * i <= n; i++) {
    if (n % i == 0) return false;
  }
  return true;
}
