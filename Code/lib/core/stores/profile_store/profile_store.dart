import 'package:edublock/core/stores/error/error_store.dart';
import 'package:edublock/domain/entity/country/country.dart';
import 'package:edublock/domain/entity/user/api_response.dart';
import 'package:edublock/domain/entity/user/user.dart';
import 'package:edublock/domain/usecase/profile_details_usecase/profile_details_usecase.dart';
import 'package:mobx/mobx.dart';
import 'package:validators/validators.dart';

part 'profile_store.g.dart';

class ProfileStore = _ProfileStore with _$ProfileStore;

abstract class _ProfileStore with Store {
  _ProfileStore(this._profileDetailsUseCase,this.formErrorStore, this.errorStore) {
    _setupValidations();
  }

  final ProfileErrorStore formErrorStore;
  final ProfileDetailsUseCase _profileDetailsUseCase;
  // store for handling error messages
  final ErrorStore errorStore;

  // disposers:-----------------------------------------------------------------
  late List<ReactionDisposer> _disposers;

  void _setupValidations() {
    _disposers = [
      reaction((_) => userEmail, validateUserEmail),
      reaction((_) => baseProfile, validateBaseProfile),
      reaction((_) => country, validateCountry),
      reaction((_) => name, validateUserName),
      reaction((_) => graduation, validateGraduation),
    ];
  }

  // store variables:-----------------------------------------------------------
  @observable
  String userEmail = '';

