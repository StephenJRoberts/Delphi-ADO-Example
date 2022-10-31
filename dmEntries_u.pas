unit dmEntries_u;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TdmEntries = class(TDataModule)
    conEntriesDatabase: TADOConnection;
    tblEntries: TADOTable;
    dsEntries: TDataSource;
    qryCount: TADOQuery;
    qryCounttotal: TIntegerField;
    qryOldest: TADOQuery;
    qryOldestID: TAutoIncField;
    qryOldestFirstName: TWideStringField;
    qryOldestLastName: TWideStringField;
    qryOldestDateOfBirth: TDateTimeField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmEntries: TdmEntries;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
