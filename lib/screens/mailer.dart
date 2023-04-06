import 'dart:convert';
import 'dart:io';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

Future<void> main() async {
  final server = await createServer();
  print('Server started: ${server.address} port ${server.port}');
  await _handleRequests(server);
}

Future<HttpServer> createServer() async {
  final address = InternetAddress.loopbackIPv4;
  const port = 4040;
  return await HttpServer.bind(address, port);
}

Future<void> _handleRequests(HttpServer server) async {
  await for (HttpRequest request in server) {
    if (request.method == 'POST' &&
        request.uri.path == '/contact') {
      _handleContactPost(request);
    } else {
      _handleBadRequest(request);
    }
  }
}

void _handleBadRequest(HttpRequest request) {
  request.response
    ..statusCode = HttpStatus.badRequest
    ..write('Bad request')
    ..close();
}

Future<void> _handleContactPost(HttpRequest request) async {
  final body = await utf8.decodeStream(request);

  final username = 'me@example.com';
  final password = 'twRyKjx2Bhf8n3vN';
  final smtpServer = SmtpServer(
    'smtp-relay.sendinblue.com',
    port: 587,
    username: username,
    password: password,
  );

  final message = Message()
    ..from = Address(username, 'Suragch')
    ..recipients.add('anotheremail@example.com')
    ..subject = 'New POST message from user'
    ..text = body;

  int statusCode;
  try {
    final sendReport = await send(message, smtpServer);
    print(sendReport.toString());
    statusCode = HttpStatus.ok;
  } on MailerException catch (e) {
    print('Message not sent: $e');
    statusCode = HttpStatus.internalServerError;
  }

  request.response
    ..statusCode = statusCode
    ..close();
}