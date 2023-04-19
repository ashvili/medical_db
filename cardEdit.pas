unit cardEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  settings,
  dmCardListUnit;

type
  TfmCardEdit = class(TForm)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Fdm: TdmCard;
    Fmedical_card_id: integer;
    FProcedureClose: TProcedureClose;

  public
    { Public declarations }
    constructor Create(AOwner: TComponent; AParent: TWinControl;
                       medical_card_id: integer;
                       procedureClose: TProcedureClose); overload;

    procedure edit;
    procedure new;
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
  Fdm := TdmCard.Create(self);
  if(Assigned(AParent)) then begin
    FormStyle := fsNormal;
    Parent:=AParent;
    BorderStyle:=bsNone;
    Align:=alClient;
  end;
end;

procedure TfmCardEdit.edit;
begin

end;

procedure TfmCardEdit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Fdm.Free;
  FProcedureClose(Fmedical_card_id);
end;


procedure TfmCardEdit.new;
begin

end;

end.
