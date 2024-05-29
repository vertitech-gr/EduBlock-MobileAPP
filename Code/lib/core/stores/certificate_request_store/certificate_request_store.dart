import 'package:edublock/domain/entity/certificates/certificat_list.dart';
import 'package:edublock/domain/entity/certificates/certificate.dart';
import 'package:edublock/domain/entity/department/department.dart';
import 'package:edublock/domain/entity/department/department_lists.dart';
import 'package:edublock/domain/entity/outgoing-request/outgoing_request.dart';
import 'package:edublock/domain/entity/outgoing-request/student_request_lists.dart';
import 'package:edublock/domain/entity/recieved_request/recieved_request.dart';
import 'package:edublock/domain/entity/recieved_request/recieved_request_lists.dart';
import 'package:edublock/domain/entity/university/university.dart';
import 'package:edublock/domain/entity/university/university_lists.dart';
import 'package:edublock/domain/entity/user/api_response.dart';
import 'package:edublock/domain/usecase/certificate_request/certifcate_pdf_link_by_id_usecase/certificate_pdf_link_by_id_usecase.dart';
import 'package:edublock/domain/usecase/certificate_request/create_certificate_request_usecase.dart';
import 'package:edublock/domain/usecase/certificate_request/employees_request_declined_usecase/employees_request_declined_usecase.dart';
import 'package:edublock/domain/usecase/certificate_request/envelopes_link_by_id_usecase/envelopes_link_by_id_usecase.dart';
import 'package:edublock/domain/usecase/certificate_request/get_all_request_usecase.dart';
import 'package:edublock/domain/usecase/certificate_request/get_certificate_usecase.dart';
import 'package:edublock/domain/usecase/certificate_request/get_department_list_by_id_usecase.dart';
import 'package:edublock/domain/usecase/certificate_request/get_university_list_usecase.dart';
import 'package:edublock/domain/usecase/certificate_request/share_certificate_usecase.dart';
import 'package:edublock/domain/usecase/student_request/student_request_usecase.dart';
import 'package:mobx/mobx.dart';

part 'certificate_request_store.g.dart';

class CertificateRequestStore = _CertificateRequestStore
    with _$CertificateRequestStore;

abstract class _CertificateRequestStore with Store {
  _CertificateRequestStore(
      this._certificateUseCase,
      this._getUniversityListsUseCase,
      this._shareCertificateUseCase,
      this._createCertificateRequestUseCase,
      this._getDepartmentListsByIDUseCase,
      this._getAllRequestUseCase,
      this._certificatePdfLinkIDUseCase,
      this._envelopesLinkIDUseCase,
      this._employeesRequestDeclinedUseCase,this._studentRequestUseCase);

  // use cases:-----------------------------------------------------------------
  final GetCertificateListsUseCase _certificateUseCase;
  final GetUniversityListsUseCase _getUniversityListsUseCase;
  final ShareCertificateUseCase _shareCertificateUseCase;
  final CreateCertificateRequestUseCase _createCertificateRequestUseCase;
  final GetDepartmentListsByIDUseCase _getDepartmentListsByIDUseCase;
  final GetAllRequestUseCase _getAllRequestUseCase;
  final CertificatePdfLinkIDUseCase _certificatePdfLinkIDUseCase;
  final EnvelopesLinkIDUseCase _envelopesLinkIDUseCase;
  final EmployeesRequestDeclinedUseCase _employeesRequestDeclinedUseCase;
  final StudentRequestUseCase _studentRequestUseCase;

  // store variables:-----------------------------------------------------------

  @observable
  String? senderEmail;

  @observable
  int currentPage=1;



  @observable
  String? receiverEmail;

  @observable
  List<CertificateDetails> selectedCertificate = [];

  @observable
  List<dynamic> envelopesList = [];

  @observable
  String? envelopeName;

  @observable
  bool isPayingInAdvance = false;

  @observable
  bool isSplitPayment = false;

  @observable
  bool isReceiverPay = false;

  @observable
  University? selectUniversity;

  @observable
  Department? selectDepartment;

  @observable
  String? selectedYears = "1978";

