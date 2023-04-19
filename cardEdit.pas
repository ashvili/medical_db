unit cardEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TfmCardEdit = class(TForm)
  private
    { Private declarations }
    Fmedical_card_id: integer;

    constructor Create(AOwner: TComponent; medical_card_id: integer);

  public
    { Public declarations }
  end;

var
  fmCardEdit: TfmCardEdit;

implementation

{$R *.dfm}

{ TfmCardEdit }

constructor TfmCardEdit.Create(AOwner: TComponent; medical_card_id: integer);
begin
  inherited Create(AOwner);
end;

end.
