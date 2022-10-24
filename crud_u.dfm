object fCRUD: TfCRUD
  Left = 0
  Top = 0
  Caption = 'Entries'
  ClientHeight = 440
  ClientWidth = 596
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object panData: TPanel
    Left = 0
    Top = 8
    Width = 361
    Height = 425
    Color = clGray
    ParentBackground = False
    TabOrder = 0
    object lEntries: TLabel
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
    object lbEntries: TListBox
      Left = 8
      Top = 29
      Width = 345
      Height = 388
      ItemHeight = 15
      TabOrder = 0
    end
  end
  object panButtons: TPanel
    Left = 367
    Top = 8
    Width = 226
    Height = 425
    Color = clGray
    ParentBackground = False
    TabOrder = 1
    object bCreateEntry: TButton
      Left = 8
      Top = 8
      Width = 209
      Height = 49
      Caption = 'Create Entry'
      TabOrder = 0
      OnClick = bCreateEntryClick
    end
    object bUpdateEntry: TButton
      Left = 8
      Top = 63
      Width = 209
      Height = 49
      Caption = 'Edit Entry'
      TabOrder = 1
      OnClick = bUpdateEntryClick
    end
    object bDeleteEntry: TButton
      Left = 8
      Top = 118
      Width = 209
      Height = 49
      Caption = 'Delete Entry'
      TabOrder = 2
      OnClick = bDeleteEntryClick
    end
    object bRefresh: TButton
      Left = 8
      Top = 368
      Width = 209
      Height = 49
      Caption = 'Refresh'
      TabOrder = 3
      OnClick = bRefreshClick
    end
  end
end
