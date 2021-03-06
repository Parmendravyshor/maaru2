import 'package:kiwi/kiwi.dart';
import 'package:maru/core/data/datasource/shared_pref_helper.dart';

SharedPrefHelper _prefHelper = KiwiContainer().resolve<SharedPrefHelper>();
class MaruConstant {

  // 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
   static final signup =Uri.parse ('http://18.191.199.31/api/auth/signup');
   static final vaccineRecordUploaded = Uri.parse('http://18.191.199.31/api/pets/upload-vaccine-record');
   static final updateprofile1 = _prefHelper.getIntByKey('id', id).toString();

   static final savepet1 =Uri.parse ('http://18.191.199.31/api/pets/${updateprofile1.toString()}');

   static final getproviders =Uri.parse ('http://18.191.199.31/api/public/providers?page=1&limit=100&service=&rating=');
   static final getReview =Uri.parse ('http://18.191.199.31/api/company/reviews');
   static final getProviderRequest = Uri.parse('http://18.191.199.31/api/bookings/appointment-requests?name=&service=&provider=&date=&page=1&limit=5');
   static final getSinglePetProfile = Uri.parse('http://18.191.199.31/api/pets/$updateprofile1');
   static final  providerbookingappointment = Uri.parse('http://18.191.199.31/api/bookings');
   static final resend =Uri.parse ('http://18.191.199.31/api/auth/re-send-otp');
   static final   reset =Uri.parse ('http://18.191.199.31/api/auth/forget-password');
   static final signin = Uri.parse('http://18.191.199.31/api/auth/signin');
   static final createpProfile = Uri.parse('http://18.191.199.31/api/pets?pet_name=');
  //static var signin = Uri.parse('$BASE_URL/signin');
   static final verify = Uri.parse('http://18.191.199.31/api/auth/verify-otp');
   static final forgetverify = Uri.parse('http://18.191.199.31/api/auth/re-send-otp-forgot');
   static final setNewPasword = Uri.parse('http://18.191.199.31/api/auth/update-password');
   static final saveUserPayment = Uri.parse('http://18.191.199.31/api/user/card-details');
   static final changePassword = Uri.parse('http://18.191.199.31/api/user/change-password');
   static final createUserProfile = Uri.parse('http://18.191.199.31/api/user');
   static String firstName = 'first_name';
   static String petName = 'pet_name';
   static String breedType = 'breed_type';
  // static String token = 'access-token';
   static var  age = 'age ';
   static String  city = 'city';
   static String  zipcode = 'zipcode';
   static String   phoneNO = 'phone_no';
   static String   state = 'state';
   static String   img = 'img';
   static String   operationsHours = 'operation_hours';
   static String   reviewsComment = 'review_comment';
   static String   description = 'description';
   static String  ratingReviews = ' rating_reviews ';
   static String weight ='weight';
   static String height ='height';
   static String knownAllergies ='known_allergies';
   static var vaccine = 'vaccine';
   static String petNeeds ='pet_needs';
   static String birthdate ='birth_date';
   static var sex = 'sex';
   static String gender = 'gender';
   static String walkingSchedule ='walking_schedule';
   static String feedingSchedule ='feeding_schedule';
   static String temperament ='temperament';
   static String companyName ='company_name';
   static String ratings ='ratings';
   static String medication = 'medication';
   static String name ='name';
//static String img ='img';
   static var timesADay ='times_a_day';
   static String note ='note';
   static String lastName = 'last_name';
   static String otp = 'otp';
   static String nameOnCard = 'name_on_card';
   static String credit_card_no = 'credit_card_no';
   static String exp_date = 'exp_date';
   static String cvv = 'cvv';
   static String email = 'email';
   static String current_password   = 'current_password';
   static String change_password = 'change_password';
   static String password = 'password';
   static String code = 'code';

   static String user_type = 'user_type';
   static String token = "accessToken";
   static String poolid = "us-east-2_util3hX7I";
   static String clientid = "3g1dvuoeeqapu83orgenb5f3cp";

  static int get id => null;
}

const String BASE_URL = 'http://18.191.199.31/api/auth';
