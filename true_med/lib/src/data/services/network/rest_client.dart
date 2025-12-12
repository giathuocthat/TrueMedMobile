import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/page_model.dart';
import '../../models/pagination_model.dart';
import '../../models/product_model.dart';
import '../../models/product_page_model.dart';
import 'endpoints.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: Endpoints.base)
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl, ParseErrorLogger errorLogger}) =
      _RestClient;

  @POST(Endpoints.login)
  Future<HttpResponse> login(@Body() Map<String, dynamic> request);

  // @GET(Endpoints.products)
  // Future<HttpResponse> getProducts();

  @GET(Endpoints.products)
  Future<HttpResponse<List<ProductResponseModel>>> getProducts();

  @GET(Endpoints.productStores)
  Future<HttpResponse<ProductPageResponseModel>> getProductStores(
    @Queries() Map<String, dynamic> query,
  );

  @GET(Endpoints.productDetail)
  Future<HttpResponse<ProductResponseModel>> getProductDetail(
    @Path('id') String id,
  );
}
