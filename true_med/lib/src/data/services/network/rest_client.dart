import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/address_shipping_model.dart';
import '../../models/api_response_meta_model.dart';
import '../../models/base_list_model.dart';
import '../../models/base_model.dart';
import '../../models/page_model.dart';
import '../../models/pagination_model.dart';
import '../../models/product_model.dart';
import '../../models/product_page_model.dart';
import '../../models/province_detail_model.dart';
import '../../models/province_model.dart';
import '../../models/ward_detail_model.dart';
import '../../models/ward_model.dart';
import '../../models/json_parsing.dart';
import 'endpoints.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: Endpoints.base)
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl, ParseErrorLogger errorLogger}) =
      _RestClient;

  @POST(Endpoints.login)
  Future<HttpResponse> login(@Body() Map<String, dynamic> request);

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
  @GET(Endpoints.provinceAll)
  Future<HttpResponse<List<ProvinceResponseModel>>> getProvinces();

  @GET(Endpoints.wardAll)
  Future<HttpResponse<List<WardResponseModel>>> getWards();

  @GET(Endpoints.provinceDetail)
  Future<HttpResponse<ProvinceDetailResponseModel>> getProvinceDetail(
    @Path('id') String id,
  );

  @GET(Endpoints.wardDetail)
  Future<HttpResponse<WardDetailResponseModel>> getWardDetail(
    @Path('id') String id,
  );

  @GET(Endpoints.addressAll)
  Future<HttpResponse<BaseListResponseModel<AddressShippingResponseModel>>>
  getAddressShippingUser(@Path('id') String id);

  // @GET(Endpoints.addressAll)
  // Future<HttpResponse<WardDetailResponseModel>> getWardDetail(
  //   @Path('id') String id,
  // );

  // @GET(Endpoints.setAddressDefault)
  // Future<HttpResponse<WardDetailResponseModel>> getWardDetail(
  //   @Path('id') String id,
  // );

  // @DELETE(Endpoints.deleteAddress)
  // Future<HttpResponse<WardDetailResponseModel>> getWardDetail(
  //   @Path('id') String id,
  // );

  @POST(Endpoints.newAddress)
  Future<HttpResponse<ApiResponseMetaModel>> newAddress(
    @Body() Map<String, dynamic> request,
  );

  @PUT(Endpoints.editAddress)
  Future<HttpResponse<ApiResponseMetaModel>> editAddress(
    @Path('id') String id,
    @Body() Map<String, dynamic> request,
  );
}
