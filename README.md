# network_caller

A reusable and clean Flutter package to perform HTTP requests (GET, POST, PUT, DELETE, PATCH) with optional token and custom headers.

## Features

✅ Supports all HTTP methods  
✅ Custom headers and bearer token  
✅ Clean error handling and response class  
✅ Optional JSON encoding

## Usage

```dart
import 'package:network_caller/network_caller.dart';

final response = await NetworkCaller.request(
  url: 'https://api.example.com/data',
  method: ApiMethod.post,
  body: {'name': 'John'},
  token: 'your_token_here',
);

if (response.isSuccess) {
  print(response.data);
} else {
  print(response.message);
}
