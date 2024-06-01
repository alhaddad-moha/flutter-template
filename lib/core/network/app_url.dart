
abstract class AppUrls{
  static const aboutCompany = "WhoWeAre/GetForHomePage";
}

abstract class AuthUrls {
  static const _root = "User/";
  static const login = "${_root}SignIn";
  static const forgotPassword = "${_root}ForgetPassword";
  static const checkOtp = "${_root}CheckOtp";
  static const changePassword = "${_root}ChangePassword";
  static const checkIfVerified = "${_root}IfVerified";
  static const resendOtp = "SMS/ReSendOTP";
  static const refreshToken = "https://btm.tagtech.site/api/User/RefreshToken";
}

abstract class PublicListUrls {

  static const _root = "PublicList/";
  static const getAllCountries = "${_root}GetAllCounties";
  static getAllCitiesBuCountyCode({required String countyCode}) => "${_root}GetByCode/$countyCode";
}


abstract class OrdersUrls {

  static const _root = "Order/";
  static const createNewOrder = "${_root}MakeAnOrder";
  static const allActiveOrders = "${_root}GetCustomerOrders";
  static const ordersHistory = "${_root}GetCustomerHistoryOperations";
  static const ordersArchives = "${_root}GetTechnicianOrdersArchive";
  static const technicalOrders = "${_root}GetTechnicianOrders";
  static const allDevicesOrders = "${_root}GetCustomerOrderedDevice";
  static allOrderDeviceParts({required int orderId}) => "${_root}GetCustomerPartDetails/$orderId";
  static allOrderItems({required int orderId}) => "${_root}GetOrderItemsByOrderId/$orderId";
  static getTechnicalOrderDetails({required int orderId}) => "${_root}GetOrderDetails/$orderId";
  static const requestCancelOrder = "${_root}PrepaireCancelOrderByTechnician";
  static const closeOrderByTechnician = "${_root}CloseOrderByTechnician";
  static const rejectOrder = "${_root}PrepaireToCloseOrder";
  static const uploadOrderFile = "${_root}UploadOrderFile";
}
abstract class CategoriesUrls {

  static const _root = "Category/";
  static const getAppCategories = "${_root}AppGetCategories";
}

abstract class CustomerUrls {
  static const _root = "Customer/";
  static const getUserInfo = "${_root}GetCustomerDetails";
  static const updateUserInfo = "${_root}Update";
}

abstract class EmployeeUrls {
  static const _root = "Employee/";
  static const getEmployeeInfo = "${_root}GetEmployee";
  static const updateEmployeeInfo = "${_root}Update";
}


abstract class ProductUrls{

  static const _root = "Temp/";
  static const getAllProduct = "${_root}AppGetAllProduct";
  static  getProductParts({required int productId}) => "${_root}GetProductPartsById/$productId";
  static  getProductFeatures({required int productId}) => "${_root}GetProductFeaturesById/$productId";
  static  getProductAccessories({required int productId}) => "${_root}GetProductAccessoriesById/$productId";
  static const getAllServiceType = "${_root}GetAllServiceType";
}