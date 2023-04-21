object frameCardEdit: TframeCardEdit
  Left = 0
  Top = 0
  Width = 999
  Height = 466
  TabOrder = 0
  object Label1: TLabel
    Left = 32
    Top = 80
    Width = 44
    Height = 13
    Caption = #1060#1072#1084#1080#1083#1080#1103
  end
  object Label2: TLabel
    Left = 175
    Top = 80
    Width = 19
    Height = 13
    Caption = #1048#1084#1103
  end
  object Label3: TLabel
    Left = 318
    Top = 80
    Width = 49
    Height = 13
    Caption = #1054#1090#1095#1077#1089#1090#1074#1086
  end
  object Label4: TLabel
    Left = 32
    Top = 136
    Width = 80
    Height = 13
    Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
  end
  object Label5: TLabel
    Left = 175
    Top = 136
    Width = 19
    Height = 13
    Caption = #1055#1086#1083
  end
  object Label6: TLabel
    Left = 32
    Top = 192
    Width = 44
    Height = 13
    Caption = #1058#1077#1083#1077#1092#1086#1085
  end
  object Label7: TLabel
    Left = 472
    Top = 80
    Width = 145
    Height = 13
    Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1084#1077#1089#1090#1077' '#1088#1072#1073#1086#1090#1099
  end
  object Label8: TLabel
    Left = 175
    Top = 192
    Width = 50
    Height = 13
    Caption = #1044#1086#1082#1091#1084#1077#1085#1090
  end
  object Label9: TLabel
    Left = 474
    Top = 192
    Width = 151
    Height = 13
    Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103
  end
  object Label10: TLabel
    Left = 474
    Top = 136
    Width = 31
    Height = 13
    Caption = #1040#1076#1088#1077#1089
  end
  object Label11: TLabel
    Left = 32
    Top = 8
    Width = 87
    Height = 13
    Caption = #1057#1090#1072#1090#1091#1089' '#1087#1072#1094#1080#1077#1085#1090#1072
  end
  object edLast_name: TcxDBTextEdit
    Left = 32
    Top = 104
    DataBinding.DataField = 'last_name'
    Properties.ValidateOnEnter = True
    Properties.ValidationOptions = [evoRaiseException, evoShowErrorIcon, evoAllowLoseFocus]
    Properties.OnValidate = edLast_namePropertiesValidate
    TabOrder = 0
    Width = 137
  end
  object edFirst_name: TcxDBTextEdit
    Left = 175
    Top = 104
    DataBinding.DataField = 'first_name'
    Properties.ValidationOptions = [evoRaiseException, evoShowErrorIcon, evoAllowLoseFocus]
    Properties.OnValidate = edFirst_namePropertiesValidate
    TabOrder = 1
    Width = 137
  end
  object edMiddle_name: TcxDBTextEdit
    Left = 318
    Top = 104
    DataBinding.DataField = 'middle_name'
    TabOrder = 2
    Width = 129
  end
  object edDate_birth: TcxDBDateEdit
    Left = 32
    Top = 160
    DataBinding.DataField = 'date_birth'
    Properties.ValidationOptions = [evoRaiseException, evoShowErrorIcon, evoAllowLoseFocus]
    Properties.OnValidate = edDate_birthPropertiesValidate
    TabOrder = 3
    Width = 121
  end
  object edGender: TcxDBLookupComboBox
    Left = 175
    Top = 160
    DataBinding.DataField = 'gender_id'
    Properties.KeyFieldNames = 'id'
    Properties.ListColumns = <
      item
        FieldName = 'name'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = dmMain.dsqGender
    Properties.ValidationOptions = [evoRaiseException, evoShowErrorIcon, evoAllowLoseFocus]
    Properties.OnValidate = edGenderPropertiesValidate
    TabOrder = 4
    Width = 121
  end
  object edPhone: TcxDBMaskEdit
    Left = 32
    Top = 216
    DataBinding.DataField = 'phone'
    TabOrder = 5
    Width = 137
  end
  object edJob_info: TcxDBTextEdit
    Left = 472
    Top = 104
    DataBinding.DataField = 'job_info'
    TabOrder = 6
    Width = 415
  end
  object edDocument_info: TcxDBTextEdit
    Left = 175
    Top = 216
    DataBinding.DataField = 'document_info'
    TabOrder = 7
    Width = 272
  end
  object edNote: TcxDBMemo
    Left = 474
    Top = 216
    DataBinding.DataField = 'note'
    TabOrder = 8
    Height = 89
    Width = 413
  end
  object edAddress: TcxDBTextEdit
    Left = 472
    Top = 160
    DataBinding.DataField = 'address'
    TabOrder = 9
    Width = 415
  end
  object edPatient_state: TcxDBLookupComboBox
    Left = 32
    Top = 32
    DataBinding.DataField = 'state_id'
    Properties.KeyFieldNames = 'id'
    Properties.ListColumns = <
      item
        FieldName = 'name'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = dmMain.dsqPatient_state
    TabOrder = 10
    Width = 145
  end
end
