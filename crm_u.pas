unit crm_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, dmEntries_u,
  Data.DB, Vcl.Grids, Vcl.DBGrids, CreateEntry_u, edit_u;

type
idList = array [0..100] of integer;
  TfCRM = class(TForm)
    panData: TPanel;
    lEntries: TLabel;
    lbEntries: TListBox;
    panButtons: TPanel;
    bCreateEntry: TButton;
    bUpdateEntry: TButton;
    bDeleteEntry: TButton;
    bRefresh: TButton;
    procedure bCreateEntryClick(Sender: TObject);
    procedure bUpdateEntryClick(Sender: TObject);
    procedure bDeleteEntryClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bRefreshClick(Sender: TObject);
  private
    { Private declarations }
    idArray:idList;
  public
    { Public declarations }
  end;

var
  fCRM: TfCRM;

implementation

{$R *.dfm}

procedure TfCRM.bCreateEntryClick(Sender: TObject);
begin
  fCreateEntry.ShowModal;
end;

procedure TfCRM.bDeleteEntryClick(Sender: TObject);
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

procedure TfCRM.bRefreshClick(Sender: TObject);
var sFirstName, sLastName:string;
iID, i : integer;
begin
dmEntries.tblEntries.First;
lbEntries.Items.Clear;
i:= 0;
with dmEntries do
  while NOT tblEntries.eof do
  begin
      iID := tblEntries['ID'];
      idArray[i]:= iID;
      sFirstName := tblEntries['FirstName'];
      sLastName := tblEntries['LastName'];
      lbEntries.Items.Add( sFirstName + ' ' + sLastName );
      tblEntries.Next;
      Inc(i);
  end;
end;

procedure TfCRM.bUpdateEntryClick(Sender: TObject);
var
  iSelectedID:integer;
begin
  iSelectedID := idArray[lbEntries.ItemIndex];
  fEditForm := TfEditForm.Create(Application, iSelectedID);
  fEditForm.ShowModal;
end;

procedure TfCRM.FormShow(Sender: TObject);
var sFirstName, sLastName:string;
iID, i : integer;
begin
dmEntries.tblEntries.First;
i:= 0;
with dmEntries do
  while NOT tblEntries.eof do
  begin
      iID := tblEntries['ID'];
      idArray[i]:= iID;
      sFirstName := tblEntries['FirstName'];
      sLastName := tblEntries['LastName'];
      lbEntries.Items.Add( sFirstName + ' ' + sLastName );
      tblEntries.Next;
      Inc(i);
  end;
end;

end.
