String escapeEmail(String str) {
  return str.replaceAll(".", "%2E");
}
