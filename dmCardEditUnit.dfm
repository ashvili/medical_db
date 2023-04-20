object dmCardEdit: TdmCardEdit
  OldCreateOrder = False
  Height = 482
  Width = 667
  object qMedical_card: TFDQuery
    Connection = dmMain.FDConnection
    SQL.Strings = (
      'SELECT medical_card.*'
      'FROM'#10' medical_card'#10
      'WHERE id = :id;')
    Left = 56
    Top = 88
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qMedical_cardid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qMedical_cardfirst_name: TWideStringField
      FieldName = 'first_name'
      Origin = 'first_name'
      Size = 50
    end
    object qMedical_cardlast_name: TWideStringField
      FieldName = 'last_name'
      Origin = 'last_name'
      Size = 50
    end
    object qMedical_cardmiddle_name: TWideStringField
      FieldName = 'middle_name'
      Origin = 'middle_name'
      Size = 50
    end
    object qMedical_carddate_birth: TDateField
      FieldName = 'date_birth'
      Origin = 'date_birth'
    end
    object qMedical_cardgender_id: TSmallintField
      FieldName = 'gender_id'
      Origin = 'gender_id'
    end
    object qMedical_cardphone: TWideStringField
      FieldName = 'phone'
      Origin = 'phone'
      Size = 50
    end
    object qMedical_cardjob_info: TWideStringField
      FieldName = 'job_info'
      Origin = 'job_info'
      Size = 150
    end
    object qMedical_carddocument_info: TWideStringField
      FieldName = 'document_info'
      Origin = 'document_info'
      Size = 50
    end
    object qMedical_cardnote: TWideMemoField
      FieldName = 'note'
      Origin = 'note'
      BlobType = ftWideMemo
    end
    object qMedical_cardaddress: TWideStringField
      FieldName = 'address'
      Origin = 'address'
      Size = 150
    end
    object qMedical_carddate_created: TDateField
      FieldName = 'date_created'
      Origin = 'date_created'
    end
    object qMedical_cardstate_id: TSmallintField
      FieldName = 'state_id'
      Origin = 'state_id'
    end
  end
  object dsqMedical_card: TDataSource
    DataSet = dMedical_card
    Left = 56
    Top = 144
  end
  object dMedical_card: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 136
    Top = 96
    object dMedical_cardid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
    end
    object dMedical_cardfirst_name: TWideStringField
      FieldName = 'first_name'
      Origin = 'first_name'
      Size = 50
    end
    object dMedical_cardlast_name: TWideStringField
      FieldName = 'last_name'
      Origin = 'last_name'
      Size = 50
    end
    object dMedical_cardmiddle_name: TWideStringField
      FieldName = 'middle_name'
      Origin = 'middle_name'
      Size = 50
    end
    object dMedical_carddate_birth: TDateField
      FieldName = 'date_birth'
      Origin = 'date_birth'
    end
    object dMedical_cardgender_id: TSmallintField
      FieldName = 'gender_id'
      Origin = 'gender_id'
    end
    object dMedical_cardphone: TWideStringField
      FieldName = 'phone'
      Origin = 'phone'
      Size = 50
    end
    object dMedical_cardjob_info: TWideStringField
      FieldName = 'job_info'
      Origin = 'job_info'
      Size = 150
    end
    object dMedical_carddocument_info: TWideStringField
      FieldName = 'document_info'
      Origin = 'document_info'
      Size = 50
    end
    object dMedical_cardnote: TWideMemoField
      FieldName = 'note'
      Origin = 'note'
      BlobType = ftWideMemo
    end
    object WideStringField7: TWideStringField
      FieldName = 'address'
      Origin = 'address'
      Size = 150
    end
    object dMedical_carddate_created: TDateField
      FieldName = 'date_created'
      Origin = 'date_created'
    end
    object dMedical_cardstate_id: TSmallintField
      FieldName = 'state_id'
      Origin = 'state_id'
    end
  end
end
