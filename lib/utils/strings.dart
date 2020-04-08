//
// String manipulation functions.
//

String prepareStringForRequest(String value) {
  if (value == null)
    return '';
  value = value.toLowerCase();
  value = value.replaceAll(RegExp("[^a-z0-9À-ÿ ]"), '');
  value = value.trim();
  value = value.replaceAll(RegExp(' +'), ' ');
  value = value.replaceAll(RegExp(r' '), '+');
  value = value.replaceAll(RegExp(r'\++'), '+');
  return value;
}
