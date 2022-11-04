import 'package:http/http.dart' as http;

class KeuangankuApi {
  final http.Client client;
  final String _apiBaseUrl = 'http://localhost:5000/api/v1';

  KeuangankuApi(this.client);

  Future login() {
    client
        .get(Uri.parse(_apiBaseUrl + '/login'))
        .then((value) => null)
        .catchError(() {});
    var resp = data.body;
  }

  // Future register() {}

  // Future getTransactionList() {}
}
