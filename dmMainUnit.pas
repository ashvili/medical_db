unit dmMainUnit;
{
common tables (dictionaries)
common images
}
interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.PG, FireDAC.Phys.PGDef,
  FireDAC.VCLUI.Wait, System.ImageList, Vcl.ImgList, Vcl.Controls, cxImageList,
  cxGraphics;

type
  TdmMain = class(TDataModule)
    qTmp: TFDQuery;
    qPatient_state: TFDQuery;
    qPatient_stateid: TSmallintField;
    qPatient_statename: TWideStringField;
    dsqPatient_state: TDataSource;
    qGender: TFDQuery;
    qGenderid: TSmallintField;
    qGendername: TWideStringField;
    dsqGender: TDataSource;
    FDConnection: TFDConnection;
    cxImageList: TcxImageList;
    cxImageListLarge: TcxImageList;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure init;
  end;

var
  dmMain: TdmMain;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmMain }

procedure TdmMain.DataModuleCreate(Sender: TObject);
begin
  init;
end;

procedure TdmMain.init;
begin
  { open dictionaries }
  qPatient_state.Open();
  qGender.Open();
end;

end.
