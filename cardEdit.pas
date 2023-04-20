unit cardEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  settings, dmCardEditUnit,
  dmCardListUnit, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
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
  private
    { Private declarations }
    Fdm: TdmCardEdit;
    Fmedical_card_id: integer;
    FProcedureClose: TProcedureClose;

    procedure updateDateBinding;
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

{$R *.dfm}

{ TfmCardEdit }

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

procedure TfmCardEdit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Fdm.Free;
  FProcedureClose(Fmedical_card_id);
end;

function TfmCardEdit.save: boolean;
begin
  result := Fdm.save;
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
