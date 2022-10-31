object frmCreateEntry: TfrmCreateEntry
  Left = 0
  Top = 0
  Caption = 'Create Entry'
  ClientHeight = 298
  ClientWidth = 329
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object pnlCreateEntry: TPanel
    Left = 8
    Top = 8
    Width = 313
    Height = 281
    Color = clGray
    ParentBackground = False
    TabOrder = 0
    object lFirstName: TLabel
      Left = 56
      Top = 62
      Width = 74
      Height = 20
      Caption = 'First Name:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lLastName: TLabel
      Left = 56
      Top = 96
      Width = 73
      Height = 20
      Caption = 'Last Name:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lDoB: TLabel
      Left = 95
      Top = 130
      Width = 34
      Height = 20
      Caption = 'DOB:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lError: TLabel
      Left = 87
      Top = 179
      Width = 28
      Height = 15
      Caption = 'lError'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object edtFirstName: TEdit
      Left = 136
      Top = 59
      Width = 121
      Height = 28
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TextHint = 'First Name'
    end
    object edtLastName: TEdit
      Left = 135
      Top = 93
      Width = 121
      Height = 28
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      TextHint = 'Last Name'
    end
    object dtpDOB: TDateTimePicker
      Left = 135
      Top = 127
      Width = 121
      Height = 28
      Date = 44858.000000000000000000
      Time = 0.483991331020661200
      TabOrder = 2
    end
    object btnSubmit: TButton
      Left = 87
      Top = 200
      Width = 138
      Height = 41
      Caption = 'Submit'
      TabOrder = 3
      OnClick = btnSubmitClick
    end
  end
end
