object fmCardEdit: TfmCardEdit
  Left = 0
  Top = 0
  Caption = #1050#1072#1088#1090#1072' '#8470
  ClientHeight = 523
  ClientWidth = 978
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
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
    DataBinding.DataSource = dmCardEdit.dsqMedical_card
    TabOrder = 1
    Width = 137
  end
  object edFirst_name: TcxDBTextEdit
    Left = 175
    Top = 104
    DataBinding.DataField = 'first_name'
    DataBinding.DataSource = dmCardEdit.dsqMedical_card
    TabOrder = 2
    Width = 137
  end
  object edMiddle_name: TcxDBTextEdit
    Left = 318
    Top = 104
    DataBinding.DataField = 'middle_name'
    DataBinding.DataSource = dmCardEdit.dsqMedical_card
    TabOrder = 3
    Width = 129
  end
  object edDate_birth: TcxDBDateEdit
    Left = 32
    Top = 160
    DataBinding.DataField = 'date_birth'
    DataBinding.DataSource = dmCardEdit.dsqMedical_card
    TabOrder = 4
    Width = 121
  end
  object edGender: TcxDBLookupComboBox
    Left = 175
    Top = 160
    DataBinding.DataField = 'gender_id'
    DataBinding.DataSource = dmCardEdit.dsqMedical_card
    Properties.KeyFieldNames = 'id'
    Properties.ListColumns = <
      item
        FieldName = 'name'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = dmCard.dsqGender
    TabOrder = 5
    Width = 121
  end
  object edPhone: TcxDBMaskEdit
    Left = 32
    Top = 216
    DataBinding.DataField = 'phone'
    DataBinding.DataSource = dmCardEdit.dsqMedical_card
    TabOrder = 6
    Width = 137
  end
  object edJob_info: TcxDBTextEdit
    Left = 472
    Top = 104
    DataBinding.DataField = 'job_info'
    DataBinding.DataSource = dmCardEdit.dsqMedical_card
    TabOrder = 8
    Width = 415
  end
  object edDocument_info: TcxDBTextEdit
    Left = 175
    Top = 216
    DataBinding.DataField = 'document_info'
    DataBinding.DataSource = dmCardEdit.dsqMedical_card
    TabOrder = 7
    Width = 272
  end
  object edNote: TcxDBMemo
    Left = 474
    Top = 216
    DataBinding.DataField = 'note'
    DataBinding.DataSource = dmCardEdit.dsqMedical_card
    TabOrder = 10
    Height = 89
    Width = 413
  end
  object edAddress: TcxDBTextEdit
    Left = 472
    Top = 160
    DataBinding.DataField = 'address'
    DataBinding.DataSource = dmCardEdit.dsqMedical_card
    TabOrder = 9
    Width = 415
  end
  object edPatient_state: TcxDBLookupComboBox
    Left = 32
    Top = 32
    DataBinding.DataField = 'state_id'
    DataBinding.DataSource = dmCardEdit.dsqMedical_card
    Properties.KeyFieldNames = 'id'
    Properties.ListColumns = <
      item
        FieldName = 'name'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = dmCard.dsqPatient_state
    TabOrder = 0
    Width = 145
  end
end
