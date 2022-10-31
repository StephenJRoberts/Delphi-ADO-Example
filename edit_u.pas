unit edit_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, dmEntries_u,DateUtils;

type
  TfEditForm = class(TForm)
    panCreateEntry: TPanel;
    lFirstName: TLabel;
    lLastName: TLabel;
    lDoB: TLabel;
    lError: TLabel;
    eFirstName: TEdit;
    eLastName: TEdit;
    dtpDOB: TDateTimePicker;
    bUpdate: TButton;
    procedure bUpdateClick(Sender: TObject);
    procedure SetError(sError:string);
    procedure SaveEntry(sFirstName, sLastName:string; dDOB:TDate);
  private
    { Private declarations }
    iIDNum:integer;
    sfirstname,slastname:string;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent;
          const iID: integer);
  end;

var
  fEditForm: TfEditForm;

implementation
uses crud_u;
{$R *.dfm}

{ TfEditForm }

{ Update Button OnClick Event }
procedure TfEditForm.bUpdateClick(Sender: TObject);
var
dDOB:TDate;
begin
    lError.Visible:=false;
    dDOB:=dtpDOB.DateTime;
    dDOB := RecodeTime(dDOB, 0, 0, 0, 0);
    if eFirstName.Text <> '' then
        if eLastName.Text <> '' then
          begin
               SaveEntry(eFirstName.Text, eLastName.Text, dDOB);
          end
        else SetError('Please enter a Last Name.')
     else SetError('Please enter a First Name.')
end;

{ constructor to load data for the edit page }
constructor TfEditForm.Create(AOwner: TComponent; const iID: integer);
var
dDOB:TDate;
begin
  inherited Create(AOwner);
  iIDNum := iID;
  dmEntries.tblEntries.First;
  with dmEntries do
    begin
      while NOT tblEntries.eof do
      begin
        if tblEntries['ID'] = iID then
          begin
            sFirstName := tblEntries['FirstName'];
            sLastName := tblEntries['LastName'];
            dDOB := tblEntries['DateOfBirth'];
            eFirstName.Text := sFirstName;
            eLastName.Text := sLastName;
            dtpDOB.DateTime := dDOB;
          end;
        tblEntries.Next;
      end;
    end;
end;

{ Save/Update existing entry }
procedure TfEditForm.SaveEntry(sFirstName, sLastName: string; dDOB: TDate);
begin
with dmEntries do
  begin
  if tblEntries.Locate('ID', iIDNUm, []) then
    begin
        tblEntries.Edit;
      tblEntries['FirstName']:= sFirstName;
      tblEntries['LastName']:= sLastName;
      tblEntries['DateOfBirth']:= dDOB;
      tblEntries.Post;
    end;
  end;
  frmMain.RefreshData;
  fEditForm.close;
end;

{ Error Prompt }
procedure TfEditForm.SetError(sError: string);
begin
  lError.Visible:=true;
  lError.Caption:=sError;
end;

end.
