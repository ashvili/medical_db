program medical_test;

uses
  Vcl.Forms,
  cardList in 'cardList.pas' {fmCardList},
  dmCardListUnit in 'dmCardListUnit.pas' {dmCard: TDataModule},
  cardEdit in 'cardEdit.pas' {fmCardEdit},
  dmCardEditUnit in 'dmCardEditUnit.pas' {dmCardEdit: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfmCardList, fmCardList);
  Application.CreateForm(TdmCard, dmCard);
  Application.CreateForm(TfmCardEdit, fmCardEdit);
  Application.CreateForm(TdmCardEdit, dmCardEdit);
  Application.Run;
end.
