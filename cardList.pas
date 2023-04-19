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
  Vcl.ExtCtrls, Vcl.StdCtrls,
  settings, Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls, IDETheme.ActnCtrls;

type
  TfmCardList = class(TForm)
    cxPG: TcxPageControl;
    Panel1: TPanel;
    cxTabSheet1: TcxTabSheet;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1id: TcxGridDBColumn;
    cxGrid1DBTableView1date_birth: TcxGridDBColumn;
    cxGrid1DBTableView1phone: TcxGridDBColumn;
    cxGrid1DBTableView1job_info: TcxGridDBColumn;
    cxGrid1DBTableView1gender_name: TcxGridDBColumn;
    cxGrid1DBTableView1fio: TcxGridDBColumn;
    ActionManager1: TActionManager;
    aShow: TAction;
    aEdit: TAction;
    aNew: TAction;
    aDelete: TAction;
    ActionToolBar1: TActionToolBar;
    aExit: TAction;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure aShowExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aNewExecute(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
  private
    { Private declarations }
    FProcedureClose: TProcedureClose;
    
    procedure addPage(medical_card_id: integer);
    function findPage(medical_card_id: integer): integer;
    function closePage(medical_card_id: integer): boolean;
    function getCard(index: integer): TControl;

    procedure showMedical_card;
    procedure editMedical_card;
    procedure newMedical_card;
    procedure deleteMedical_card;
  public
    { Public declarations }
  end;

var
  fmCardList: TfmCardList;

implementation

{$R *.dfm}

uses dmCardListUnit, cardEdit;

procedure TfmCardList.addPage(medical_card_id: integer);
var
  newTab: TcxTabSheet;
begin
  newTab := TcxTabSheet.Create(self);
  with newTab do begin
    PageControl := cxPG;
    Caption := medical_card_id.ToString;
    Tag := medical_card_id;
  end;
  TfmCardEdit.Create(newTab, newTab, medical_card_id, FProcedureClose);
  cxPG.ActivePage := newTab;
end;

procedure TfmCardList.aDeleteExecute(Sender: TObject);
begin
  deleteMedical_card;
end;

procedure TfmCardList.aEditExecute(Sender: TObject);
begin
  editMedical_card;
end;

procedure TfmCardList.aNewExecute(Sender: TObject);
begin
  newMedical_card;
end;

procedure TfmCardList.aShowExecute(Sender: TObject);
begin
  showMedical_card;
end;

function TfmCardList.closePage(medical_card_id: integer): boolean;
var
  i: integer;
begin
  i := findPage(medical_card_id);
  if i >= 0 then
    cxPG.Pages[i].Free;  
end;

procedure TfmCardList.deleteMedical_card;
var
  i: integer;
begin
  if dmCard.qMedical_card.Active and (dmCard.qMedical_card.RecordCount > 0) then begin
    i := findPage(dmCard.qMedical_cardid.Value);
    if i >= 0 then
      cxPG.ActivePageIndex := i    
    else begin
      addPage(dmCard.qMedical_cardid.Value);
      TfmCardEdit(getCard(cxPG.ActivePageIndex)).edit;
    end;
  end;
end;

procedure TfmCardList.editMedical_card;
var
  i: integer;
begin
  if dmCard.qMedical_card.Active and (dmCard.qMedical_card.RecordCount > 0) then begin
    i := findPage(dmCard.qMedical_cardid.Value);
    if i >= 0 then
      cxPG.ActivePageIndex := i    
    else begin
      addPage(dmCard.qMedical_cardid.Value);
      TfmCardEdit(getCard(cxPG.ActivePageIndex)).edit;
    end;
  end;
end;

function TfmCardList.findPage(medical_card_id: integer): integer;
Var
  i: integer;
begin
  result := -1;
  for i := 0 to cxPG.PageCount - 1 do
    if cxPG.Pages[i].Tag = medical_card_id then begin
      result := i;
      break;
    end;
end;

procedure TfmCardList.FormCreate(Sender: TObject);
begin
  FProcedureClose := closePage;
end;

procedure TfmCardList.FormShow(Sender: TObject);
begin
  dmCard.init;
end;

function TfmCardList.getCard(index: integer): TControl;
var
  i: integer;
begin
  result := nil;
  for i := 0 to cxPG.Pages[index].ControlCount - 1 do
    if cxPG.Pages[index].Controls[i] is TfmCardEdit then begin
      result := cxPG.Pages[index].Controls[i];
      break;
    end;
end;

procedure TfmCardList.newMedical_card;
var
  i: integer;
begin
  i := findPage(-1);
  if i >= 0 then
    cxPG.ActivePageIndex := i    
  else begin
    addPage(-1);
    TfmCardEdit(getCard(cxPG.ActivePageIndex)).new;
  end;
end;

procedure TfmCardList.showMedical_card;
begin
  dmCard.openMedical_card;
end;

end.
