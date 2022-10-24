unit crud_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, dmEntries_u,
  Data.DB, Vcl.Grids, Vcl.DBGrids, CreateEntry_u, edit_u, Vcl.ComCtrls;

type
idList = array [0..100] of integer;
  TfCRUD = class(TForm)
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
  fCRUD: TfCRUD;

implementation

{$R *.dfm}

procedure TfCRUD.bCreateEntryClick(Sender: TObject);
begin
  fCreateEntry.ShowModal;
end;

procedure TfCRUD.bDeleteEntryClick(Sender: TObject);
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

procedure TfCRUD.bRefreshClick(Sender: TObject);
var sFirstName, sLastName:string;
iID, i : integer;
dtDOB:TDate;
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
      dtDOB := tblEntries['DateOfBirth'];
      lbEntries.Items.Add(DateToStr(dtDOB) + ' - ' + sFirstName + ' ' + sLastName );
      tblEntries.Next;
      Inc(i);
  end;
end;

procedure TfCRUD.bUpdateEntryClick(Sender: TObject);
var
  iSelectedID:integer;
begin
  iSelectedID := idArray[lbEntries.ItemIndex];
  fEditForm := TfEditForm.Create(Application, iSelectedID);
  fEditForm.ShowModal;
end;

procedure TfCRUD.FormShow(Sender: TObject);
var sFirstName, sLastName:string;
iID, i : integer;
dtDOB:TDate;
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
      dtDOB := tblEntries['DateOfBirth'];
      lbEntries.Items.Add(DateToStr(dtDOB) + ' - ' + sFirstName + ' ' + sLastName);
      tblEntries.Next;
      Inc(i);
  end;
end;

end.