  @observable
  String shareCertificateID = '';

  @action
  void setShareCertificateID(String value) {
    shareCertificateID = value;
  }

  // @observable

  @action
  void setSelectYears(String value) {
    selectedYears = value;
  }
  @action
  void changePageNumber() {
    currentPage = currentPage+1;
  }

  @action
  void setSelectUniversity(University value) {
    selectUniversity = value;
  }

  @action
  void setSelectDepartment(Department value) {
    selectDepartment = value;
  }

  @action
  void setSenderEmail(String value) {
    senderEmail = value;
  }

  @action
  void setReceiverEmail(String value) {
    receiverEmail = value;
  }

  @action
  void setIsReceiverPay(bool value) {
    isReceiverPay = value;
  }

  @action
  void setIsPayingInAdvance(bool value) {
    isPayingInAdvance = value;
  }

  @action
  void setIsSplitPayment(bool value) {
    isSplitPayment = value;
  }

  @action
  void setSelectedCertificate(CertificateDetails value) {
    selectedCertificate.add(value);
  }

  void removeSelectedCertificate() {
    selectedCertificate.clear();
  }

  @action
  void removeSelectedCertificateID(CertificateDetails value) {
    selectedCertificate.remove(value);
  }

  @computed
  int get selectedCertificateLength => selectedCertificate.length;

  static ObservableFuture<CertificateLists?> emptyCertificateListResponse =
      ObservableFuture.value(null);

  @observable
  ObservableFuture<CertificateLists?> certificateListsFuture =
      emptyCertificateListResponse;

  @computed
  bool get isCertificateLoading =>
      certificateListsFuture.status == FutureStatus.pending;

  @observable
  ObservableList<Certificate> certificateLists =
      new ObservableList<Certificate>();

  @action
  void setCertificateLists(Certificate value) {
    certificateLists.add(value);
  }

  @action
  Future getCertificateLists(String? id) async {
    try {
      final GetCertificateListParams getCertificateListParams =
          GetCertificateListParams(userProfileID: id);
      final future = _certificateUseCase.call(params: getCertificateListParams);
      certificateListsFuture = ObservableFuture(future);

      CertificateLists? value = await future;
      if (value != null && value.certificates != null) {
        // Clear existing data before adding new data
        certificateLists.clear();
        value.certificates?.forEach((Certificate element) {
          certificateLists.add(element);
        });
      }
    } catch (error) {
      // this.success = false;
      rethrow;
    }
  }

  @observable
  ObservableList<University> universityLists = new ObservableList<University>();

  static ObservableFuture<UniversityLists?> emptyUniversityListResponse =
      ObservableFuture.value(null);

  @observable
  ObservableFuture<UniversityLists?> universityListsFuture =
      emptyUniversityListResponse;

  @computed
  bool get isUniversityLoading =>
      universityListsFuture.status == FutureStatus.pending;

  @action
  Future getUniversityList(String id ) async {
    try {
      GetUniversityListParams  getUniversityListParams =
      GetUniversityListParams(profileId: id);
      final future = _getUniversityListsUseCase.call(params: getUniversityListParams);
      universityListsFuture = ObservableFuture(future);

      UniversityLists? value = await future;
      if (value != null && value.university != null) {
        // Clear existing data before adding new data
        universityLists.clear();
        value.university?.forEach((University element) {
          universityLists.add(element);
        });
      }
    } catch (error) {
      // this.success = false;

      rethrow;
    }
  }

  // share certificate here
  static ObservableFuture<ApiResponse?> emptyShareCertificateResponse =
      ObservableFuture.value(null);

  @observable
  ObservableFuture<ApiResponse?> shareCertificateFuture =
      emptyShareCertificateResponse;

  @computed
  bool get isShareCertificateLoading =>
      shareCertificateFuture.status == FutureStatus.pending;

