object fmCardList: TfmCardList
  Left = 0
  Top = 0
  Caption = #1057#1087#1080#1089#1086#1082' '#1084#1077#1076#1080#1094#1080#1085#1089#1082#1080#1093' '#1082#1072#1088#1090
  ClientHeight = 511
  ClientWidth = 972
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxPG: TcxPageControl
    Left = 0
    Top = 126
    Width = 972
    Height = 385
    Align = alClient
    TabOrder = 0
    Properties.ActivePage = cxTabSheet1
    Properties.CustomButtons.Buttons = <>
    ClientRectBottom = 381
    ClientRectLeft = 4
    ClientRectRight = 968
    ClientRectTop = 24
    object cxTabSheet1: TcxTabSheet
      Tag = -2
      Caption = #1057#1087#1080#1089#1086#1082' '#1082#1072#1088#1090
      ImageIndex = 0
      object cxGrid1: TcxGrid
        Left = 0
        Top = 0
        Width = 964
        Height = 357
        Align = alClient
        TabOrder = 0
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
          OnCellDblClick = cxGrid1DBTableView1CellDblClick
          DataController.DataSource = dmCardList.dsqMedical_card
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skCount
              Column = cxGrid1DBTableView1fio
            end>
          DataController.Summary.SummaryGroups = <>
          Filtering.ColumnMRUItemsList = False
          OptionsBehavior.IncSearch = True
          OptionsBehavior.ImmediateEditor = False
          OptionsCustomize.ColumnGrouping = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.CellAutoHeight = True
          OptionsView.Footer = True
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
          object cxGrid1DBTableView1state_name: TcxGridDBColumn
            Caption = #1057#1090#1072#1090#1091#1089' '#1087#1072#1094#1080#1077#1085#1090#1072
            DataBinding.FieldName = 'state_name'
            HeaderAlignmentHorz = taCenter
            Width = 146
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
  object dxRibbon1: TdxRibbon
    Left = 0
    Top = 0
    Width = 972
    Height = 126
    BarManager = dxBarManager1
    ColorSchemeName = 'Silver'
    Contexts = <>
    TabOrder = 1
    TabStop = False
    object dxRibbon1Tab1: TdxRibbonTab
      Active = True
      Caption = #1043#1083#1072#1074#1085#1072#1103
      Groups = <
        item
          Caption = #1050#1072#1088#1090#1099
          ToolbarName = 'dxBarManager1Bar1'
        end
        item
          Caption = #1057#1086#1093#1088#1072#1085#1077#1085#1080#1077
          ToolbarName = 'dxBarManager1Bar2'
        end>
      Index = 0
    end
    object dxRibbon1Tab2: TdxRibbonTab
      Caption = #1060#1080#1083#1100#1090#1088
      Groups = <
        item
          Caption = #1060#1080#1083#1100#1090#1088
          ToolbarName = 'dxBarManager1Bar3'
        end>
      Index = 1
    end
    object dxRibbon1Tab3: TdxRibbonTab
      Caption = #1054#1090#1095#1105#1090#1099
      Groups = <>
      Visible = False
      Index = 2
    end
  end
  object Panel1: TPanel
    Left = 416
    Top = 46
    Width = 353
    Height = 74
    BevelOuter = bvNone
    TabOrder = 2
    object edFIO: TcxMRUEdit
      Left = 110
      Top = 2
      Properties.ImmediatePost = True
      Properties.ShowEllipsis = False
      TabOrder = 0
      Width = 227
    end
    object cxLabel1: TcxLabel
      Left = 8
      Top = 3
      Caption = #1060#1048#1054
      Transparent = True
    end
    object cxLabel2: TcxLabel
      Left = 8
      Top = 26
      Caption = #1057#1090#1072#1090#1091#1089' '#1087#1072#1094#1080#1077#1085#1090#1072
      Transparent = True
    end
    object cxLabel3: TcxLabel
      Left = 8
      Top = 49
      Caption = #1055#1086#1083
      Transparent = True
    end
    object edPatient_state: TcxLookupComboBox
      Left = 110
      Top = 25
      Properties.KeyFieldNames = 'id'
      Properties.ListColumns = <
        item
          FieldName = 'name'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dmMain.dsqPatient_state
      TabOrder = 4
      Width = 227
    end
    object edGender: TcxLookupComboBox
      Left = 110
      Top = 48
      Properties.KeyFieldNames = 'id'
      Properties.ListColumns = <
        item
          FieldName = 'name'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dmMain.dsqGender
      TabOrder = 5
      Width = 227
    end
  end
  object ActionManager1: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Action = aNew
            ImageIndex = 1
          end
          item
            Action = aEdit
            ImageIndex = 3
          end
          item
            Action = aDelete
            ImageIndex = 2
          end
          item
            Action = aSave
            ImageIndex = 4
          end
          item
            Action = aClose
            ImageIndex = 5
          end>
      end
      item
      end>
    Images = dmMain.cxImageList
    Left = 448
    Top = 232
    StyleName = 'Standard'
    object aFilterApply: TAction
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      ImageIndex = 0
      OnExecute = aFilterApplyExecute
    end
    object aEdit: TAction
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      ImageIndex = 3
      OnExecute = aEditExecute
    end
    object aNew: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 1
      OnExecute = aNewExecute
    end
    object aDelete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 2
      OnExecute = aDeleteExecute
    end
    object aClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ImageIndex = 5
      OnExecute = aCloseExecute
    end
    object aSave: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ImageIndex = 4
      OnExecute = aSaveExecute
    end
  end
  object dxBarManager1: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'list'
      'filter'
      'report')
    Categories.ItemsVisibles = (
      2
      2
      2)
    Categories.Visibles = (
      True
      True
      True)
    ImageOptions.Images = dmMain.cxImageList
    ImageOptions.LargeImages = dmMain.cxImageListLarge
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 532
    Top = 233
    PixelsPerInch = 96
    object dxBarManager1Bar1: TdxBar
      Caption = #1050#1072#1088#1090#1099
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 1000
      FloatTop = 2
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxLargeNew_card'
        end
        item
          Visible = True
          ItemName = 'dxLargeEdit_card'
        end
        item
          Visible = True
          ItemName = 'dxDelete_card'
        end
        item
          Visible = True
          ItemName = 'dxCardClose'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxBarManager1Bar2: TdxBar
      Caption = #1057#1086#1093#1088#1072#1085#1077#1085#1080#1077
      CaptionButtons = <>
      DockedLeft = 246
      DockedTop = 0
      FloatLeft = 1000
      FloatTop = 2
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxLargeSave_card'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxBarManager1Bar3: TdxBar
      Caption = #1060#1080#1083#1100#1090#1088
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 1000
      FloatTop = 2
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxFilterPanel'
        end
        item
          Visible = True
          ItemName = 'dxFilterApply'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxNew_card: TdxBarButton
      Action = aNew
      Category = 0
    end
    object dxEditCard: TdxBarButton
      Action = aEdit
      Category = 0
    end
    object dxDelete_card: TdxBarButton
      Action = aDelete
      Category = 0
    end
    object dxLargeNew_card: TdxBarLargeButton
      Action = aNew
      Category = 0
    end
    object dxLargeSave_card: TdxBarLargeButton
      Action = aSave
      Category = 0
    end
    object dxCardClose: TdxBarButton
      Action = aClose
      Category = 0
    end
    object dxLargeEdit_card: TdxBarLargeButton
      Action = aEdit
      Category = 0
    end
    object dxFilterPanel: TdxBarControlContainerItem
      Caption = #1060#1080#1083#1100#1090#1088
      Category = 1
      Hint = #1060#1080#1083#1100#1090#1088
      Visible = ivAlways
      Control = Panel1
    end
    object dxFilterApply: TdxBarLargeButton
      Action = aFilterApply
      Category = 1
      ButtonStyle = bsChecked
    end
  end
  object dxBarPopupMenu1: TdxBarPopupMenu
    BarManager = dxBarManager1
    ItemLinks = <>
    UseOwnFont = False
    Left = 572
    Top = 297
    PixelsPerInch = 96
  end
end
