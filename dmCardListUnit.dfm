object dmCardList: TdmCardList
  OldCreateOrder = False
  Height = 547
  Width = 772
  object qMedical_card: TFDQuery
    OnCalcFields = qMedical_cardCalcFields
    Connection = dmMain.FDConnection
    SQL.Strings = (
      'SELECT'#10#9'medical_card."id",'
      ' '#10#9'medical_card.first_name, '
      '        medical_card.last_name, '
      #10#9'medical_card.middle_name, '
      #10#9'medical_card.date_birth, '
      #10#9'medical_card.phone, '
      #10#9'medical_card.job_info, '
      #10#9'medical_card.document_info, '
      #10#9'medical_card.note, '
      #10#9'medical_card.address, '
      #10#9'medical_card.date_created, '
      #10#9'patient_state."name" AS state_name, '
      #10#9'gender."name" AS gender_name'
      'FROM'#10#9'medical_card'#10#9
      '    LEFT JOIN'#10#9
      
        '        patient_state'#10' ON medical_card.state_id = patient_state.' +
        '"id"'#10
      '    LEFT JOIN gender ON'#9'medical_card.gender_id = gender."id"')
    Left = 56
    Top = 88
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
    object qMedical_cardstate_name: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'state_name'
      Origin = 'state_name'
      Size = 50
    end
    object qMedical_cardgender_name: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'gender_name'
      Origin = 'gender_name'
      Size = 50
    end
    object qMedical_cardfio: TStringField
      FieldKind = fkCalculated
      FieldName = 'fio'
      Size = 50
      Calculated = True
    end
  end
  object dsqMedical_card: TDataSource
    DataSet = qMedical_card
    Left = 56
    Top = 144
  end
end
