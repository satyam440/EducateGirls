import 'dart:developer';
import 'dart:io';
import 'package:educategirl/Models/TblUserLoginEntity.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:educategirl/Models/TblUserInfoEntity.dart';

class DatabaseHelper {
  static Database? database;

  // DatabaseHelper._privateConstructor();
  // static final DatabaseHelper instance = DatabaseHelper._privateConstructor();


  Future openDb() async {
    var databasePath = await getDatabasesPath();
    var path = join(databasePath, 'sat.db');
    var exists = await databaseExists(path);
    if (!exists) {
      log("Creating new copy from asset");
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}
      ByteData data = await rootBundle.load(join("assets", "sat.db"));
      List<int> bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);
      // getData();
    } else {
      print("Opening existing database");
    }
    database = await openDatabase(path);

    return database;
  }

  Future insertUserInfoEntity(TblUserInfoEntity data) async {
    await openDb();
    return await database!.insert('UserInfoEntity', data.toJson());
  }

  Future insertUserLoginEntity(TblUserLoginEntity data) async {
    await openDb();
    return await database!.insert('UserLoginEntity', data.toJson());
  }


  Future<int> saveUserId(String userId) async {
    await openDb();
    return await database!.insert('UserLoginEntity', {'userid': userId});
  }

  Future<String> getUserId() async {
    await openDb();
    final List<Map<String, dynamic>> maps = await database!.query('UserLoginEntity');
    return maps.isNotEmpty ? maps.last['userId'] : '';
  }




