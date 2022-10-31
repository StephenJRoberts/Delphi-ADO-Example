unit CreateEntry_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.WinXCalendars, Vcl.ComCtrls, dmEntries_u,DateUtils;

type
  TfrmCreateEntry = class(TForm)
    pnlCreateEntry: TPanel;
    lFirstName: TLabel;
    lLastName: TLabel;
    lDoB: TLabel;
    edtFirstName: TEdit;
    edtLastName: TEdit;
    dtpDOB: TDateTimePicker;
    btnSubmit: TButton;
    lError: TLabel;
    procedure btnSubmitClick(Sender: TObject);
    procedure SetError(sError:string);
    procedure SaveEntry(sFirstName, sLastName:string; dDOB:TDate; Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCreateEntry: TfrmCreateEntry;

implementation
uses crud_u;

{$R *.dfm}

{ Submit Button OnClick Event }
procedure TfrmCreateEntry.btnSubmitClick(Sender: TObject);
var
dDOB:TDate;
begin
lError.Visible:=false;
dDOB:=dtpDOB.DateTime;
dDOB := RecodeTime(dDOB, 0, 0, 0, 0);
if edtFirstName.Text <> '' then
        if edtLastName.Text <> '' then
        begin
             SaveEntry(edtFirstName.Text, edtLastName.Text, dDOB,Sender);
        end
        else
          SetError('Please enter a Last Name.')
     else
         SetError('Please enter a First Name.')
end;

{ Save Entry }
procedure TfrmCreateEntry.SaveEntry(sFirstName, sLastName: string; dDOB: TDate;Sender: TObject);
begin
with dmEntries do
  begin
  tblEntries.Insert;
  tblEntries['FirstName']:= sFirstName;
  tblEntries['LastName']:= sLastName;
  tblEntries['DateOfBirth']:= dDOB;
  tblEntries.Post;
  end;
  frmMain.RefreshData;
  frmCreateEntry.close;
end;

{ Error Prompt }
procedure TfrmCreateEntry.SetError(sError: string);
begin
  lError.Visible:=true;
  lError.Caption:=sError;
end;

end.
