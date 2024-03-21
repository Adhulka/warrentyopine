import 'package:warrentyopine/Utils/HiveDb.dart';

class ApiData {


  static dynamic getHeaders(){
    var ss={
      // 'Content-Type': 'application/json',
      'token': HiveDb.getToken(),

    };
    return ss;
  }
  static String baseUrl = "https://gateway.opine.co.in/api/";

  static String login = baseUrl + "login";
  static String forgetPass = baseUrl + "sendForgetMail";
  static String checkOtp = baseUrl + "check-otp";
  static String saveRestPass = baseUrl + "save-reset-pass";
  static String serviceCenterSignup = baseUrl + "Service-Center-Signup";
  static String addServiceCenter = baseUrl+ "Add-Service-Center";
  static String editServiceCenter =baseUrl+"Edit-Service-Center";
  static String serviceCenterProfile=baseUrl+"Service-Center-Profile";
  static String addClaimRegistration=baseUrl+"Add-Claim-Registration";
  static String allTypewiseClaimRegistration=baseUrl+"All-Typewise-Claim-Registration";
  static String updateClaimWarrentyStatus=baseUrl+"Update-Claim-Warrenty-Status";
  static String getClaimBySerialno=baseUrl+"Get-Claim-By-Serialno";
  static String savePassword=baseUrl+"save-password";
  static String validateSerialNo=baseUrl+"Validate-Serialno/99";
  static String getClaimRegistration=baseUrl+"Get-Claim-Registration";










}