  @action
  Future<ApiResponse?> shareCertificate(String email, String certificateId) async {
    try {
      ShareCertificateParams shareCertificationParams =
          ShareCertificateParams(email: email, certificateId: certificateId);

      final future =
          _shareCertificateUseCase.call(params: shareCertificationParams);
      shareCertificateFuture = ObservableFuture(future);
      ApiResponse? value = await future;
      if (value?.message != null) {
        // this.registrationKey = value?.data?['key'];
        //
        // this.success = true;

        return ApiResponse(success: value!.success, message: value.message);
      }
    } catch (error) {
      // this.success = false;

      rethrow;
    }
  }

  // create request certificate here
  static ObservableFuture<ApiResponse?> emptyCreateRequestResponse =
      ObservableFuture.value(null);

  @observable
  ObservableFuture<ApiResponse?> createRequestFuture =
      emptyCreateRequestResponse;

  @computed
  bool get isCreateCertificateRequestLoading =>
      createRequestFuture.status == FutureStatus.pending;

  @action
  Future<ApiResponse?> createCertificateRequest(
      String receiverId,
      String requestType,
      int status,
      String remark,
      String graduationYear) async {
    try {
      CreateCertificateRequestParams createCertificateRequestParams =
          CreateCertificateRequestParams(
              receiverId: receiverId,
              requestType: requestType,
              status:status,
              remark: remark,
              graduationYear: graduationYear);
      final future = _createCertificateRequestUseCase.call(
          params: createCertificateRequestParams);
      createRequestFuture = ObservableFuture(future);
      ApiResponse? value = await future;
      if (value?.message != null) {
        // this.registrationKey = value?.data?['key'];
        //
        // this.success = true;

        return ApiResponse(success: value!.success, message: value.message);
      }
    } catch (error) {
      // this.success = false;

      rethrow;
    }
  }

  // get department  lists by id

  static ObservableFuture<DepartmentLists?> emptyDepartmentListsResponse =
      ObservableFuture.value(null);

  @observable
  ObservableFuture<DepartmentLists?> departmentListsFuture =
      emptyDepartmentListsResponse;

  @computed
  bool get isDepartmentListsByIDLoading =>
      departmentListsFuture.status == FutureStatus.pending;

  @observable
  ObservableList<Department> departmentLists = new ObservableList<Department>();

  @action
  Future getDepartmentListByID(String id) async {
    try {
      final GetDepartmentListsByIDParams getDepartmentListsByIDParams =
          GetDepartmentListsByIDParams(id: id);
      final future = _getDepartmentListsByIDUseCase.call(
          params: getDepartmentListsByIDParams);
      departmentListsFuture = ObservableFuture(future);

      DepartmentLists? value = await future;
      if (value != null && value.department != null) {
        // Clear existing data before adding new data
        certificateLists.clear();
        value.department?.forEach((Department element) {
          departmentLists.add(element);
        });
      }
    } catch (error) {
      // this.success = false;

      rethrow;
    }
  }

  @observable
  ObservableList<RecievedRequest> allRecievedRequestLists =
      new ObservableList<RecievedRequest>();

  static ObservableFuture<RecievedRequestLists?> emptyAllRequestListResponse =
      ObservableFuture.value(null);

  @observable
  ObservableFuture<RecievedRequestLists?> allRequestListsFuture =
      emptyAllRequestListResponse;

  @computed
  bool get isAllRequestListsLoading =>
      allRequestListsFuture.status == FutureStatus.pending;

  @action
  Future getAllRequestLists(String receiverID) async {
    try {
      allRecievedRequestLists.clear();
      GetAllRequestParams getAllRequestParams =
          GetAllRequestParams(receiverId: receiverID, pageSize: 100, page: 1);

      final future = _getAllRequestUseCase.call(params: getAllRequestParams);
      allRequestListsFuture = ObservableFuture(future);

      RecievedRequestLists? value = await future;
      if (value != null && value.recievedRequest != null) {
        value.recievedRequest?.forEach((RecievedRequest element) {
          allRecievedRequestLists.add(element);
        });
      }
    } catch (error) {
      // this.success = false;

      rethrow;
    }
  }

  @observable
  String certificatePdfLink = "";
  static ObservableFuture<ApiResponse?> emptyGetCertificatePdfResponse =
      ObservableFuture.value(null);

