import 'package:http/http.dart';
import 'package:crypto_with_bloc/home/model/crypto_model.dart';

class CryptoRepository {
  final url =
      "https://cryptopanic.com/api/v1/posts/?auth_token=d36debcda4112c4dc7a1466d45ea5d48efec527c&public=true";

  Future<Crypto> getNews() async {
    final response = await get(Uri.parse(url));
    print(response.body);
    final cryptoNews = cryptoFromJson(response.body);
    print(cryptoNews);
    return cryptoNews;
  }
}
