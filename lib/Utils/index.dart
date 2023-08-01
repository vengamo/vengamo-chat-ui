import 'dart:convert';

bool isBase64(String input) {
  input = cleanBase64(input);
    bool isBase64 = !input.contains(' ') &&
        !input.contains('.') &&
        ((input.length % 4 == 0) &&
            base64.decode(input).isNotEmpty &&
            RegExp(r'^([A-Za-z0-9+/])*([A-Za-z0-9+/]{2}==|[A-Za-z0-9+/]{3}=)?$')
              .hasMatch(input));

    return isBase64;
  }

 String cleanBase64(String base64String) {
  List<String> parts = base64String.split("base64,");
  if (parts.length > 1) {
    return parts[1];
  } else {
    // If the string doesn't contain "base64,", return the original string
    return base64String;
  }
}