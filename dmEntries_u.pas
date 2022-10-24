unit dmEntries_u;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TdmEntries = class(TDataModule)
    conEntriesDatabase: TADOConnection;
    tblEntries: TADOTable;
    dsEntries: TDataSource;
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
