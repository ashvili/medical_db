unit frameCardEditUnit;
{
class for the medical card
inserting inplace pagecontrol
}
interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinsDefaultPainters, cxMemo, cxDBEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxMaskEdit, cxCalendar, cxTextEdit,
  Vcl.StdCtrls,
  dmCardEditUnit, settings;

type
  TframeCardEdit = class(TFrame)
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
    destructor Free;
    function save: boolean;
  end;

implementation

{$R *.dfm}


{ TframeCardEdit }

function TframeCardEdit.checkFill: boolean;
// check filling main fields - name, surname, birthdate and gender
begin
  result := edLast_name.ValidateEdit(true)
            and edFirst_name.ValidateEdit(true)
            and edDate_birth.ValidateEdit(true)
            and edGender.ValidateEdit(true);
end;

constructor TframeCardEdit.Create(AOwner: TComponent; AParent: TWinControl;
  medical_card_id: integer; procedureClose: TProcedureClose);
begin
  inherited Create(AOwner);
  Fmedical_card_id := medical_card_id;
  //procedure for close this page in the owner control
  FProcedureClose := procedureClose;
  Fdm := TdmCardEdit.Create(self, medical_card_id);
  Fdm.load;
  //updating datasource links to the created datamodule
  updateDateBinding;
  //insert into page, panel, etc
  if(Assigned(AParent)) then begin
    Parent:=AParent;
    Align:=alClient;
  end;
end;

procedure TframeCardEdit.edDate_birthPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  if VarIsNull(DisplayValue) or (VarToStr(DisplayValue).Trim = '')
  then begin
    Error := true;
    ErrorText := 'Необходимо заполнить дату рождения!';
  end;
end;

procedure TframeCardEdit.edFirst_namePropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  if VarIsNull(DisplayValue) or (VarToStr(DisplayValue).Trim = '') then begin
    Error := true;
    ErrorText := 'Необходимо ввести имя!';
  end;
end;

procedure TframeCardEdit.edGenderPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  if VarIsNull(DisplayValue) or (VarToStr(DisplayValue).Trim = '') then begin
    Error := true;
    ErrorText := 'Необходимо указать пол!';
  end;
end;

procedure TframeCardEdit.edLast_namePropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  if VarIsNull(DisplayValue) or (VarToStr(DisplayValue).Trim = '') then begin
    Error := true;
    ErrorText := 'Необходимо ввести фамилию!';
  end;
end;

destructor TframeCardEdit.Free;
begin
  inherited Free;
  Fdm.Free;
  FProcedureClose(Fmedical_card_id);
end;

function TframeCardEdit.save: boolean;
{ checking and save card, in case of success, close page }
begin
  result := checkFill and Fdm.save;
  if result then
    FProcedureClose(Fmedical_card_id);
end;

procedure TframeCardEdit.updateDateBinding;
{ update datasources link }
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
