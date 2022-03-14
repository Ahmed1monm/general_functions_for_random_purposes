String getSubString(String data) {
  int count = 0;
  String subData = '';

  for (int i = 0; i < data.length - 1; i++) {
    if (count == 10) {
      break;
    }
    if (data[i] == ' ') {
      count++;
      subData += data[i];
    } else {
      subData = subData + data[i];
    }
  }
  print(count);
  return subData;
}
