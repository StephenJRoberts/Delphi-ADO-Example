unit crud_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, dmEntries_u,
  Data.DB, Vcl.Grids, Vcl.DBGrids, CreateEntry_u, edit_u, Vcl.ComCtrls, stats_u;

type
  TfrmMain = class(TForm)
    pnlData: TPanel;
    lblEntries: TLabel;
    lbEntries: TListBox;
    pnlButtons: TPanel;
    btnCreateEntry: TButton;
    btnUpdateEntry: TButton;
    btnDeleteEntry: TButton;
    btnRefresh: TButton;
    lblTotalEntries: TLabel;
    btnChangeTable: TButton;
    btnStats: TButton;
    procedure btnCreateEntryClick(Sender: TObject);
    procedure btnUpdateEntryClick(Sender: TObject);
    procedure btnDeleteEntryClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnChangeTableClick(Sender: TObject);
    procedure RefreshData;
    procedure btnStatsClick(Sender: TObject);
  private
    { Private declarations }
    idArray:array [0..100] of integer;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

{ Change Table }
procedure TfrmMain.btnChangeTableClick(Sender: TObject);
begin
dmEntries.tblEntries.Active := false;
if dmEntries.tblEntries.TableName = 'tableEntries' then
begin
dmEntries.tblEntries.TableName := 'tableEntries1';
end
else
begin
dmEntries.tblEntries.TableName := 'tableEntries';
end;
dmEntries.tblEntries.Active := true;
dmEntries.qryCount.Active := false;
RefreshData;
end;

{ Create Entry Button }
procedure TfrmMain.btnCreateEntryClick(Sender: TObject);
begin
  frmCreateEntry.ShowModal;
end;

{ Delete Entry Button }
procedure TfrmMain.btnDeleteEntryClick(Sender: TObject);
var
  iSelectedID:integer;
begin
    iSelectedID := idArray[lbEntries.ItemIndex];
    with dmEntries do
    begin
        if tblEntries.Locate('ID', iSelectedID, []) then
          begin
            tblEntries.Delete;
            showmessage('Entry Deleted')
          end
        else
          begin
            showmessage('Entry Not Found')
          end;
    end;
end;

{ Refresh Button }
procedure TfrmMain.btnRefreshClick(Sender: TObject);
begin
RefreshData;
end;

{ Stats Page }
procedure TfrmMain.btnStatsClick(Sender: TObject);
begin
  frmStats.ShowModal;
end;

{ Edit Entry Button }
procedure TfrmMain.btnUpdateEntryClick(Sender: TObject);
var
  iSelectedID:integer;
begin
  iSelectedID := idArray[lbEntries.ItemIndex];
  fEditForm := TfEditForm.Create(Application, iSelectedID);
  fEditForm.ShowModal;
end;

{ Form OnShow }
procedure TfrmMain.FormShow(Sender: TObject);
begin
RefreshData;
end;

{ Refresh Data }
procedure TfrmMain.RefreshData;
var sFirstName, sLastName:string;
iID, i,intTotal : integer;
dtDOB:TDate;
begin
dmEntries.tblEntries.First;
lbEntries.Items.Clear;
dmEntries.qryCount.SQL.Clear;
dmEntries.qryCount.SQL.Add('SELECT COUNT(*) as total from tableEntries');
dmEntries.qryCount.Prepared;
dmEntries.qryCount.Active := true;
dmEntries.qryCount.Open;
while not dmEntries.qryCount.EOF do begin
      intTotal := dmEntries.qryCount.Fields[0].AsInteger;
      dmEntries.qryCount.Next;
    end;
lblTotalEntries.Caption := 'Total Entries: ' + intToStr(intTotal);
i:= 0;
with dmEntries do
  while NOT tblEntries.eof do
  begin
      iID := tblEntries['ID'];
      idArray[i]:= iID;
      sFirstName := tblEntries['FirstName'];
      sLastName := tblEntries['LastName'];
      dtDOB := tblEntries['DateOfBirth'];
      lbEntries.Items.Add(DateToStr(dtDOB) + ' - ' + sFirstName + ' ' + sLastName );
      tblEntries.Next;
      Inc(i);
  end;
end;

end.
