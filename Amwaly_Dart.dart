// Amwaly Payment
// Amwaly Dart
// https://github.com/Amwaly/Amwaly_Dart

// need install http
import 'package:http/http.dart';

// for get payment url and open in browser
var PaymentUrl = "";

Future AmwalyCreateLink() async {
  // this info's will get on email README.pdf

  var Amwaly_Url = "";
  var Amwaly_Email = "";
  var Amwaly_Key = "";

  // headers
  var headers = {'Content-Type': 'application/x-www-form-urlencoded'};

  var request = http.Request('POST', Uri.parse(Amwaly_Url));
  request.bodyFields = {
    'email': Amwaly_Email,
    'Publishable_Key': Amwaly_Key,
    'Product': 'Name Package',
    'amount': 'Total',
    'callback_url': 'https://yourdomine.com/Amwaly/callback',
    'customer_email': 'support@Amwaly.co',
    'billing_street1': '12',
    'billing_city': 'pairs',
    'billing_state': 'AL',
    'billing_country': 'US',
    'billing_postcode': '10000',
    'customer_givenName': 'Amwaly',
    'customer_surname': 'Payment',
    'customer_phonenumber': '00000000000'
  };
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    // get payment url
    print(await response.stream.bytesToString()['url']);
    print("Amwaly urr ${response.stream.bytesToString()['url']}");
    PaymentUrl = response.stream.bytesToString()['url'];
  } else {
    print(response.reasonPhrase);
  }
}
