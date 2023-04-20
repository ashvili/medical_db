unit dmCardListUnit;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, System.ImageList, Vcl.ImgList, Vcl.Controls, cxImageList,
  cxGraphics;


const
  FIO_FIELD = 'COALESCE(medical_card.last_name, '''') || '' '' '+
              '|| COALESCE(medical_card.first_name, '''') || '' '' '+
              '|| COALESCE(medical_card.middle_name, '''')';

  SQL_MEDICAL_CARD_LIST =
    'SELECT '+
          'medical_card."id", '+
          'medical_card.first_name, '+
          'medical_card.last_name, '+
          'medical_card.middle_name, '+
          'medical_card.date_birth, '+
          'medical_card.phone, '+
          'medical_card.job_info, '+
          'medical_card.document_info, '+
          'medical_card.note, '+
          'medical_card.address, '+
          'medical_card.date_created, '+
          'patient_state."name" AS state_name, '+
          'gender."name" AS gender_name '+
        'FROM medical_card '+
            'LEFT JOIN patient_state ON medical_card.state_id = patient_state."id" '+
            'LEFT JOIN gender ON medical_card.gender_id = gender."id"';


type
  TdmCardList = class(TDataModule)
    qMedical_card: TFDQuery;
    dsqMedical_card: TDataSource;
    qMedical_cardfio: TStringField;
    qMedical_cardid: TIntegerField;
    qMedical_cardfirst_name: TWideStringField;
    qMedical_cardlast_name: TWideStringField;
    qMedical_cardmiddle_name: TWideStringField;
    qMedical_carddate_birth: TDateField;
    qMedical_cardphone: TWideStringField;
    qMedical_cardjob_info: TWideStringField;
    qMedical_carddocument_info: TWideStringField;
    qMedical_cardnote: TWideMemoField;
    qMedical_cardaddress: TWideStringField;
    qMedical_carddate_created: TDateField;
    qMedical_cardstate_name: TWideStringField;
    qMedical_cardgender_name: TWideStringField;
    procedure qMedical_cardCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure init;
    procedure delete(id: integer);
    procedure openMedical_card;
  end;

var
  dmCardList: TdmCardList;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses StrUtils, dmMainUnit;

{$R *.dfm}

procedure TdmCardList.delete(id: integer);
const
  sqlDelete =
    'DELETE FROM medical_card '+
    'WHERE id = %d; ';
begin
  qMedical_card.DisableControls;
  qMedical_card.Close;
  try
    with dmMain.qTmp do begin
      Close;
      SQL.Text := format(sqlDelete, [id]);
      ExecSQL;
    end;
  finally
    qMedical_card.Open();
    qMedical_card.EnableControls;
  end;
end;

procedure TdmCardList.init;
begin
  openMedical_card;
end;

procedure TdmCardList.openMedical_card;
var
  id: integer;
begin
  if qMedical_card.Active and (qMedical_card.RecordCount > 0) then
    id := qMedical_cardid.Value
  else
    id := -1;
  try
    qMedical_card.DisableControls;
    qMedical_card.Close;
    qMedical_card.SQL.Text := SQL_MEDICAL_CARD_LIST;
    qMedical_card.Open();
    qMedical_card.Locate('id', id);
  finally
    qMedical_card.EnableControls;
  end;
end;

procedure TdmCardList.qMedical_cardCalcFields(DataSet: TDataSet);
begin
  qMedical_cardfio.Value := format('%s %s%s',
                            [IfThen(qMedical_cardlast_name.Value <> '', qMedical_cardlast_name.Value),
                             IfThen((qMedical_cardfirst_name.Value <> ''), qMedical_cardfirst_name.Value.Substring(0, 1)+'.'),
                             IfThen((qMedical_cardmiddle_name.Value <> ''), qMedical_cardmiddle_name.Value.Substring(0, 1)+'.')
                            ]);
end;

end.
