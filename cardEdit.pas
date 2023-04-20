unit cardEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  settings, dmCardEditUnit,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinsDefaultPainters, cxMemo, cxDBEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxMaskEdit,
  cxCalendar, cxLabel, cxDBLabel, cxTextEdit;

type
  TfmCardEdit = class(TForm)
    edLast_name: TcxDBTextEdit;
    edFirst_name: TcxDBTextEdit;
    edMiddle_name: TcxDBTextEdit;
    edDate_birth: TcxDBDateEdit;
    edGender: TcxDBLookupComboBox;
    edPhone: TcxDBMaskEdit;
    edJob_info: TcxDBTextEdit;
    edDocument_info: TcxDBTextEdit;
    edNote: TcxDBMemo;
    edAddress: TcxDBTextEdit;
    edPatient_state: TcxDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edLast_namePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure edFirst_namePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure edDate_birthPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure edGenderPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
  private
    { Private declarations }
    Fdm: TdmCardEdit;
    Fmedical_card_id: integer;
    FProcedureClose: TProcedureClose;

    procedure updateDateBinding;
    function checkFill: boolean;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; AParent: TWinControl;
                       medical_card_id: integer;
                       procedureClose: TProcedureClose); overload;

    function save: boolean;
  end;

var
  fmCardEdit: TfmCardEdit;

implementation

uses dmMainUnit;

{$R *.dfm}

{ TfmCardEdit }

function TfmCardEdit.checkFill: boolean;
begin
  result := edLast_name.ValidateEdit(true)
            and edFirst_name.ValidateEdit(true)
            and edDate_birth.ValidateEdit(true)
            and edGender.ValidateEdit(true);
end;

constructor TfmCardEdit.Create(AOwner: TComponent; AParent: TWinControl;
                                medical_card_id: integer;
                                procedureClose: TProcedureClose);
begin
  inherited Create(AOwner);
  Fmedical_card_id := medical_card_id;
  FProcedureClose := procedureClose;
  Fdm := TdmCardEdit.Create(self, medical_card_id);
  Fdm.load;
  updateDateBinding;
  if(Assigned(AParent)) then begin
    FormStyle := fsNormal;
    Parent:=AParent;
    BorderStyle:=bsNone;
    Align:=alClient;
  end;
end;

procedure TfmCardEdit.edDate_birthPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  if VarIsNull(DisplayValue) or (VarToStr(DisplayValue).Trim = '')
  then begin
    Error := true;
    ErrorText := 'Необходимо заполнить дату рождения!';
  end;
end;

procedure TfmCardEdit.edFirst_namePropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  if VarIsNull(DisplayValue) or (VarToStr(DisplayValue).Trim = '') then begin
    Error := true;
    ErrorText := 'Необходимо ввести имя!';
  end;
end;

procedure TfmCardEdit.edGenderPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  if VarIsNull(DisplayValue) or (VarToStr(DisplayValue).Trim = '') then begin
    Error := true;
    ErrorText := 'Необходимо указать пол!';
  end;
end;

procedure TfmCardEdit.edLast_namePropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  if VarIsNull(DisplayValue) or (VarToStr(DisplayValue).Trim = '') then begin
    Error := true;
    ErrorText := 'Необходимо ввести фамилию!';
  end;
end;

procedure TfmCardEdit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Fdm.Free;
  FProcedureClose(Fmedical_card_id);
end;

function TfmCardEdit.save: boolean;
begin
  result := checkFill and Fdm.save;
  if result then
    Close;
end;

procedure TfmCardEdit.updateDateBinding;
begin
  edPatient_state.DataBinding.DataSource := Fdm.dsqMedical_card;
  edFirst_name.DataBinding.DataSource := Fdm.dsqMedical_card;
  edLast_name.DataBinding.DataSource := Fdm.dsqMedical_card;
  edMiddle_name.DataBinding.DataSource := Fdm.dsqMedical_card;
  edDate_birth.DataBinding.DataSource := Fdm.dsqMedical_card;
  edGender.DataBinding.DataSource := Fdm.dsqMedical_card;
  edPhone.DataBinding.DataSource := Fdm.dsqMedical_card;
  edDocument_info.DataBinding.DataSource := Fdm.dsqMedical_card;
  edJob_info.DataBinding.DataSource := Fdm.dsqMedical_card;
  edAddress.DataBinding.DataSource := Fdm.dsqMedical_card;
  edNote.DataBinding.DataSource := Fdm.dsqMedical_card;
end;

end.