  @observable
  List<Country> countries = [
    Country.fromJson({"country": "Afghanistan", "abbreviation": "AF"}),
    Country.fromJson({"country": "Albania", "abbreviation": "AL"}),
    Country.fromJson({"country": "Algeria", "abbreviation": "DZ"}),
    Country.fromJson({"country": "American Samoa", "abbreviation": "AS"}),
    Country.fromJson({"country": "Andorra", "abbreviation": "AD"}),
    Country.fromJson({"country": "Angola", "abbreviation": "AO"}),
    Country.fromJson({"country": "Anguilla", "abbreviation": "AI"}),
    Country.fromJson({"country": "Antarctica", "abbreviation": "AQ"}),
    Country.fromJson({"country": "Antigua and Barbuda", "abbreviation": "AG"}),
    Country.fromJson({"country": "Argentina", "abbreviation": "AR"}),
    Country.fromJson({"country": "Armenia", "abbreviation": "AM"}),
    Country.fromJson({"country": "Aruba", "abbreviation": "AW"}),
    Country.fromJson({"country": "Australia", "abbreviation": "AU"}),
    Country.fromJson({"country": "Austria", "abbreviation": "AT"}),
    Country.fromJson({"country": "Azerbaijan", "abbreviation": "AZ"}),
    Country.fromJson({"country": "Bahamas", "abbreviation": "BS"}),
    Country.fromJson({"country": "Bahrain", "abbreviation": "BH"}),
    Country.fromJson({"country": "Bangladesh", "abbreviation": "BD"}),
    Country.fromJson({"country": "Barbados", "abbreviation": "BB"}),
    Country.fromJson({"country": "Belarus", "abbreviation": "BY"}),
    Country.fromJson({"country": "Belgium", "abbreviation": "BE"}),
    Country.fromJson({"country": "Belize", "abbreviation": "BZ"}),
    Country.fromJson({"country": "Benin", "abbreviation": "BJ"}),
    Country.fromJson({"country": "Bermuda", "abbreviation": "BM"}),
    Country.fromJson({"country": "Bhutan", "abbreviation": "BT"}),
    Country.fromJson({"country": "Bolivia", "abbreviation": "BO"}),
    Country.fromJson(
        {"country": "Bosnia and Herzegovina", "abbreviation": "BA"}),
    Country.fromJson({"country": "Botswana", "abbreviation": "BW"}),
    Country.fromJson({"country": "Bouvet Island", "abbreviation": "BV"}),
    Country.fromJson({"country": "Brazil", "abbreviation": "BR"}),
    Country.fromJson(
        {"country": "British Indian Ocean Territory", "abbreviation": "IO"}),
    Country.fromJson({"country": "Brunei", "abbreviation": "BN"}),
    Country.fromJson({"country": "Bulgaria", "abbreviation": "BG"}),
    Country.fromJson({"country": "Burkina Faso", "abbreviation": "BF"}),
    Country.fromJson({"country": "Burundi", "abbreviation": "BI"}),
    Country.fromJson({"country": "Cambodia", "abbreviation": "KH"}),
    Country.fromJson({"country": "Cameroon", "abbreviation": "CM"}),
    Country.fromJson({"country": "Canada", "abbreviation": "CA"}),
    Country.fromJson({"country": "Cape Verde", "abbreviation": "CV"}),
    Country.fromJson({"country": "Cayman Islands", "abbreviation": "KY"}),
    Country.fromJson(
        {"country": "Central African Republic", "abbreviation": "CF"}),
    Country.fromJson({"country": "Chad", "abbreviation": "TD"}),
    Country.fromJson({"country": "Chile", "abbreviation": "CL"}),
    Country.fromJson({"country": "China", "abbreviation": "CN"}),
    Country.fromJson({"country": "Christmas Island", "abbreviation": "CX"}),
    Country.fromJson(
        {"country": "Cocos (Keeling) Islands", "abbreviation": "CC"}),
    Country.fromJson({"country": "Colombia", "abbreviation": "CO"}),
    Country.fromJson({"country": "Comoros", "abbreviation": "KM"}),
    Country.fromJson({"country": "Congo", "abbreviation": "CG"}),
    Country.fromJson({"country": "Cook Islands", "abbreviation": "CK"}),
    Country.fromJson({"country": "Costa Rica", "abbreviation": "CR"}),
    Country.fromJson({"country": "Croatia", "abbreviation": "HR"}),
    Country.fromJson({"country": "Cuba", "abbreviation": "CU"}),
    Country.fromJson({"country": "Cyprus", "abbreviation": "CY"}),
    Country.fromJson({"country": "Czech Republic", "abbreviation": "CZ"}),
    Country.fromJson({"country": "Denmark", "abbreviation": "DK"}),
    Country.fromJson({"country": "Djibouti", "abbreviation": "DJ"}),
    Country.fromJson({"country": "Dominica", "abbreviation": "DM"}),
    Country.fromJson({"country": "Dominican Republic", "abbreviation": "DO"}),
    Country.fromJson({"country": "East Timor", "abbreviation": "TP"}),
    Country.fromJson({"country": "Ecuador", "abbreviation": "EC"}),
    Country.fromJson({"country": "Egypt", "abbreviation": "EG"}),
    Country.fromJson({"country": "El Salvador", "abbreviation": "SV"}),
    Country.fromJson({"country": "Equatorial Guinea", "abbreviation": "GQ"}),
    Country.fromJson({"country": "Eritrea", "abbreviation": "ER"}),
    Country.fromJson({"country": "Estonia", "abbreviation": "EE"}),
    Country.fromJson({"country": "Ethiopia", "abbreviation": "ET"}),
    Country.fromJson({"country": "Falkland Islands", "abbreviation": "FK"}),
    Country.fromJson({"country": "Faroe Islands", "abbreviation": "FO"}),
    Country.fromJson({"country": "Fiji Islands", "abbreviation": "FJ"}),
    Country.fromJson({"country": "Finland", "abbreviation": "FI"}),
    Country.fromJson({"country": "France", "abbreviation": "FR"}),
    Country.fromJson({"country": "French Guiana", "abbreviation": "GF"}),
    Country.fromJson({"country": "French Polynesia", "abbreviation": "PF"}),
    Country.fromJson(
        {"country": "French Southern territories", "abbreviation": "TF"}),
    Country.fromJson({"country": "Gabon", "abbreviation": "GA"}),
    Country.fromJson({"country": "Gambia", "abbreviation": "GM"}),
    Country.fromJson({"country": "Georgia", "abbreviation": "GE"}),
    Country.fromJson({"country": "Germany", "abbreviation": "DE"}),
    Country.fromJson({"country": "Ghana", "abbreviation": "GH"}),
    Country.fromJson({"country": "Gibraltar", "abbreviation": "GI"}),
    Country.fromJson({"country": "Greece", "abbreviation": "GR"}),
    Country.fromJson({"country": "Greenland", "abbreviation": "GL"}),
    Country.fromJson({"country": "Grenada", "abbreviation": "GD"}),
    Country.fromJson({"country": "Guadeloupe", "abbreviation": "GP"}),
    Country.fromJson({"country": "Guam", "abbreviation": "GU"}),
    Country.fromJson({"country": "Guatemala", "abbreviation": "GT"}),
    Country.fromJson({"country": "Guernsey", "abbreviation": "GG"}),
    Country.fromJson({"country": "Guinea", "abbreviation": "GN"}),
    Country.fromJson({"country": "Guinea-Bissau", "abbreviation": "GW"}),
    Country.fromJson({"country": "Guyana", "abbreviation": "GY"}),
    Country.fromJson({"country": "Haiti", "abbreviation": "HT"}),
    Country.fromJson(
        {"country": "Heard Island and McDonald Islands", "abbreviation": "HM"}),
    Country.fromJson(
        {"country": "Holy See (Vatican City State)", "abbreviation": "VA"}),
    Country.fromJson({"country": "Honduras", "abbreviation": "HN"}),
    Country.fromJson({"country": "Hong Kong", "abbreviation": "HK"}),
    Country.fromJson({"country": "Hungary", "abbreviation": "HU"}),
    Country.fromJson({"country": "Iceland", "abbreviation": "IS"}),
    Country.fromJson({"country": "India", "abbreviation": "IN"}),
    Country.fromJson({"country": "Indonesia", "abbreviation": "ID"}),
    Country.fromJson({"country": "Iran", "abbreviation": "IR"}),
    Country.fromJson({"country": "Iraq", "abbreviation": "IQ"}),
    Country.fromJson({"country": "Ireland", "abbreviation": "IE"}),
    Country.fromJson({"country": "Isle of Man", "abbreviation": "IM"}),
    Country.fromJson({"country": "Israel", "abbreviation": "IL"}),
    Country.fromJson({"country": "Italy", "abbreviation": "IT"}),
    Country.fromJson({"country": "Ivory Coast", "abbreviation": "CI"}),
    Country.fromJson({"country": "Jamaica", "abbreviation": "JM"}),
    Country.fromJson({"country": "Japan", "abbreviation": "JP"}),
    Country.fromJson({"country": "Jersey", "abbreviation": "JE"}),
    Country.fromJson({"country": "Jordan", "abbreviation": "JO"}),
    Country.fromJson({"country": "Kazakhstan", "abbreviation": "KZ"}),
    Country.fromJson({"country": "Kenya", "abbreviation": "KE"}),
    Country.fromJson({"country": "Kiribati", "abbreviation": "KI"}),
    Country.fromJson({"country": "Kuwait", "abbreviation": "KW"}),
    Country.fromJson({"country": "Kyrgyzstan", "abbreviation": "KG"}),
    Country.fromJson({"country": "Laos", "abbreviation": "LA"}),
    Country.fromJson({"country": "Latvia", "abbreviation": "LV"}),
    Country.fromJson({"country": "Lebanon", "abbreviation": "LB"}),
    Country.fromJson({"country": "Lesotho", "abbreviation": "LS"}),
    Country.fromJson({"country": "Liberia", "abbreviation": "LR"}),
    Country.fromJson(
        {"country": "Libyan Arab Jamahiriya", "abbreviation": "LY"}),
    Country.fromJson({"country": "Liechtenstein", "abbreviation": "LI"}),
    Country.fromJson({"country": "Lithuania", "abbreviation": "LT"}),
    Country.fromJson({"country": "Luxembourg", "abbreviation": "LU"}),
    Country.fromJson({"country": "Macao", "abbreviation": "MO"}),
    Country.fromJson({"country": "North Macedonia", "abbreviation": "MK"}),
    Country.fromJson({"country": "Madagascar", "abbreviation": "MG"}),
    Country.fromJson({"country": "Malawi", "abbreviation": "MW"}),
    Country.fromJson({"country": "Malaysia", "abbreviation": "MY"}),
    Country.fromJson({"country": "Maldives", "abbreviation": "MV"}),
    Country.fromJson({"country": "Mali", "abbreviation": "ML"}),
    Country.fromJson({"country": "Malta", "abbreviation": "MT"}),
    Country.fromJson({"country": "Marshall Islands", "abbreviation": "MH"}),
    Country.fromJson({"country": "Martinique", "abbreviation": "MQ"}),
    Country.fromJson({"country": "Mauritania", "abbreviation": "MR"}),
    Country.fromJson({"country": "Mauritius", "abbreviation": "MU"}),
    Country.fromJson({"country": "Mayotte", "abbreviation": "YT"}),
    Country.fromJson({"country": "Mexico", "abbreviation": "MX"}),
    Country.fromJson(
        {"country": "Micronesia, Federated States of", "abbreviation": "FM"}),
    Country.fromJson({"country": "Moldova", "abbreviation": "MD"}),
    Country.fromJson({"country": "Monaco", "abbreviation": "MC"}),
    Country.fromJson({"country": "Mongolia", "abbreviation": "MN"}),
    Country.fromJson({"country": "Montenegro", "abbreviation": "ME"}),
    Country.fromJson({"country": "Montserrat", "abbreviation": "MS"}),
    Country.fromJson({"country": "Morocco", "abbreviation": "MA"}),
    Country.fromJson({"country": "Mozambique", "abbreviation": "MZ"}),
    Country.fromJson({"country": "Myanmar", "abbreviation": "MM"}),
    Country.fromJson({"country": "Namibia", "abbreviation": "NA"}),
    Country.fromJson({"country": "Nauru", "abbreviation": "NR"}),
    Country.fromJson({"country": "Nepal", "abbreviation": "NP"}),
    Country.fromJson({"country": "Netherlands", "abbreviation": "NL"}),
    Country.fromJson({"country": "Netherlands Antilles", "abbreviation": "AN"}),
    Country.fromJson({"country": "New Caledonia", "abbreviation": "NC"}),
    Country.fromJson({"country": "New Zealand", "abbreviation": "NZ"}),
    Country.fromJson({"country": "Nicaragua", "abbreviation": "NI"}),
    Country.fromJson({"country": "Niger", "abbreviation": "NE"}),
    Country.fromJson({"country": "Nigeria", "abbreviation": "NG"}),
    Country.fromJson({"country": "Niue", "abbreviation": "NU"}),
    Country.fromJson({"country": "Norfolk Island", "abbreviation": "NF"}),
    Country.fromJson({"country": "North Korea", "abbreviation": "KP"}),
    Country.fromJson({"country": "Northern Ireland", "abbreviation": "GB"}),
    Country.fromJson(
        {"country": "Northern Mariana Islands", "abbreviation": "MP"}),
    Country.fromJson({"country": "Norway", "abbreviation": "NO"}),
    Country.fromJson({"country": "Oman", "abbreviation": "OM"}),
    Country.fromJson({"country": "Pakistan", "abbreviation": "PK"}),
    Country.fromJson({"country": "Palau", "abbreviation": "PW"}),
    Country.fromJson({"country": "Palestine", "abbreviation": "PS"}),
    Country.fromJson({"country": "Panama", "abbreviation": "PA"}),
    Country.fromJson({"country": "Papua New Guinea", "abbreviation": "PG"}),
    Country.fromJson({"country": "Paraguay", "abbreviation": "PY"}),
    Country.fromJson({"country": "Peru", "abbreviation": "PE"}),
    Country.fromJson({"country": "Philippines", "abbreviation": "PH"}),
    Country.fromJson({"country": "Pitcairn", "abbreviation": "PN"}),
    Country.fromJson({"country": "Poland", "abbreviation": "PL"}),
    Country.fromJson({"country": "Portugal", "abbreviation": "PT"}),
    Country.fromJson({"country": "Puerto Rico", "abbreviation": "PR"}),
    Country.fromJson({"country": "Qatar", "abbreviation": "QA"}),
    Country.fromJson({"country": "Reunion", "abbreviation": "RE"}),
    Country.fromJson({"country": "Romania", "abbreviation": "RO"}),
    Country.fromJson({"country": "Russian Federation", "abbreviation": "RU"}),
    Country.fromJson({"country": "Rwanda", "abbreviation": "RW"}),
    Country.fromJson({"country": "Saint Helena", "abbreviation": "SH"}),
    Country.fromJson(
        {"country": "Saint Kitts and Nevis", "abbreviation": "KN"}),
    Country.fromJson({"country": "Saint Lucia", "abbreviation": "LC"}),
    Country.fromJson(
        {"country": "Saint Pierre and Miquelon", "abbreviation": "PM"}),
    Country.fromJson(
        {"country": "Saint Vincent and the Grenadines", "abbreviation": "VC"}),
    Country.fromJson({"country": "Samoa", "abbreviation": "WS"}),
    Country.fromJson({"country": "San Marino", "abbreviation": "SM"}),
    Country.fromJson(
        {"country": "Sao Tome and Principe", "abbreviation": "ST"}),
    Country.fromJson({"country": "Saudi Arabia", "abbreviation": "SA"}),
    Country.fromJson({"country": "Senegal", "abbreviation": "SN"}),
    Country.fromJson({"country": "Serbia", "abbreviation": "RS"}),
    Country.fromJson({"country": "Seychelles", "abbreviation": "SC"}),
    Country.fromJson({"country": "Sierra Leone", "abbreviation": "SL"}),
    Country.fromJson({"country": "Singapore", "abbreviation": "SG"}),
    Country.fromJson({"country": "Slovakia", "abbreviation": "SK"}),
    Country.fromJson({"country": "Slovenia", "abbreviation": "SI"}),
    Country.fromJson({"country": "Solomon Islands", "abbreviation": "SB"}),
    Country.fromJson({"country": "Somalia", "abbreviation": "SO"}),
    Country.fromJson({"country": "South Africa", "abbreviation": "ZA"}),
    Country.fromJson({
      "country": "South Georgia and the South Sandwich Islands",
      "abbreviation": "GS"
    }),
    Country.fromJson({"country": "South Korea", "abbreviation": "KR"}),
    Country.fromJson({"country": "South Sudan", "abbreviation": "SS"}),
    Country.fromJson({"country": "Spain", "abbreviation": "ES"}),
    Country.fromJson({"country": "Sri Lanka", "abbreviation": "LK"}),
    Country.fromJson({"country": "Sudan", "abbreviation": "SD"}),
    Country.fromJson({"country": "Suriname", "abbreviation": "SR"}),
    Country.fromJson(
        {"country": "Svalbard and Jan Mayen", "abbreviation": "SJ"}),
    Country.fromJson({"country": "Swaziland", "abbreviation": "SZ"}),
    Country.fromJson({"country": "Sweden", "abbreviation": "SE"}),
    Country.fromJson({"country": "Switzerland", "abbreviation": "CH"}),
    Country.fromJson({"country": "Syria", "abbreviation": "SY"}),
    Country.fromJson({"country": "Tajikistan", "abbreviation": "TJ"}),
    Country.fromJson({"country": "Tanzania", "abbreviation": "TZ"}),
    Country.fromJson({"country": "Thailand", "abbreviation": "TH"}),
    Country.fromJson(
        {"country": "The Democratic Republic of Congo", "abbreviation": "CD"}),
    Country.fromJson({"country": "Timor-Leste", "abbreviation": "TL"}),
    Country.fromJson({"country": "Togo", "abbreviation": "TG"}),
    Country.fromJson({"country": "Tokelau", "abbreviation": "TK"}),
    Country.fromJson({"country": "Tonga", "abbreviation": "TO"}),
    Country.fromJson({"country": "Trinidad and Tobago", "abbreviation": "TT"}),
    Country.fromJson({"country": "Tunisia", "abbreviation": "TN"}),
    Country.fromJson({"country": "Turkey", "abbreviation": "TR"}),
    Country.fromJson({"country": "Turkmenistan", "abbreviation": "TM"}),
    Country.fromJson(
        {"country": "Turks and Caicos Islands", "abbreviation": "TC"}),
    Country.fromJson({"country": "Tuvalu", "abbreviation": "TV"}),
    Country.fromJson({"country": "Uganda", "abbreviation": "UG"}),
    Country.fromJson({"country": "Ukraine", "abbreviation": "UA"}),
    Country.fromJson({"country": "United Arab Emirates", "abbreviation": "AE"}),
    Country.fromJson({
      "country": "United Kingdom of Great Britain and Northern Ireland",
      "abbreviation": "GB"
    }),
    Country.fromJson({"country": "United States", "abbreviation": "US"}),
    Country.fromJson({
      "country": "United States Minor Outlying Islands",
      "abbreviation": "UM"
    }),
    Country.fromJson({"country": "Uruguay", "abbreviation": "UY"}),
    Country.fromJson({"country": "Uzbekistan", "abbreviation": "UZ"}),
    Country.fromJson({"country": "Vanuatu", "abbreviation": "VU"}),
    Country.fromJson({"country": "Venezuela", "abbreviation": "VE"}),
    Country.fromJson({"country": "Vietnam", "abbreviation": "VN"}),
    Country.fromJson(
        {"country": "Virgin Islands, British", "abbreviation": "VG"}),
    Country.fromJson({"country": "Virgin Islands, U.S.", "abbreviation": "VI"}),
    Country.fromJson({"country": "Wallis and Futuna", "abbreviation": "WF"}),
    Country.fromJson({"country": "Western Sahara", "abbreviation": "EH"}),
    Country.fromJson({"country": "Yemen", "abbreviation": "YE"}),
    Country.fromJson({"country": "Zambia", "abbreviation": "ZM"}),
    Country.fromJson({"country": "Zimbabwe", "abbreviation": "ZW"})
  ];

