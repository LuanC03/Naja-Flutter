import 'dart:convert';

class ItensApi {
  Future<List> loadAllItens() async {
    String json = "[  \n" +
        "   {  \n" +
        "      \"_id\":\"23658\",\n" +
        "      \"nome\":\"TV\",\n" +
        "      \"preco\":\"5978.45\",\n" +
        "      \"url_img\":\"https://pbs.twimg.com/profile_images/507251035929190400/BDUL3Uzt_400x400.png\",\n" +
        "      \"categoria\":\"TVs\",\n" +
        "      \"quantidade\":\"150\"\n" +
        "   },\n" +
        "   {  \n" +
        "      \"_id\":\"23670\",\n" +
        "      \"nome\":\"Celular\",\n" +
        "      \"preco\":\"356.10\",\n" +
        "      \"url_img\":\"https://pbs.twimg.com/profile_images/507251035929190400/BDUL3Uzt_400x400.png\",\n" +
        "      \"categoria\":\"Celulares\",\n" +
        "      \"quantidade\":\"0\"\n" +
        "   },\n" +
        "   {  \n" +
        "      \"_id\":\"23671\",\n" +
        "      \"nome\":\"VideoGame\",\n" +
        "      \"preco\":\"1458.64\",\n" +
        "      \"url_img\":\"https://pbs.twimg.com/profile_images/507251035929190400/BDUL3Uzt_400x400.png\",\n" +
        "      \"categoria\":\"VideoGames\",\n" +
        "      \"quantidade\":\"10\"\n" +
        "   },\n" +
        "   {  \n" +
        "      \"_id\":\"23673\",\n" +
        "      \"nome\":\"Eletrodomestico\",\n" +
        "      \"preco\":\"150.60\",\n" +
        "      \"url_img\":\"https://pbs.twimg.com/profile_images/507251035929190400/BDUL3Uzt_400x400.png\",\n" +
        "      \"categoria\":\"Eletrodomesticos\",\n" +
        "      \"quantidade\":\"50\"\n" +
        "   }\n" +
        "]";
    return jsonDecode(json);
  }
}
