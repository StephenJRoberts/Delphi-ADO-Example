object frmStats: TfrmStats
  Left = 0
  Top = 0
  Caption = 'Stats'
  ClientHeight = 283
  ClientWidth = 436
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object pnlStats: TPanel
    Left = 8
    Top = 8
    Width = 425
    Height = 273
    Color = clGray
    ParentBackground = False
    TabOrder = 0
    object lblTotalTable1: TLabel
      Left = 16
      Top = 16
      Width = 94
      Height = 15
      Caption = 'Total for Table 1: 0'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lblTotalTable2: TLabel
      Left = 16
      Top = 37
      Width = 94
      Height = 15
      Caption = 'Total for Table 2: 0'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lblOldest1: TLabel
      Left = 16
      Top = 58
      Width = 131
      Height = 15
      Caption = 'Oldest Person in Table 1: '
    end
    object lblOldest2: TLabel
      Left = 16
      Top = 90
      Width = 131
      Height = 15
      Caption = 'Oldest Person in Table 2: '
    end
    object cboSelect: TComboBox
      Left = 16
      Top = 126
      Width = 153
      Height = 23
      TabOrder = 0
      TextHint = 'Stats for selected Person'
      OnChange = cboSelectChange
    end
    object mmoPersonBox: TMemo
      Left = 16
      Top = 155
      Width = 249
      Height = 89
      ReadOnly = True
      TabOrder = 1
    end
  end
end