  @observable
  Country selectedCountry = Country(country: "Greece", abbreviation: "GR");

  @observable
  String name = '';

  @observable
  String baseProfile = '';

  @observable
  String country = '';

  @observable
  String graduation = '';

  @action
  void setUserEmail(String value) {
    userEmail = value;
  }

  @action
  void setName(String value) {
    name = value;
  }

  @action
  void setBaseProfile(String value) {
    baseProfile = value;
  }

  @action
  void setCountry(Country value) {
    selectedCountry = value;
  }

  @action
  void setGraduation(String value) {
    graduation = value;
  }

  @action
  void validateUserEmail(String value) {
    if (value.isEmpty) {
      formErrorStore.emailError = "Email can't be empty";
    } else if (!isEmail(value)) {
      formErrorStore.emailError = 'Please enter a valid email address';
    } else {
      formErrorStore.emailError = null;
    }
  }

  @action
  void validateUserName(String value) {
    // RegExp fullNameRegExp = RegExp(r"^[a-zA-Z]$");

    if (value.isEmpty) {
      formErrorStore.userNameError = "Name can't be empty";
    } else {
      formErrorStore.userNameError = null;
    }
  }

  @action
  void validateBaseProfile(String value) {
    // RegExp fullNameRegExp = RegExp(r"^[a-zA-Z]$");

    if (value.isEmpty) {
      formErrorStore.baseProfileError = "BaseProfile can't be empty";
    } else {
      formErrorStore.baseProfileError = null;
    }
  }

