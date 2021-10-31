String displayLeadingZero(int number) {
  return number.toString().length == 1 ? "0$number" : "$number";
}
