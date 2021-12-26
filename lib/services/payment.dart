// import 'dart:convert';
//
// import 'package:flutter/services.dart';
// import 'package:http/http.dart' as http;
// import 'package:stripe_payment/stripe_payment.dart';
//
// class StripeTransactionResponse {
//   String message;
//   bool success;
//   StripeTransactionResponse({this.message, this.success});
// }
//
// class StripeService {
//   static String apiBase = 'https://api.stripe.com/v1';
//   static String paymentApiUrl = '${StripeService.apiBase}/payment_intents';
//   static Uri paymentApiUri = Uri.parse(paymentApiUrl);
//   static String secret =
//       'sk_test_51JeqGrCStNpnicvOROPMO9q0l8ipk7qJ7Y2FMhtdlqofr5jM41oL9jEfPUdP88gN9ky3GnOK7ZAsnow3l62aAqNj00IMax5JhO';
//
//   static Map<String, String> headers = {
//     'Authorization': 'Bearer ${StripeService.secret}',
//     'Content-type': 'application/x-www-form-urlencoded'
//   };
//
//   static init() {
//     StripePayment.setOptions(StripeOptions(
//         publishableKey:
//         'pk_test_51JeqGrCStNpnicvOuW09pOTYKToD61TFKKzDhlXH9FmWIND89IRJqBHu347rrQ85gQldbRO3kDbWx6jspMMtXpPp00puMbfo45',
//         merchantId: 'test',
//         androidPayMode: 'test'));
//   }
//
//   static Future<Map<String, dynamic>> createPaymentIntent(
//       String amount, String currency) async {
//     try {
//       Map<String, dynamic> body = {"amount": amount, "currency": currency};
//       var response =
//       await http.post(paymentApiUri, headers: headers, body: body);
//       return jsonDecode(response.body);
//     } catch (error) {
//       print('error occured in the payment intent $error ');
//     }
//     return null;
//   }
//
//   static Future<StripeTransactionResponse> payWithNewCard(
//       {String amount, String currency}) async {
//     try {
//       var paymentMethod = await StripePayment.paymentRequestWithCardForm(
//           CardFormPaymentRequest());
//       var paymentIntent =
//       await StripeService.createPaymentIntent(amount, currency);
//       var response = await StripePayment.confirmPaymentIntent(PaymentIntent(
//           clientSecret: paymentIntent['client_secret'],
//           paymentMethodId: paymentMethod.id));
//       if (response.status == 'succeeded') {
//         return StripeTransactionResponse(
//             message: 'Transaction successful', success: true);
//       } else {
//         return StripeTransactionResponse(
//             message: 'Transaction failed', success: false);
//       }
//     } on PlatformException catch (error) {
//       return StripeService.getPlatformExceptionErrorResult(error);
//     } catch (error) {
//       return StripeTransactionResponse(
//           message: 'Transaction failed : $error', success: false);
//     }
//   }
//
//   static getPlatformExceptionErrorResult(err) {
//     String message = 'Something went wrong';
//     if (err.code == 'cancelled') {
//       message = 'Transaction cancelled';
//     }
//
//     return new StripeTransactionResponse(message: message, success: false);
//   }
// }
