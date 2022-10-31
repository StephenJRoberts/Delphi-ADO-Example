object dmEntries: TdmEntries
  Height = 150
  Width = 328
  object conEntriesDatabase: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\Users\steph\Docu' +
      'ments\DelphiProjects\CRD_U\Delphi-CRD-Example\Database2.mdb;Mode' +
      '=ReadWrite;Persist Security Info=False;Jet OLEDB:System database' +
      '="";Jet OLEDB:Registry Path="";Jet OLEDB:Database Password="";Je' +
      't OLEDB:Engine Type=5;Jet OLEDB:Database Locking Mode=1;Jet OLED' +
      'B:Global Partial Bulk Ops=2;Jet OLEDB:Global Bulk Transactions=1' +
      ';Jet OLEDB:New Database Password="";Jet OLEDB:Create System Data' +
      'base=False;Jet OLEDB:Encrypt Database=False;Jet OLEDB:Don'#39't Copy' +
      ' Locale on Compact=False;Jet OLEDB:Compact Without Replica Repai' +
      'r=False;Jet OLEDB:SFP=False'
    LoginPrompt = False
    Mode = cmReadWrite
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 32
    Top = 16
  end
  object tblEntries: TADOTable
    Active = True
    Connection = conEntriesDatabase
    CursorType = ctStatic
    TableName = 'tableEntries'
    Left = 64
    Top = 16
  end
  object dsEntries: TDataSource
    DataSet = tblEntries
    Left = 96
    Top = 16
  end
  object qryCount: TADOQuery
    Active = True
    Connection = conEntriesDatabase
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select Count(*) as total from tableEntries')
    Left = 128
    Top = 16
    object qryCounttotal: TIntegerField
      FieldName = 'total'
    end
  end
  object qryOldest: TADOQuery
    Active = True
    Connection = conEntriesDatabase
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tableEntries')
    Left = 160
    Top = 16
    object qryOldestID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object qryOldestFirstName: TWideStringField
      FieldName = 'FirstName'
      Size = 255
    end
    object qryOldestLastName: TWideStringField
      FieldName = 'LastName'
      Size = 255
    end
    object qryOldestDateOfBirth: TDateTimeField
      FieldName = 'DateOfBirth'
    end
  end
end
