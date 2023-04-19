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

type
  TdmCard = class(TDataModule)
    FDConnection: TFDConnection;
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
    cxImageList1: TcxImageList;
    procedure qMedical_cardCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    procedure openTables;
  public
    { Public declarations }
    procedure init;

    procedure openMedical_card;
    procedure delete(id: integer);
  end;

var
  dmCard: TdmCard;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses StrUtils;

{$R *.dfm}

procedure TdmCard.delete(id: integer);
begin

end;

procedure TdmCard.init;
begin
  qMedical_card.Open();
end;

procedure TdmCard.openMedical_card;
begin
  qMedical_card.Close;
  qMedical_card.Open();
end;

procedure TdmCard.openTables;
begin
  openTables;
end;

procedure TdmCard.qMedical_cardCalcFields(DataSet: TDataSet);
begin
  qMedical_cardfio.Value := format('%s %s%s',
                                    [qMedical_cardlast_name.Value,
                                     IfThen(qMedical_cardfirst_name.Value <> '', qMedical_cardfirst_name.Value[1]+'.'),
                                     IfThen(qMedical_cardmiddle_name.Value <> '', qMedical_cardmiddle_name.Value[1]+'.')]);
end;

end.