  @action
  void validateCountry(String value) {
    // RegExp fullNameRegExp = RegExp(r"^[a-zA-Z]$");

    if (value.isEmpty) {
      formErrorStore.countryError = "Country can't be empty";
    } else {
      formErrorStore.countryError = null;
    }
  }

  @action
  void validateGraduation(String value) {
    // RegExp fullNameRegExp = RegExp(r"^[a-zA-Z]$");

    if (value.isEmpty) {
      formErrorStore.graduationError = "Graduation  can't be empty";
    } else {
      formErrorStore.graduationError = null;
    }
  }

  void validateAll() {
    validateGraduation(graduation);
    validateUserEmail(userEmail);
    validateUserName(name);
    validateBaseProfile(baseProfile);
    validateCountry(country);
  }

  static ObservableFuture<ApiResponse?>
  emptyProfileDetailsResponse = ObservableFuture.value(null);


  @observable
  ObservableFuture<ApiResponse?> profileDetailsFuture =
      emptyProfileDetailsResponse;

  @computed
  bool get isProfileDetails => profileDetailsFuture.status == FutureStatus.pending;

  @observable
  // Observable<User> userDetails = Observable<User>;




  // @action
  // void setCertificateLists(Certificate value) {
  //   certificateLists.add(value);
  // }
  @observable
  User? currentUser;



  @action
  Future getProfileDetails(String email) async {
    try {
      final ProfileDetailsParams profileDetailsParams =
      ProfileDetailsParams(email:email);
      final future = _profileDetailsUseCase.call(params:profileDetailsParams );
      profileDetailsFuture = ObservableFuture(future);

      ApiResponse? value = await future;
      if (value!.success) {
         print('check api response are here ${value.data}');

          if(value != null && value.data!=null){
            print('check user details are here ::: ${value.data}');
            // currentUser = User(id: value.data!['user']['id'], email: value.data!['user']['email'], name: value.data!['user']['name'], createdAt: DateTime.parse(value.data!['user']['createdAt']), updatedAt: DateTime.parse(value.data!['user']['updatedAt']), status: value.data!['user']['status'],);
            currentUser = User.fromJson({...?value.data});


          }

      }

    } catch (error) {
      // this.success = false;

      rethrow;
    }

  }




}

class ProfileErrorStore = _ProfileErrorStore with _$ProfileErrorStore;

abstract class _ProfileErrorStore with Store {
  String? emailError;
  String? userNameError;
  String? baseProfileError;
  String? countryError;
  String? graduationError;
}
