// package com.microware.educategirlstp.callback
//
// import com.google.gson.JsonObject
// import com.microware.educategirlstp.network.response.*
// import retrofit2.Response
// import retrofit2.http.*
//
//
// interface ApiCallback {
//
// @GET("api/PMSTPWebApi/GetLogin")
// suspend fun login(@Query("Username") userName: String?, @Query("password") password: String?):
// Response<TokenResponse>
//
// // @GET("api/PMSTPWebApi/GetAllData")
// @GET("api/PMSTPWebApi/GetAllDataUDISE")
// suspend fun loginVillage(@Query("token") token: String, @Query("DISECode") DISECode: String, @Query("TeacherName") TeacherName: String, @Query("Designation") Designation: String, @Query("OtherDesignation") OtherDesignation: String, @Query("MobileNo") MobileNo: String, @Query("EmailId") EmailId: String): Response<MastersResponse>
//
// /*@GET("api/PMSTPWebApi/GetAllData")
//   //  @GET("api/PMSTPWebApi/GetAllDataUDISE")
//     suspend fun loginVillage(): Response<MastersResponse>*/
//
// //@POST("api/PMSTPWebApi/PMSTPUploadData")
// @POST("api/PMSTPWebApi/PMSTPUploadProcData")
// @FormUrlEncoded
// suspend fun uploadData(@Field("token") token: String,@Field("userdata") json: String):
// Response<UploadDataResponse>
//
// // @GET("api/PMSTPWebApi/GetPMSTPDownloadData")
// @GET("api/PMSTPWebApi/GetPMSTPDownloadTransData")
// suspend fun downloadData(
// @Query("token") token: String,
// @Query("DistrictCode") DistrictCode: String,
// @Query("VillageCode") VillageCode: String
// ): Response<DownloadDataResponse>
//
// @GET("api/PMSTPWebApi/GetMasterdetails")
// suspend fun getMasterDetails(
// @Query("token") token:String,
// @Query("Flag") Flag:String,
// @Query("StateCode") StateCode:String?,
// @Query("DistrictCode") DistrictCode:String?,
// @Query("BlockCode") BlockCode:String?,
// @Query("PanchayatCode") PanchayatCode:String?,
// @Query("VillageCode") VillageCode:String?
// ):Response<MasterDetailResponse>
//
//
// }