//   Future<List<MstState>> getstList() async {
//     await openDb();
//     final List<Map<String, dynamic>> maps = await database!.query('mst_state');
//     List<MstState> stateList = [];
//     for (var element in maps) {
//       MstState state = MstState.fromJson(element);
//       stateList.add(state);
//     }
//
//     return stateList;
//   }
//
//   Future insertUser(User Users) async {
//     await openDb();
//     return await database!.insert('users', Users.toJson());
//   }
//   Future<List<User>> getUserList() async {
//     await openDb();
//     final List<Map<String, dynamic>> maps = await database!.query('users');
//     List<User> userList = [];
//     for (var element in maps) {
//       User Users = User.fromJson(element);
//       userList.add(Users);
//     }
//
//     return userList;
//   }
//
//   Future<int> updateState(User model) async {
//     await openDb();
//     return await database!.update('users', model.toJson(),
//         where: "id = ?", whereArgs: [model.id]);
//   }
//
//   Future<void> deleteState(User model) async {
//     await openDb();
//     await database!.delete('users', where: "id = ?", whereArgs: [model.id]);
//   }
//
//   // MstHealthFacilityProfileModel
//   Future insertMstHealthFacilityProfileModel(
//       MstHealthFacilityProfile mstHealthFacilityProfileModel) async {
//     await openDb();
//     return await database!.insert(
//         'mst_health_facility_profile', mstHealthFacilityProfileModel.toJson());
//   }
//
//   Future<List<MstHealthFacilityProfile>>
//   getMstHealthFacilityProfileModel() async {
//     await openDb();
//     final List<Map<String, dynamic>> maps =
//     await database!.query('mst_health_facility_profile');
//     List<MstHealthFacilityProfile> healthList = [];
//     for (var element in maps) {
//       MstHealthFacilityProfile mstHealthFacilityProfileModel =
//       MstHealthFacilityProfile.fromJson(element);
//       healthList.add(mstHealthFacilityProfileModel);
//     }
//
//     return healthList;
//   }
//
// //TblManageDailyStockPsaModel
//
//   Future insertTblManageDailyStockPsaModel(
//       TblManageDailyStockPsaModel tblManageDailyStockPsaModel) async {
//     await openDb();
//     return await database!.insert(
//         'tbl_manage_daily_stock_psa', tblManageDailyStockPsaModel.toJson());
//   }
//
//   Future<List<TblManageDailyStockPsaModel>>
//   getTblManageDailyStockPsaModel() async {
//     await openDb();
//     final List<Map<String, dynamic>> maps =
//     await database!.query('tbl_manage_daily_stock_psa');
//     List<TblManageDailyStockPsaModel> TblManageList = [];
//     for (var element in maps) {
//       TblManageDailyStockPsaModel tblManageDailyStockPsaModel =
//       TblManageDailyStockPsaModel.fromJson(element);
//       TblManageList.add(tblManageDailyStockPsaModel);
//     }
//
//     return TblManageList;
//   }
//
// //tbl_manage_daily_stock_concentrator_type
//   Future insertTblManageDailyStockConcentratorTypeModel(
//       TblManageDailyStockConcentratorTypeModel
//       tblManageDailyStockConcentratorTypeModel) async {
//     await openDb();
//     return await database!.insert('tbl_manage_daily_stock_concentrator_type',
//         tblManageDailyStockConcentratorTypeModel.toJson());
//   }
//
//   Future<List<TblManageDailyStockConcentratorTypeModel>>
//   getTblManageDailyStockConcentratorTypeModel() async {
//     await openDb();
//     final List<Map<String, dynamic>> maps =
//     await database!.query('tbl_manage_daily_stock_concentrator_type');
//     List<TblManageDailyStockConcentratorTypeModel> TblManageList = [];
//     for (var element in maps) {
//       TblManageDailyStockConcentratorTypeModel
//       tblManageDailyStockConcentratorTypeModel =
//       TblManageDailyStockConcentratorTypeModel.fromJson(element);
//       TblManageList.add(tblManageDailyStockConcentratorTypeModel);
//     }
//
//     return TblManageList;
//   }
//
// //tbl_manage_daily_stock_cylinder_type
//   Future insertTblManageDailyStockCylinderTypeModel(
//       TblManageDailyStockCylinderTypeModel
//       tblManageDailyStockCylinderTypeModel) async {
//     await openDb();
//     return await database!.insert('tbl_manage_daily_stock_cylinder_type',
//         tblManageDailyStockCylinderTypeModel.toJson());
//   }
//
//   Future<List<TblManageDailyStockCylinderTypeModel>>
//   getTblManageDailyStockCylinderTypeModel() async {
//     await openDb();
//     final List<Map<String, dynamic>> maps =
//     await database!.query('tbl_manage_daily_stock_cylinder_type');
//     List<TblManageDailyStockCylinderTypeModel> TblManageList = [];
//     for (var element in maps) {
//       TblManageDailyStockCylinderTypeModel
//       tblManageDailyStockCylinderTypeModel =
//       TblManageDailyStockCylinderTypeModel.fromJson(element);
//       TblManageList.add(tblManageDailyStockCylinderTypeModel);
//     }
//
//     return TblManageList;
//   }
//
// // tbl_manage_daily_stock_dura_cylinder_type
//   Future insertTblManageDailyStockDuraCylinderTypeModel(
//       TblManageDailyStockDuraCylinderTypeModel
//       tblManageDailyStockDuraCylinderTypeModel) async {
//     await openDb();
//     return await database!.insert('tbl_manage_daily_stock_dura_cylinder_type',
//         tblManageDailyStockDuraCylinderTypeModel.toJson());
//   }
//
//   Future<List<TblManageDailyStockDuraCylinderTypeModel>>
//   getTblManageDailyStockDuraCylinderTypeModel() async {
//     await openDb();
//     final List<Map<String, dynamic>> maps =
//     await database!.query('tbl_manage_daily_stock_dura_cylinder_type');
//     List<TblManageDailyStockDuraCylinderTypeModel> TblManageList = [];
//     for (var element in maps) {
//       TblManageDailyStockDuraCylinderTypeModel
//       tblManageDailyStockDuraCylinderTypeModel =
//       TblManageDailyStockDuraCylinderTypeModel.fromJson(element);
//       TblManageList.add(tblManageDailyStockDuraCylinderTypeModel);
//     }
//
//     return TblManageList;
//   }
//
// // tbl_manage_daily_stock_lmo
//   Future insertTblManageDailyStockLmoModel(
//       TblManageDailyStockLmoModel tblManageDailyStockLmoModel) async {
//     await openDb();
//     return await database!.insert(
//         'tbl_manage_daily_stock_lmo', tblManageDailyStockLmoModel.toJson());
//   }
//
//   Future<List<TblManageDailyStockLmoModel>>
//   getTblManageDailyStockLmoModel() async {
//     await openDb();
//     final List<Map<String, dynamic>> maps =
//     await database!.query('tbl_manage_daily_stock_lmo');
//     List<TblManageDailyStockLmoModel> TblManagedailyList = [];
//     for (var element in maps) {
//       TblManageDailyStockLmoModel tblManageDailyStockLmoModel =
//       TblManageDailyStockLmoModel.fromJson(element);
//       TblManagedailyList.add(tblManageDailyStockLmoModel);
//     }
//
//     return TblManagedailyList;
//   }
//
// // tbl_disease_wise_patient_occupancy
//   Future insertTblDiseaseWisePatientOccupancyModel(
//       TblDiseaseWisePatientOccupancyModel
//       tblDiseaseWisePatientOccupancyModel) async {
//     await openDb();
//     return await database!.insert('tbl_disease_wise_patient_occupancy',
//         tblDiseaseWisePatientOccupancyModel.toJson());
//   }
//
//   Future<List<TblDiseaseWisePatientOccupancyModel>>
//   getTblDiseaseWisePatientOccupancyModel() async {
//     await openDb();
//     final List<Map<String, dynamic>> maps =
//     await database!.query('tbl_disease_wise_patient_occupancy');
//     List<TblDiseaseWisePatientOccupancyModel> TbldiseasepatientList = [];
//     for (var element in maps) {
//       TblDiseaseWisePatientOccupancyModel tblDiseaseWisePatientOccupancyModel =
//       TblDiseaseWisePatientOccupancyModel.fromJson(element);
//       TbldiseasepatientList.add(tblDiseaseWisePatientOccupancyModel);
//     }
//
//     return TbldiseasepatientList;
//   }
//
// // tbl_oxygen_bed_occupancy
//   Future insertTblOxygenBedOccupancyModel(
//       TblOxygenBedOccupancyModel tblOxygenBedOccupancyModel) async {
//     await openDb();
//     return await database!.insert(
//         'tbl_oxygen_bed_occupancy', tblOxygenBedOccupancyModel.toJson());
//   }
//
//   Future<List<TblOxygenBedOccupancyModel>>
//   getTblOxygenBedOccupancyModel() async {
//     await openDb();
//     final List<Map<String, dynamic>> maps =
//     await database!.query('tbl_oxygen_bed_occupancy');
//     List<TblOxygenBedOccupancyModel> TblOxygenList = [];
//     for (var element in maps) {
//       TblOxygenBedOccupancyModel tblOxygenBedOccupancyModel =
//       TblOxygenBedOccupancyModel.fromJson(element);
//       TblOxygenList.add(tblOxygenBedOccupancyModel);
//     }
//
//     return TblOxygenList;
//   }
//
//   // mst_bed_type
//   Future insertbedtype(MstBedTypeElement Bedtype) async {
//     await openDb();
//     return await database!.insert('mst_bed_type', Bedtype.toJson());
//   }
//
//   Future<List<MstBedTypeElement>> getbedtype() async {
//     await openDb();
//     final List<Map<String, dynamic>> maps =
//     await database!.query('mst_bed_type');
//     List<MstBedTypeElement> bedTypeList = [];
//     for (var element in maps) {
//       MstBedTypeElement mstBedTypeModel = MstBedTypeElement.fromJson(element);
//       bedTypeList.add(mstBedTypeModel);
//     }
//
//     return bedTypeList;
//   }
//
//   // MstBlock
//   Future insertblock(MstBlock mstBlock) async {
//     await openDb();
//     return await database!.insert('mst_block', mstBlock.toJson());
//   }
//
//   Future<List<MstBlock>> getblock() async {
//     await openDb();
//     final List<Map<String, dynamic>> maps = await database!.query('mst_block');
//     List<MstBlock> blockList = [];
//     for (var element in maps) {
//       MstBlock mstBlock = MstBlock.fromJson(element);
//       blockList.add(mstBlock);
//     }
//
//     return blockList;
//   }
//
//   // MstConcentrator
//   Future insertMstConcentrator(MstConcentratorElement mstConcentrator) async {
//     await openDb();
//     return await database!.insert('mst_concentrator', mstConcentrator.toJson());
//   }
//
//   Future<List<MstConcentratorElement>> getMstConcentrator() async {
//     await openDb();
//     final List<Map<String, dynamic>> maps =
//     await database!.query('mst_concentrator');
//     List<MstConcentratorElement> mstConcentratorList = [];
//     for (var element in maps) {
//       MstConcentratorElement mstConcentrator =
//       MstConcentratorElement.fromJson(element);
//       mstConcentratorList.add(mstConcentrator);
//     }
//
//     return mstConcentratorList;
//   }
//
//   //MstCylinderTypeModel
//   Future insertMstCylinderTypeModel(
//       MstCylinderType mstCylinderTypeModel) async {
//     await openDb();
//     return await database!
//         .insert('mst_cylinder_type', mstCylinderTypeModel.toJson());
//   }
//
//   Future<List<MstCylinderType>> getMstCylinderTypeModel() async {
//     await openDb();
//     final List<Map<String, dynamic>> maps =
//     await database!.query('mst_cylinder_type');
//     List<MstCylinderType> cylinderTypeList = [];
//     for (var element in maps) {
//       MstCylinderType mstCylinderTypeModel = MstCylinderType.fromJson(element);
//       cylinderTypeList.add(mstCylinderTypeModel);
//     }
//
//     return cylinderTypeList;
//   }
//
//   // MstDiseaseTypeModel
//   Future inserMstDiseaseTypeModel(MstBedTypeElement mstDiseaseTypeModel) async {
//     await openDb();
//     return await database!
//         .insert('mst_disease_type', mstDiseaseTypeModel.toJson());
//   }
//
//   Future<List<MstBedTypeElement>> getMstDiseaseTypeModel() async {
//     await openDb();
//     final List<Map<String, dynamic>> maps =
//     await database!.query('mst_disease_type');
//     List<MstBedTypeElement> mstDiseaseTypeModelList = [];
//     for (var element in maps) {
//       MstBedTypeElement mstDiseaseTypeModel =
//       MstBedTypeElement.fromJson(element);
//       mstDiseaseTypeModelList.add(mstDiseaseTypeModel);
//     }
//
//     return mstDiseaseTypeModelList;
//   }
//
//   // MstDistrictBedOxygenFlowDetailsModel
//   // Future insertMstDistrictBedOxygenFlowDetailsModel(
//   //     MstDistrictBedOxygenFlowDetail
//   //         mstDistrictBedOxygenFlowDetailsModel) async {
//   //   await openDb();
//   //   return await database!.insert('mst_district_bed_oxygen_flow_details',
//   //       mstDistrictBedOxygenFlowDetailsModel.toJson());
//   // }
//
//   //
//
//   // MstDistrict
//   Future insertMstDistrict(MstDistrict mstDistrict) async {
//     await openDb();
//     return await database!.insert('mst_district', mstDistrict.toJson());
//   }
//
//   Future<List<MstDistrict>> getMstDistrict() async {
//     await openDb();
//     final List<Map<String, dynamic>> maps =
//     await database!.query('mst_district');
//     List<MstDistrict> districtList = [];
//     for (var element in maps) {
//       MstDistrict mstDistrict = MstDistrict.fromJson(element);
//       districtList.add(mstDistrict);
//     }
//
//     return districtList;
//   }
//
//   // MstFacilityBedTypeMappingModel
//   Future insertMstFacilityBedTypeMappingModel(
//       MstConcentratorElement mstFacilityBedTypeMappingModel) async {
//     await openDb();
//     return await database!.insert('mst_facility_bed_type_mapping',
//         mstFacilityBedTypeMappingModel.toJson());
//   }
//
//   Future<List<MstConcentratorElement>>
//   getMstFacilityBedTypeMappingModel() async {
//     await openDb();
//     final List<Map<String, dynamic>> maps =
//     await database!.query('mst_facility_bed_type_mapping');
//     List<MstConcentratorElement> blockList = [];
//     for (var element in maps) {
//       MstConcentratorElement mstFacilityBedTypeMappingModel =
//       MstConcentratorElement.fromJson(element);
//       blockList.add(mstFacilityBedTypeMappingModel);
//     }
//
//     return blockList;
//   }
//
//   // MstFacilityTypeModel
//   Future insertMstFacilityTypeModel(
//       MstFacilityType mstFacilityTypeModel) async {
//     await openDb();
//     return await database!
//         .insert('mst_facility_type', mstFacilityTypeModel.toJson());
//   }
//
//   Future<List<MstFacilityType>> getMstFacilityTypeModel() async {
//     await openDb();
//     final List<Map<String, dynamic>> maps =
//     await database!.query('mst_facility_type');
//     List<MstFacilityType> facilityList = [];
//     for (var element in maps) {
//       MstFacilityType mstFacilityTypeModel = MstFacilityType.fromJson(element);
//       facilityList.add(mstFacilityTypeModel);
//     }
//
//     return facilityList;
//   }
//
//   // MstGender
//   Future insertMstGender(MstGender mstGender) async {
//     await openDb();
//     return await database!.insert('mst_gender', mstGender.toJson());
//   }
//
//   Future<List<MstGender>> getMstGender() async {
//     await openDb();
//     final List<Map<String, dynamic>> maps = await database!.query('mst_gender');
//     List<MstGender> genderList = [];
//     for (var element in maps) {
//       MstGender mstGender = MstGender.fromJson(element);
//       genderList.add(mstGender);
//     }
//
//     return genderList;
//   }
//
//   //MstOwnershipModel
//   Future insertMstOwnershipModel(MstBedTypeElement mstOwnershipModel) async {
//     await openDb();
//     return await database!.insert('mst_ownership', mstOwnershipModel.toJson());
//   }
//
//   Future<List<MstBedTypeElement>> getMstOwnershipModel() async {
//     await openDb();
//     final List<Map<String, dynamic>> maps =
//     await database!.query('mst_ownership');
//     List<MstBedTypeElement> ownershipList = [];
//     for (var element in maps) {
//       MstBedTypeElement mstOwnershipModel = MstBedTypeElement.fromJson(element);
//       ownershipList.add(mstOwnershipModel);
//     }
//
//     return ownershipList;
//   }
//
//   // MstOxygenInfrastructureTypeModel
//   Future insertMstOxygenInfrastructureTypeModel(
//       MstOxygenInfrastructureTypeModel mstOxygenInfrastructureTypeModel) async {
//     await openDb();
//     return await database!.insert('mst_oxygen_infrastructure_type',
//         mstOxygenInfrastructureTypeModel.toJson());
//   }
//
//   Future<List<MstOxygenInfrastructureTypeModel>>
//   getMstOxygenInfrastructureTypeModel() async {
//     await openDb();
//     final List<Map<String, dynamic>> maps =
//     await database!.query('mst_oxygen_infrastructure_type');
//     List<MstOxygenInfrastructureTypeModel> blockList = [];
//     for (var element in maps) {
//       MstOxygenInfrastructureTypeModel mstOxygenInfrastructureTypeModel =
//       MstOxygenInfrastructureTypeModel.fromJson(element);
//       blockList.add(mstOxygenInfrastructureTypeModel);
//     }
//
//     return blockList;
//       }
}
