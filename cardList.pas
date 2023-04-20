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
  settings, Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls, IDETheme.ActnCtrls,
  StdStyleActnCtrls;

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
    aSave: TAction;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure aShowExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aNewExecute(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
    procedure aSaveExecute(Sender: TObject);
    procedure aExitExecute(Sender: TObject);
    procedure cxGrid1DBTableView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
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
    procedure saveMedical_card;

    procedure closeList;
  public
    { Public declarations }
  end;

var
  fmCardList: TfmCardList;

implementation

{$R *.dfm}

uses dmCardListUnit, cardEdit, StrUtils;

procedure TfmCardList.addPage(medical_card_id: integer);
var
  newTab: TcxTabSheet;
begin
  newTab := TcxTabSheet.Create(self);
  with newTab do begin
    PageControl := cxPG;
    Caption := IfThen(medical_card_id >= 0,
                      'Мед.карта № ' + medical_card_id.ToString,
                      'Новая мед.карта');
    Tag := medical_card_id;
  end;
  TfmCardEdit.Create(newTab, newTab, medical_card_id, FProcedureClose).Show;
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

procedure TfmCardList.aExitExecute(Sender: TObject);
begin
  closeList;
end;

procedure TfmCardList.aNewExecute(Sender: TObject);
begin
  newMedical_card;
end;

procedure TfmCardList.aSaveExecute(Sender: TObject);
begin
  saveMedical_card;
end;

procedure TfmCardList.aShowExecute(Sender: TObject);
begin
  showMedical_card;
end;

procedure TfmCardList.closeList;
begin
  if MessageDlg('Вы действительно хотите закрыть программу?', mtConfirmation, mbYesNo, 0) = mrYes then
    Close;
end;

function TfmCardList.closePage(medical_card_id: integer): boolean;
var
  i: integer;
begin
  i := findPage(medical_card_id);
  if i >= 0 then
    cxPG.Pages[i].Free;  
end;

procedure TfmCardList.cxGrid1DBTableView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  aEdit.OnExecute(self);
end;

procedure TfmCardList.deleteMedical_card;
var
  i: integer;
begin
  if MessageDlg('Удалить карту?', mtConfirmation, mbOKCancel, 0) <> mrOK then
    Exit;
  with dmCard do begin
    if qMedical_card.Active and (qMedical_card.RecordCount > 0) then begin
      i := findPage(qMedical_cardid.Value);
      if (i < 0) or TfmCardEdit(getCard(i)).save then begin
        delete(qMedical_cardid.Value);
        cxPG.ActivePageIndex := 0;
      end;
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
  else
    addPage(-1);
end;

procedure TfmCardList.saveMedical_card;
var
  card: TControl;
begin
  if (cxPG.ActivePage <> nil) and (cxPG.ActivePage.Tag > -2) then begin
    card := getCard(cxPG.ActivePageIndex);
    if Assigned(card) and (card is TfmCardEdit) then
      TfmCardEdit(card).save;
    dmCard.openMedical_card;
  end;
end;

procedure TfmCardList.showMedical_card;
begin
  dmCard.openMedical_card;
end;

end.
