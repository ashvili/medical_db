program medical_test;

uses
  Vcl.Forms,
  cardList in 'cardList.pas' {fmCardList},
  dmCardListUnit in 'dmCardListUnit.pas' {dmCardList: TDataModule},
  cardEdit in 'cardEdit.pas' {fmCardEdit},
  dmCardEditUnit in 'dmCardEditUnit.pas' {dmCardEdit: TDataModule},
  settings in 'settings.pas',
  sqlGenerateUnit in 'sqlGenerateUnit.pas',
  dmMainUnit in 'dmMainUnit.pas' {dmMain: TDataModule},
  frameCardEditUnit in 'frameCardEditUnit.pas' {frameCardEdit: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfmCardList, fmCardList);
  Application.CreateForm(TdmMain, dmMain);
  Application.CreateForm(TdmCardList, dmCardList);
  Application.Run;
end.
