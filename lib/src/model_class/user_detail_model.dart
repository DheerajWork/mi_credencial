class UserDetailModel {
  String? dsCodeError;
  String? dsDescError;
  String? dsName;
  String? dsDocument;
  String? dsCuil;
  String? dtBirthday;
  String? dsPhone;
  String? dsMail;
  String? dsAddress;
  String? dsCity;
  String? dsProvince;
  String? dsCompany;
  String? dsPhoto;
  String? dtCreate;
  String? dsAffiliateType;
  String? dsSeccional;
  String? dsPlan;

  UserDetailModel(
      {this.dsCodeError,
      this.dsDescError,
      this.dsName,
      this.dsDocument,
      this.dsCuil,
      this.dtBirthday,
      this.dsPhone,
      this.dsMail,
      this.dsAddress,
      this.dsCity,
      this.dsProvince,
      this.dsCompany,
      this.dsPhoto,
      this.dtCreate,
      this.dsAffiliateType,
      this.dsSeccional,
      this.dsPlan});

  UserDetailModel.fromJson(Map<String, dynamic> json) {
    dsCodeError = json['ds_code_error'];
    dsDescError = json['ds_desc_error'];
    dsName = json['ds_name'];
    dsDocument = json['ds_document'];
    dsCuil = json['ds_cuil'];
    dtBirthday = json['dt_birthday'];
    dsPhone = json['ds_phone'];
    dsMail = json['ds_mail'];
    dsAddress = json['ds_address'];
    dsCity = json['ds_city'];
    dsProvince = json['ds_province'];
    dsCompany = json['ds_company'];
    dsPhoto = json['ds_photo'];
    dtCreate = json['dt_create'];
    dsAffiliateType = json['ds_affiliate_type'];
    dsSeccional = json['ds_seccional'];
    dsPlan = json['ds_plan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ds_code_error'] = this.dsCodeError;
    data['ds_desc_error'] = this.dsDescError;
    data['ds_name'] = this.dsName;
    data['ds_document'] = this.dsDocument;
    data['ds_cuil'] = this.dsCuil;
    data['dt_birthday'] = this.dtBirthday;
    data['ds_phone'] = this.dsPhone;
    data['ds_mail'] = this.dsMail;
    data['ds_address'] = this.dsAddress;
    data['ds_city'] = this.dsCity;
    data['ds_province'] = this.dsProvince;
    data['ds_company'] = this.dsCompany;
    data['ds_photo'] = this.dsPhoto;
    data['dt_create'] = this.dtCreate;
    data['ds_affiliate_type'] = this.dsAffiliateType;
    data['ds_seccional'] = this.dsSeccional;
    data['ds_plan'] = this.dsPlan;
    return data;
  }
}
