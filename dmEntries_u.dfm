object dmEntries: TdmEntries
  Height = 150
  Width = 328
  object conEntriesDatabase: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\Users\steph\Docu' +
      'ments\DelphiProjects\CRM_U\Database2.mdb;Mode=ReadWrite;Persist ' +
      'Security Info=False'
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
end
