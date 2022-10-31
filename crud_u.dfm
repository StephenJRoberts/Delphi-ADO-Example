object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Entries'
  ClientHeight = 438
  ClientWidth = 600
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object pnlData: TPanel
    Left = 0
    Top = 8
    Width = 361
    Height = 425
    Color = clGray
    ParentBackground = False
    TabOrder = 0
    object lblEntries: TLabel
      Left = 8
      Top = 8
      Width = 35
      Height = 15
      Caption = 'Entries'
      Color = clWhite
      DragMode = dmAutomatic
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lblTotalEntries: TLabel
      Left = 9
      Top = 29
      Width = 75
      Height = 15
      Caption = 'Total Entries: 0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lbEntries: TListBox
      Left = 8
      Top = 50
      Width = 345
      Height = 367
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemHeight = 20
      ParentFont = False
      TabOrder = 0
    end
    object btnStats: TButton
      Left = 278
      Top = 4
      Width = 75
      Height = 25
      Caption = 'Stats'
      TabOrder = 1
      OnClick = btnStatsClick
    end
  end
  object pnlButtons: TPanel
    Left = 367
    Top = 8
    Width = 226
    Height = 425
    Color = clGray
    ParentBackground = False
    TabOrder = 1
    object btnCreateEntry: TButton
      Left = 8
      Top = 8
      Width = 209
      Height = 49
      Caption = 'Create Entry'
      TabOrder = 0
      OnClick = btnCreateEntryClick
    end
    object btnUpdateEntry: TButton
      Left = 8
      Top = 63
      Width = 209
      Height = 49
      Caption = 'Edit Entry'
      TabOrder = 1
      OnClick = btnUpdateEntryClick
    end
    object btnDeleteEntry: TButton
      Left = 8
      Top = 118
      Width = 209
      Height = 49
      Caption = 'Delete Entry'
      TabOrder = 2
      OnClick = btnDeleteEntryClick
    end
    object btnRefresh: TButton
      Left = 8
      Top = 368
      Width = 209
      Height = 49
      Caption = 'Refresh'
      TabOrder = 3
      OnClick = btnRefreshClick
    end
    object btnChangeTable: TButton
      Left = 8
      Top = 328
      Width = 209
      Height = 34
      Caption = 'Change Table'
      TabOrder = 4
      OnClick = btnChangeTableClick
    end
  end
end
