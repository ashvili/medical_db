object fmCardList: TfmCardList
  Left = 0
  Top = 0
  Caption = #1057#1087#1080#1089#1086#1082' '#1084#1077#1076#1080#1094#1080#1085#1089#1082#1080#1093' '#1082#1072#1088#1090
  ClientHeight = 511
  ClientWidth = 818
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxPG: TcxPageControl
    Left = 0
    Top = 115
    Width = 818
    Height = 396
    Align = alClient
    TabOrder = 0
    Properties.ActivePage = cxTabSheet1
    Properties.CustomButtons.Buttons = <>
    ExplicitTop = 89
    ExplicitHeight = 422
    ClientRectBottom = 392
    ClientRectLeft = 4
    ClientRectRight = 814
    ClientRectTop = 24
    object cxTabSheet1: TcxTabSheet
      Tag = -2
      Caption = #1057#1087#1080#1089#1086#1082' '#1082#1072#1088#1090
      ImageIndex = 0
      ExplicitHeight = 394
      object cxGrid1: TcxGrid
        Left = 0
        Top = 0
        Width = 810
        Height = 368
        Align = alClient
        TabOrder = 0
        ExplicitHeight = 394
        object cxGrid1DBTableView1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.First.Visible = True
          Navigator.Buttons.PriorPage.Visible = True
          Navigator.Buttons.Prior.Visible = True
          Navigator.Buttons.Next.Visible = True
          Navigator.Buttons.NextPage.Visible = True
          Navigator.Buttons.Last.Visible = True
          Navigator.Buttons.Insert.Visible = True
          Navigator.Buttons.Append.Visible = False
          Navigator.Buttons.Delete.Visible = True
          Navigator.Buttons.Edit.Visible = True
          Navigator.Buttons.Post.Visible = True
          Navigator.Buttons.Cancel.Visible = True
          Navigator.Buttons.Refresh.Visible = True
          Navigator.Buttons.SaveBookmark.Visible = True
          Navigator.Buttons.GotoBookmark.Visible = True
          Navigator.Buttons.Filter.Visible = True
          FindPanel.DisplayMode = fpdmAlways
          FindPanel.InfoText = #1042#1074#1077#1076#1080#1090#1077' '#1090#1077#1082#1089#1090' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072'...'
          DataController.DataSource = dmCard.dsqMedical_card
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsCustomize.ColumnSorting = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.CellAutoHeight = True
          OptionsView.GroupByBox = False
          OptionsView.HeaderAutoHeight = True
          OptionsView.Indicator = True
          object cxGrid1DBTableView1id: TcxGridDBColumn
            Caption = #1050#1086#1076
            DataBinding.FieldName = 'id'
            HeaderAlignmentHorz = taCenter
          end
          object cxGrid1DBTableView1fio: TcxGridDBColumn
            Caption = #1060#1048#1054
            DataBinding.FieldName = 'fio'
            HeaderAlignmentHorz = taCenter
            Width = 200
          end
          object cxGrid1DBTableView1date_birth: TcxGridDBColumn
            Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
            DataBinding.FieldName = 'date_birth'
            HeaderAlignmentHorz = taCenter
          end
          object cxGrid1DBTableView1gender_name: TcxGridDBColumn
            Caption = #1055#1086#1083
            DataBinding.FieldName = 'gender_name'
            HeaderAlignmentHorz = taCenter
            Width = 71
          end
          object cxGrid1DBTableView1phone: TcxGridDBColumn
            Caption = #1058#1077#1083#1077#1092#1086#1085
            DataBinding.FieldName = 'phone'
            HeaderAlignmentHorz = taCenter
            Width = 122
          end
          object cxGrid1DBTableView1job_info: TcxGridDBColumn
            Caption = #1057#1074#1077#1076#1077#1085#1080#1103' '#1086' '#1088#1072#1073#1086#1090#1077
            DataBinding.FieldName = 'job_info'
            HeaderAlignmentHorz = taCenter
            Width = 300
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxGrid1DBTableView1
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 26
    Width = 818
    Height = 89
    Align = alTop
    TabOrder = 1
    ExplicitTop = 0
  end
  object ActionToolBar1: TActionToolBar
    Left = 0
    Top = 0
    Width = 818
    Height = 26
    ActionManager = ActionManager1
    Caption = 'ActionToolBar1'
    Color = clMenuBar
    ColorMap.DisabledFontColor = 7171437
    ColorMap.HighlightColor = clWhite
    ColorMap.BtnSelectedFont = clBlack
    ColorMap.UnusedColor = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Spacing = 0
  end
  object ActionManager1: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Action = aShow
            ImageIndex = 0
          end
          item
            Action = aEdit
            ImageIndex = 3
          end
          item
            Action = aNew
            ImageIndex = 1
          end
          item
            Action = aDelete
            ImageIndex = 2
          end
          item
            Action = aExit
            ImageIndex = 5
          end>
        ActionBar = ActionToolBar1
      end>
    Images = dmCard.cxImageList1
    Left = 456
    Top = 72
    StyleName = 'IDE Theme Style'
    object aShow: TAction
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100
      ImageIndex = 0
      OnExecute = aShowExecute
    end
    object aEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      ImageIndex = 3
      OnExecute = aEditExecute
    end
    object aNew: TAction
      Caption = #1053#1086#1074#1072#1103' '#1082#1072#1088#1090#1072
      ImageIndex = 1
      OnExecute = aNewExecute
    end
    object aDelete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1082#1072#1088#1090#1091
      ImageIndex = 2
      OnExecute = aDeleteExecute
    end
    object aExit: TAction
      Caption = #1042#1099#1093#1086#1076
      ImageIndex = 5
    end
  end
end
