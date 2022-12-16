class HttpExceptions {
  HttpExceptions({
    required this.message,
    this.statusCode,
  });
  String message;
  int? statusCode;
  static HttpExceptions triggerException(dynamic statusCode) {
    switch (statusCode) {
      case 200:
        return HttpExceptions(
          message: "Your request was well accepted!",
          statusCode: statusCode,
        );
      case 400:
        return HttpExceptions(
          message:
              "This request is invalid...\nTry to review the information you entered!",
          statusCode: statusCode,
        );
      case 401:
        return HttpExceptions(
          message:
              "This request is invalid...\nTry to review the information you entered!",
          statusCode: statusCode,
        );
      case 403:
        return HttpExceptions(
          message: "That authorization was denied.",
          statusCode: statusCode,
        );
      case 404:
        return HttpExceptions(
          message: "This server was not found!",
          statusCode: statusCode,
        );
      case 409:
        return HttpExceptions(
          message: "Looks like there is a data conflict!",
          statusCode: statusCode,
        );
      case 500:
        return HttpExceptions(
          message: "Server error, wondering what to show on the screen",
          statusCode: statusCode,
        );
      default:
        return HttpExceptions(
          message: "Could not perform this operation",
          statusCode: statusCode,
        );
    }
  }
}
