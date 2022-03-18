String getTheFirstNofWordsInString(String data, int numberOfWords) {
  int count = 0;
  String subData = '';

  for (int i = 0; i < data.length - 1; i++) {
    if (count == numberOfWords) {
      break;
    }
    if (data[i] == ' ') {
      count++;
      subData += data[i];
    } else {
      subData = subData + data[i];
    }
  }

  return subData;
}
