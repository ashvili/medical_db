unit cardList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxSkinsCore, dxSkinsDefaultPainters,
  dxBarBuiltInMenu, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxPC, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, dxDateRanges,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  System.Actions, Vcl.ActnList, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  Vcl.ExtCtrls;

type
  TfmCardList = class(TForm)
    cxPG: TcxPageControl;
    Panel1: TPanel;
    cxTabSheet1: TcxTabSheet;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    ActionList1: TActionList;
    cxGrid1DBTableView1id: TcxGridDBColumn;
    cxGrid1DBTableView1date_birth: TcxGridDBColumn;
    cxGrid1DBTableView1phone: TcxGridDBColumn;
    cxGrid1DBTableView1job_info: TcxGridDBColumn;
    cxGrid1DBTableView1gender_name: TcxGridDBColumn;
    cxGrid1DBTableView1fio: TcxGridDBColumn;
    aShow: TAction;
    aEdit: TAction;
    aNew: TAction;
    aDelete: TAction;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmCardList: TfmCardList;

implementation

{$R *.dfm}

uses dmCardListUnit;

end.
