import 'dart:async';
import 'dart:io';

Future<void> main(List<String> args) async {
  final certPath = args.isNotEmpty ? args[0] : 'server_cert.pem';
  final keyPath = args.length > 1 ? args[1] : 'server_key.pem';

  if (!File(certPath).existsSync() || !File(keyPath).existsSync()) {
    print('Certificate or key file not found.');
    print('Generate a self-signed certificate with OpenSSL:');
    print(
        '  openssl req -x509 -newkey rsa:4096 -nodes -keyout server_key.pem -out server_cert.pem -days 365 -subj "/CN=localhost"');
    print('Then re-run this program.');
    exit(2);
  }

  final context = SecurityContext();
  try {
    context.useCertificateChain(certPath);
    context.usePrivateKey(keyPath);
  } catch (e) {
    stderr.writeln('Failed to configure SecurityContext: $e');
    exit(2);
  }

  const port = 8443;
  final server = await HttpServer.bindSecure(
    InternetAddress.anyIPv4,
    port,
    context,
    requestClientCertificate: false,
  );

  print('HTTPS server running on https://localhost:$port/');
  await for (final HttpRequest req in server) {
    _handleRequest(req);
  }
}

void _handleRequest(HttpRequest req) {
  final resp = req.response;
  try {
    resp.statusCode = HttpStatus.ok;
    resp.headers.contentType = ContentType.html;
    resp.write('<html><body>');
    resp.write('<h1>Hello, secure world!</h1>');
    resp.write('<p>Requested: ${req.uri}</p>');
    resp.write('</body></html>');
  } catch (e) {
    stderr.writeln('Error handling request: $e');
  } finally {
    resp.close();
  }
}
