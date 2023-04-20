unit dmCardEditUnit;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, dxmdaset, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmCardEdit = class(TDataModule)
    qMedical_card: TFDQuery;
    dsqMedical_card: TDataSource;
    qMedical_cardid: TIntegerField;
    qMedical_cardfirst_name: TWideStringField;
    qMedical_cardlast_name: TWideStringField;
    qMedical_cardmiddle_name: TWideStringField;
    qMedical_carddate_birth: TDateField;
    qMedical_cardgender_id: TSmallintField;
    qMedical_cardphone: TWideStringField;
    qMedical_cardjob_info: TWideStringField;
    qMedical_carddocument_info: TWideStringField;
    qMedical_cardnote: TWideMemoField;
    qMedical_cardaddress: TWideStringField;
    qMedical_carddate_created: TDateField;
    qMedical_cardstate_id: TSmallintField;
    dMedical_card: TdxMemData;
    dMedical_cardid: TIntegerField;
    dMedical_cardfirst_name: TWideStringField;
    dMedical_cardlast_name: TWideStringField;
    dMedical_cardmiddle_name: TWideStringField;
    dMedical_carddate_birth: TDateField;
    dMedical_cardgender_id: TSmallintField;
    dMedical_cardphone: TWideStringField;
    dMedical_cardjob_info: TWideStringField;
    dMedical_carddocument_info: TWideStringField;
    dMedical_cardnote: TWideMemoField;
    WideStringField7: TWideStringField;
    dMedical_carddate_created: TDateField;
    dMedical_cardstate_id: TSmallintField;
  private
    { Private declarations }
    Fid: integer;

    procedure updateMedical_card;
    procedure insertMedical_card;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; medical_card_id: integer); overload;
    procedure load;
    function save: boolean;
  end;

var
  dmCardEdit: TdmCardEdit;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Dialogs, sqlGenerateUnit, dmMainUnit;

{$R *.dfm}

{ TdmCardEdit }

constructor TdmCardEdit.Create(AOwner: TComponent; medical_card_id: integer);
begin
  inherited Create(Aowner);
  Fid := medical_card_id;
end;

procedure TdmCardEdit.insertMedical_card;
begin
  with TTableUpdateInsert.Create(dmMain.FDConnection, 'medical_card', dMedical_card.Fields) do begin
     execSQL;
     Free;
  end;
end;

procedure TdmCardEdit.load;
begin
  dMedical_card.Close;
  dMedical_card.Open;
  qMedical_card.Close;
  if Fid >= 0 then begin
    qMedical_card.Params[0].Value := Fid;
    qMedical_card.Open();
    if qMedical_card.RecordCount <> 1 then
      raise Exception.Create(format('Медицинская карта № %d не найдена.', [Fid]));
    dMedical_card.LoadFromDataSet(qMedical_card);
  end
  else
    dMedical_card.Append;
end;

function TdmCardEdit.save: boolean;
begin
  result := false;
  try
    if dMedical_card.State in [dsInsert, dsEdit] then
      dMedical_card.Post;
    if Fid >= 0 then
      updateMedical_card
    else
      insertMedical_card;
    result := true;
  except on e: Exception do
      MessageDlg('Ошибка при сохранении: '+e.Message, mtError, [mbOK], 0);
  end;
end;

procedure TdmCardEdit.updateMedical_card;
begin
  with TTableUpdateUpdate.Create(dmMain.FDConnection, 'medical_card', dMedical_card.Fields) do begin
     execSQL;
     Free;
  end;
end;

end.