  @observable
  ObservableFuture<ApiResponse?> certificatePdfLinkFuture =
      emptyGetCertificatePdfResponse;

  @computed
  bool get isCertificatePdfLinkByIDLoading =>
      certificatePdfLinkFuture.status == FutureStatus.pending;

  @action
  Future<ApiResponse?> getCertificatePdfLinkByID(String id) async {
    try {
      final CertificatePdfLinkByIDParams certificatePdfLinkByIDParams =
          CertificatePdfLinkByIDParams(id: id);
      final future = _certificatePdfLinkIDUseCase.call(
          params: certificatePdfLinkByIDParams);
      certificatePdfLinkFuture = ObservableFuture(future);
      ApiResponse? value = await future;
      if (value?.data != null) {
        certificatePdfLink = value!.data?['pdfLink'];
        return value;
        // Clear existing data before adding new data
      }
    } catch (error) {
      // this.success = false;

      rethrow;
    }
  }

  @observable
  String envelopesLink = "";
  static ObservableFuture<ApiResponse?> emptyGetEnvelopesResponse =
      ObservableFuture.value(null);

  @observable
  ObservableFuture<ApiResponse?> envelopesLinkFuture =
      emptyGetEnvelopesResponse;

  @computed
  bool get isEnvelopesByIDLoading =>
      envelopesLinkFuture.status == FutureStatus.pending;

  @action
  Future<ApiResponse?> getEnvelopesLinkByID(String id) async {
    try {
      final EnvelopesLinkByIDParams envelopesLinkByIDParams =
          EnvelopesLinkByIDParams(envelopID: id);
      final future =
          _envelopesLinkIDUseCase.call(params: envelopesLinkByIDParams);
      envelopesLinkFuture = ObservableFuture(future);
      ApiResponse? value = await future;
      if (value != null) {
        envelopesLink = value!.data?['pdfLink'];

        return value;
      }
    } catch (error) {
      rethrow;
    }
  }

  static ObservableFuture<ApiResponse?> emptyEmployeesRequestDeclinedResponse =
      ObservableFuture.value(null);

  @observable
  ObservableFuture<ApiResponse?> employeesRequestDeclinedFuture =
      emptyEmployeesRequestDeclinedResponse;

  @computed
  bool get isEmployeesRequestDeclinedLoading =>
      employeesRequestDeclinedFuture.status == FutureStatus.pending;

  @action
  Future<ApiResponse?> employeesRequestDeclined(String id) async {
    try {
      final EmployeesRequestDeclinedParams employeesRequestDeclinedParams =
          EmployeesRequestDeclinedParams(receiverId: id);
      final future = _employeesRequestDeclinedUseCase.call(
          params: employeesRequestDeclinedParams);
      employeesRequestDeclinedFuture = ObservableFuture(future);
      ApiResponse? value = await future;
      if (value != null) {
        return value;
      }
    } catch (error) {
      // this.success = false;

      rethrow;
    }
  }

  static ObservableFuture<StudentRequestLists?> emptyStudentRequestListsResponse =
  ObservableFuture.value(null);

  @observable
  ObservableFuture<StudentRequestLists?> studentRequestListsFuture =
      emptyStudentRequestListsResponse;

  @computed
  bool get isStudentRequestLoading =>
      studentRequestListsFuture.status == FutureStatus.pending;

  @observable
  ObservableList<StudentRequest> studentRequestLists = new ObservableList<StudentRequest>();

  @action
  Future getStudentRequest(String guid) async {
    try {
      final StudentRequestParams  studentRequestParams =
      StudentRequestParams(page: 1, pageSize: 100, guid: guid);
      final future = _studentRequestUseCase.call(
          params: studentRequestParams);
      studentRequestListsFuture = ObservableFuture(future);

      StudentRequestLists? value = await future;
      if (value != null && value.studentRequest != null) {
        // Clear existing data before adding new data
        print('check student request list $value');
        studentRequestLists.clear();
        value.studentRequest?.forEach((StudentRequest element) {
          studentRequestLists.add(element);
        });
      }
    } catch (error) {
      // this.success = false;

      rethrow;
    }
  }

}
