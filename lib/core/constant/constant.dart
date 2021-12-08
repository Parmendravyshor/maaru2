import 'package:maru/features/verify/presentation/pet_profile_bloc.dart';

class MaruConstant {
  // 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
   static final signup =Uri.parse ('http://18.191.199.31/api/auth/signup');
   static final savepet1 =Uri.parse ('http://18.191.199.31/api/auth/1');
   static final resend =Uri.parse ('http://18.191.199.31/api/auth/re-send-otp');
   static final reset =Uri.parse ('http://18.191.199.31/api/auth/forget-password');
   static final signin = Uri.parse('http://18.191.199.31/api/auth/signin');
   static final createpProfile = Uri.parse('http://18.191.199.31/api/pets');
  //static var signin = Uri.parse('$BASE_URL/signin');
   static final verify = Uri.parse('http://18.191.199.31/api/auth/verify-otp');
   static final forgetverify = Uri.parse('http://18.191.199.31/api/auth/re-send-otp-forgot');
   static final setNewPasword = Uri.parse('http://18.191.199.31/api/auth/update-password');
   static final saveUserPayment = Uri.parse('http://18.191.199.31/api/user/card-details');
   static final changePassword = Uri.parse('http://18.191.199.31/api/user/change-password');
   static final createUserProfilr = Uri.parse('http://18.191.199.31/api/auth/user');
   static String first_name = 'first_name';
   static String pet_name = 'pet_name';
   static String breed_type = 'breed_type';
  // static String token = 'access-token';
   static String  age = 'age ';
   static String modelendpoint =
       "xhcz7a3myc.execute-api.us-east-2.amazonaws.com";
   static String corePath = "chadbotcore";
   static String  city = 'city';
   static String  zip = 'zip';
   static String   phone_number = 'phone_number';
   static String   state = 'state';
   static String   img = 'img';
   static String weight ='weight';
   static String height ='height';
   static String known_allergies ='known_allergies';
   static String pet_needs ='pet_needs';
   static String birth_date ='birth_date';
   static String sex = 'sex';
   static String gender = 'gender';
   static String walking_schedule ='walking_schedule';
   static String feeding_schedule ='feeding_schedule';
   static String temperament ='temperament';
   static String medication = 'medication';
   static String name ='name';
//static String img ='img';
   static String times_a_day ='times_a_day';
   static String note ='note';
   static String last_name = 'last_name';
   static String otp = 'otp';
   static String name_on_card = 'name_on_card';
   static String credit_card_no = 'credit_card_no';
   static String exp_date = 'exp_date';
   static String cvv = 'cvv';
   static String email = 'email';
   static String current_password   = 'current_password';
   static String change_password = 'change_password';
   static String password = 'password';
   static String code = 'code';
   static String id = 'id';
   static String user_type = 'user_type';
   static String token = "accessToken";
   static String poolid = "us-east-2_util3hX7I";
   static String clientid = "3g1dvuoeeqapu83orgenb5f3cp";
}

const String BASE_URL = 'http://18.191.199.31/api/auth';
