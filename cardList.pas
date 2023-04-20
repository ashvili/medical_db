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
  StdStyleActnCtrls, dxRibbonSkins, dxRibbonCustomizationForm, dxRibbon, dxBar,
  cxContainer, cxLabel, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxMRUEdit,
  dxBarExtItems, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox;

type
  TfmCardList = class(TForm)
    cxPG: TcxPageControl;
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
    aFilterApply: TAction;
    aEdit: TAction;
    aNew: TAction;
    aDelete: TAction;
    aExit: TAction;
    aSave: TAction;
    dxBarManager1: TdxBarManager;
    dxBarPopupMenu1: TdxBarPopupMenu;
    dxRibbon1Tab1: TdxRibbonTab;
    dxRibbon1: TdxRibbon;
    dxRibbon1Tab2: TdxRibbonTab;
    dxRibbon1Tab3: TdxRibbonTab;
    dxBarManager1Bar1: TdxBar;
    dxNew_card: TdxBarButton;
    dxEditCard: TdxBarButton;
    dxDelete_card: TdxBarButton;
    dxLargeNew_card: TdxBarLargeButton;
    dxBarManager1Bar2: TdxBar;
    dxLargeSave_card: TdxBarLargeButton;
    dxBarManager1Bar3: TdxBar;
    dxFilterPanel: TdxBarControlContainerItem;
    Panel1: TPanel;
    edFIO: TcxMRUEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    dxFilterApply: TdxBarLargeButton;
    edPatient_state: TcxLookupComboBox;
    edGender: TcxLookupComboBox;
    cxGrid1DBTableView1state_name: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure aFilterApplyExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aNewExecute(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
    procedure aSaveExecute(Sender: TObject);
    procedure aExitExecute(Sender: TObject);
    procedure cxGrid1DBTableView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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

    procedure filterApply;
  public
    { Public declarations }
  end;

var
  fmCardList: TfmCardList;

implementation

{$R *.dfm}

uses dmCardListUnit, StrUtils, dmMainUnit, sqlGenerateUnit,
  frameCardEditUnit;

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
  TframeCardEdit.Create(newTab, newTab, medical_card_id, FProcedureClose).Show;
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

procedure TfmCardList.aFilterApplyExecute(Sender: TObject);
begin
  if dxFilterApply.Down then
    filterApply
  else
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
  id: integer;
begin
  with dmCardList do begin
    if qMedical_card.Active and (qMedical_card.RecordCount > 0) then begin
      if MessageDlg('Удалить карту?', mtConfirmation, mbOKCancel, 0) <> mrOK then
        Exit;

      if cxPG.ActivePage.Tag = -1 then begin
        cxPG.ActivePage.Free;
        cxPG.ActivePageIndex := 0;
        Exit;
      end;

      if cxPG.ActivePage.Tag >= 0 then begin
        id := cxPG.ActivePage.Tag;
        i := cxPG.ActivePageIndex;
      end
      else begin
        id := qMedical_cardid.Value;
        i := findPage(id);
      end;
      if (i < 0) or TframeCardEdit(getCard(i)).save then begin
        delete(id);
        cxPG.ActivePageIndex := 0;
      end;
    end;
  end;
end;

procedure TfmCardList.editMedical_card;
var
  i: integer;
begin
  with dmCardList do begin
    if qMedical_card.Active and (qMedical_card.RecordCount > 0) then begin
      i := findPage(qMedical_cardid.Value);
      if i >= 0 then
        cxPG.ActivePageIndex := i
      else begin
        addPage(qMedical_cardid.Value);
      end;
    end;
  end;
end;

procedure TfmCardList.filterApply;
var
  fio: string;
  gender_id, patient_state_id: integer;
  filter_obj: TSQLCondition;
  sqlTxt: string;
begin
  fio := trim(edFIO.EditText);
  if not (VarIsEmpty(edPatient_state.EditValue) or VarIsNull(edPatient_state.EditValue)) then
    patient_state_id := edPatient_state.EditValue
  else
    patient_state_id := -1;
  if not (VarIsEmpty(edGender.EditValue) or VarIsNull(edGender.EditValue))then
    gender_id := edGender.EditValue
  else
    gender_id := -1;

  filter_obj := TSQLCondition.Create();
  if fio <> '' then
    filter_obj.addAnd(FIO_FIELD, fio, ctLike);
  if patient_state_id > 0  then
    filter_obj.addAnd('medical_card.state_id', patient_state_id.ToString, ctEq);
  if gender_id >= 0 then
    filter_obj.addAnd('medical_card.gender_id', gender_id.ToString, ctEq);

  with dmCardList.qMedical_card do begin
    Close;
    SQL.Text := format('%s WHERE %s', [SQL_MEDICAL_CARD_LIST,
                                        filter_obj.SQLText ]);
    Open;
  end;

  if (fio.length > 0) and (TcxTextEditProperties(edFIO.Properties).LookupItems.IndexOf(fio) < 0) then
        TcxTextEditProperties(edFIO.Properties).LookupItems.Add(fio);
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

procedure TfmCardList.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := MessageDlg('Закрыть программу?',
                          mtConfirmation,
                          mbYesNo, 0) = mrYes;
end;

procedure TfmCardList.FormCreate(Sender: TObject);
begin
  FProcedureClose := closePage;
end;

procedure TfmCardList.FormShow(Sender: TObject);
begin
  dmCardList.init;
end;

function TfmCardList.getCard(index: integer): TControl;
var
  i: integer;
begin
  result := nil;
  for i := 0 to cxPG.Pages[index].ControlCount - 1 do
    if cxPG.Pages[index].Controls[i] is TframeCardEdit then begin
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
    if Assigned(card) and (card is TframeCardEdit) then
      TframeCardEdit(card).save;
    dmCardList.openMedical_card;
  end;
end;

procedure TfmCardList.showMedical_card;
begin
  dmCardList.openMedical_card;
end;

end.
