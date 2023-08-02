class ContentModel {
  String? dsCodeError;
  String? dsDescError;
  String? idContent;
  String? dsTitle;
  String? dsSubject;
  String? dsContent;
  String? dsImage;
  String? dsFile;
  String? dtCreate;

  ContentModel(
      {this.dsCodeError,
      this.dsDescError,
      this.idContent,
      this.dsTitle,
      this.dsSubject,
      this.dsContent,
      this.dsImage,
      this.dsFile,
      this.dtCreate});

  ContentModel.fromJson(Map<String, dynamic> json) {
    dsCodeError = json['ds_code_error'];
    dsDescError = json['ds_desc_error'];
    idContent = json['id_content'];
    dsTitle = json['ds_title'];
    dsSubject = json['ds_subject'];
    dsContent = json['ds_content'];
    dsImage = json['ds_image'];
    dsFile = json['ds_file'];
    dtCreate = json['dt_create'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ds_code_error'] = this.dsCodeError;
    data['ds_desc_error'] = this.dsDescError;
    data['id_content'] = this.idContent;
    data['ds_title'] = this.dsTitle;
    data['ds_subject'] = this.dsSubject;
    data['ds_content'] = this.dsContent;
    data['ds_image'] = this.dsImage;
    data['ds_file'] = this.dsFile;
    data['dt_create'] = this.dtCreate;
    return data;
  }
}
