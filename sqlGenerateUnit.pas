unit sqlGenerateUnit;
{
helper for create sql-queries for insert, update, filtering
}
interface

uses System.Classes, Data.DB, FireDAC.Comp.Client;

type

  { base class for insert, update operations }
  TSQLGenerate = class
  private
    FTable_name: string;
    FFields: TStringList;   // list of fields for update/insert
    FFieldsNotUsed: string; // fields from input field-list, which should be excluded

    function canUseField(field_name: string): boolean;
    function getSQLText: string; virtual; abstract; // result text for query
  public
    constructor Create(table_name: string; fields: TFields; fieldsNotUsed: string = '');
    destructor Free;

    property SQLText: string read getSQLText;
  end;


  { use - qQueryInsert.SQL.Text := TSQLGenerate.Create('table_name', fields).SQLText; }
  TSQLGenerateInsert = class(TSQLGenerate)
  private
    function getSQLText: string; override; // query for insert
  end;


  TSQLGenerateUpdate = class(TSQLGenerate)
  private
    function getSQLText: string; override;
  end;


  {Update table class
   base class for update table in DB from table-in-memory }
  TTableUpdate = class
  private
    Fquery: TFDQuery;
    FSQLText: string;

    procedure initializeSQLText(table_name: string; fields: TFields; fieldsNotUsed: string); virtual; abstract;
  public
    constructor Create(connection: TFDConnection; table_name: string; afields: TFields; fieldsNotUsed: string = '');
    destructor Free;
    procedure Execute;
  end;

  {use - TTableUpdateInsert.Create(FDConnection, 'table_name', table.Fields).Execute }
  TTableUpdateInsert = class(TTableUpdate)
  private
    procedure initializeSQLText(table_name: string; fields: TFields; fieldsNotUsed: string); override;
  end;

  TTableUpdateUpdate = class(TTableUpdate)
  private
    procedure initializeSQLText(table_name: string; fields: TFields; fieldsNotUsed: string); override;
  end;

  { generate condition-string for queries }
  TConditionType = (ctEq, ctIn, ctLike);
  TConnectionType = (ctAnd, ctOr);

  { class for the item of list of conditions }
  TValue = class
  private
    Fvalue: variant;               // value for condition
    Fcondition: TConditionType;    // =, like, etc
    Fconnection: TConnectionType;  // between conditions (and, or)

    function getConditionStr: string;
    function getConnectionStr: string;
  public
    property value: variant read Fvalue;
    property condition: string read getConditionStr;
    property connection: string read getConnectionStr;

    constructor Create(value: variant; condition: TConditionType; connection: TConnectionType);
  end;

  { class for generate condition-string
    like "(field1 = 1) and (field2 like '%str%') and (field3 in (1, 2, 3)" ) }
  { this class is not full completed }
  TSQLCondition = class
  private
    FsqlSelect: string;
    FConditions: TStringList;
    FSQLText: string;

    function getSQLText: string;  // result string
  public
    property SQLText: string read getSQLText;

    constructor Create(sqlSelect: string = '');
    destructor Free;
    function addAnd(field, value: string; condition: TConditionType): TSQLCondition;
    function addOr(field, value: string; condition: TConditionType): TSQLCondition;
  end;

implementation

uses System.SysUtils, StrUtils, Variants;

{ TSQLGenerate }


function TSQLGenerate.canUseField(field_name: string): boolean;
{ test for usable field }
begin
  result := (field_name.ToLower <> 'recid') and        // excude dxMemTable service field
            (field_name.ToLower <> 'id') and           // and autoincremental id
            (Pos(format('"%s"', [field_name.ToLower]), // and for fieldsnotsued
              FFieldsNotUsed.ToLower) = 0);
end;

constructor TSQLGenerate.Create(table_name: string; fields: TFields;
  fieldsNotUsed: string);
var
  f: TField;
begin
  FTable_name := table_name;
  FFieldsNotUsed := fieldsNotUsed;
  // fill the fields-list
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
  // create text for sql
  initializeSQLText(table_name, afields, fieldsNotUsed);
  Fquery := TFDQuery.Create(nil);
  Fquery.Connection := connection;
  with Fquery do begin
    SQL.Text := FSQLText;
    // fill the parameters TDquery from input fields
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

procedure TTableUpdate.Execute;
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

{ TSQLCondition }

function TSQLCondition.addAnd(field, value: string;
// add the condition 'AND' to the chain
  condition: TConditionType): TSQLCondition;
var
  v: TValue;
begin
  v := TValue.Create(value, condition, ctAnd);
  FConditions.AddObject(field, v);
  result := self;
end;

function TSQLCondition.addOr(field, value: string;
  condition: TConditionType): TSQLCondition;
// add the condition 'OR' to the chain
var
  v: TValue;
begin
  v := TValue.Create(value, condition, ctOr);
  FConditions.AddObject(field, v);
  result := self;
end;

constructor TSQLCondition.Create(sqlSelect: string);
begin
  FsqlSelect := sqlSelect;
  FConditions := TStringList.Create;
end;

destructor TSQLCondition.Free;
begin
  if Assigned(FConditions) then begin
    while FConditions.Count > 0 do
      FConditions.Delete(0);
    FreeAndNil(FConditions);
  end;
end;

function TSQLCondition.getSQLText: string;
var
  i: integer;
  prev: string;
begin
  result := '';
  FSQLText := '';
  prev := '';
  for i := 0 to FConditions.Count - 1 do begin
    if FSQLText <> '' then
      prev := TValue(FConditions.Objects[i]).connection;
    FSQLText := Format('%s %s (%s %s %s)', [FSQLText,
                                    prev,
                                    FConditions[i],
                                    TValue(FConditions.Objects[i]).condition,
                                    TValue(FConditions.Objects[i]).value ])

  end;
  result := FSQLText;
end;

{ TValue }

constructor TValue.Create(value: variant; condition: TConditionType; connection: TConnectionType);
begin
  Fcondition := condition;
  Fconnection := connection;
  case condition of
    ctEq: begin
      if VarIsType(value, varString) then
        Fvalue := VarToStr(value).QuotedString
      else
        Fvalue := VarToStr(value);
    end;
    ctLike: Fvalue := ('%%' + VarToStr(value) + '%%').QuotedString;
    ctIn: FValue := '(' + VarToStr(value) + ')';
  end;

end;

function TValue.getConditionStr: string;
begin
  case Fcondition of
    ctEq: result := '=';
    ctIn: result := 'in';
    ctLike: result := 'like';
  else
    result := '';
  end;
end;

function TValue.getConnectionStr: string;
begin
  case Fconnection of
    ctAnd: result := 'and';
    ctOr: result := 'or';
  else
    result := '';
  end;
end;

end.
