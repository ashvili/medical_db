unit sqlGenerateUnit;

interface

uses System.Classes, Data.DB, FireDAC.Comp.Client;

type

  TSQLGenerate = class
  private
    FTable_name: string;
    FFields: TStringList;
    FFieldsNotUsed: string;

    function canUseField(field_name: string): boolean;
    function getSQLText: string; virtual; abstract;
  public
    constructor Create(table_name: string; fields: TFields; fieldsNotUsed: string = '');
    destructor Free;

    property SQLText: string read getSQLText;
  end;


  TSQLGenerateInsert = class(TSQLGenerate)
  private
    function getSQLText: string; override;
  end;


  TSQLGenerateUpdate = class(TSQLGenerate)
  private
    function getSQLText: string; override;
  end;


  {Update table}

  TTableUpdate = class
  private
    Fquery: TFDQuery;
    FSQLText: string;

    procedure initializeSQLText(table_name: string; fields: TFields; fieldsNotUsed: string); virtual; abstract;
  public
    constructor Create(connection: TFDConnection; table_name: string; afields: TFields; fieldsNotUsed: string = '');
    destructor Free;
    procedure execSQL;
  end;

  TTableUpdateInsert = class(TTableUpdate)
  private
    procedure initializeSQLText(table_name: string; fields: TFields; fieldsNotUsed: string); override;
  end;

  TTableUpdateUpdate = class(TTableUpdate)
  private
    procedure initializeSQLText(table_name: string; fields: TFields; fieldsNotUsed: string); override;
  end;

implementation

uses System.SysUtils, StrUtils;

{ TSQLGenerate }


function TSQLGenerate.canUseField(field_name: string): boolean;
begin
  result := (field_name.ToLower <> 'recid') and   // excude dxMemTable service field
            (field_name.ToLower <> 'id') and      // and autoincremental id
            (Pos(format('"%s"', [field_name.ToLower]),
              FFieldsNotUsed.ToLower) = 0);
end;

constructor TSQLGenerate.Create(table_name: string; fields: TFields;
  fieldsNotUsed: string);
var
  f: TField;
begin
  FTable_name := table_name;
  FFieldsNotUsed := fieldsNotUsed;
  if Assigned(fields) and (fields.Count > 0) then begin
    FFields := TStringList.Create;
    for f in fields do
      if (f.FieldKind = fkData) and canUseField(f.FieldName) then
        FFields.Add(f.FieldName);
  end
  else
    raise Exception.Create('Не был передан список полей.');
end;

destructor TSQLGenerate.Free;
begin
  if Assigned(FFields) then
    FreeAndNil(FFields);
end;

{ TSQLGenerateInsert }

function TSQLGenerateInsert.getSQLText: string;
const
  sqlInsert =
    'INSERT INTO %s '+
    '(%s) '+
    'VALUES (%s) ';
var
  sFields, sValues, s: string;
  i: integer;
begin
  sFields := '';
  sValues := '';
  s := ', ';
  for i := 0 to FFields.Count - 1 do begin
    if (i = FFields.Count - 1) then s := '';
    sFields := sFields + FFields[i] + s;
    sValues := sValues + ':' +FFields[i] + s;
  end;
  result := format(sqlInsert, [FTable_name, sFields, sValues]);
end;

{ TSQLGenerateUpdate }

function TSQLGenerateUpdate.getSQLText: string;
const
  sqlUpdate =
    'UPDATE %s '+
    'SET '+
    '%s '+
    'WHERE id = :id ';
  sLine =
    ' %s = :%s%s ';
var
  sFields, sValues, s: string;
  i: integer;
begin
  sFields := '';
  sValues := '';
  s := ', ';
  for i := 0 to FFields.Count - 1 do begin
    if (i = FFields.Count - 1) then s := '';
    sFields := sFields + format(sLine, [FFields[i], FFields[i], s]);
  end;
  result := format(sqlUpdate, [FTable_name, sFields]);
end;

{ TTableUpdate }

constructor TTableUpdate.Create(connection: TFDConnection; table_name: string; afields: TFields;
  fieldsNotUsed: string);
var
  i: integer;
begin
  initializeSQLText(table_name, afields, fieldsNotUsed);
  Fquery := TFDQuery.Create(nil);
  Fquery.Connection := connection;
  with Fquery do begin
    SQL.Text := FSQLText;
    for i := 0 to afields.Count -1 do begin
      if FindParam(afields[i].FieldName) <> nil then begin
        with ParamByName(afields[i].FieldName) do begin
          ParamType := ptInput;
          DataType := afields[i].DataType;
          Value := afields[i].Value;
        end;
      end;
    end;
  end;
end;

procedure TTableUpdate.execSQL;
begin
  if Assigned(Fquery) then
    Fquery.ExecSQL;
end;

destructor TTableUpdate.Free;
begin
  if Assigned(Fquery) then
    Fquery.Free;
end;

{ TTableUpdateInsert }

procedure TTableUpdateInsert.initializeSQLText(table_name: string; fields: TFields; fieldsNotUsed: string);
begin
  with TSQLGenerateInsert.Create(table_name, fields, fieldsNotUsed) do begin
    FSQLText := SQLText;
    Free;
  end;
end;

{ TTableUpdateUpdate }

procedure TTableUpdateUpdate.initializeSQLText(table_name: string; fields: TFields; fieldsNotUsed: string);
begin
  with TSQLGenerateUpdate.Create(table_name, fields, fieldsNotUsed) do begin
    FSQLText := SQLText;
    Free;
  end;
end;

end.
