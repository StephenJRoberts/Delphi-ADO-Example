unit CreateEntry_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.WinXCalendars, Vcl.ComCtrls, dmEntries_u;

type
  TfCreateEntry = class(TForm)
    panCreateEntry: TPanel;
    lFirstName: TLabel;
    lLastName: TLabel;
    lDoB: TLabel;
    eFirstName: TEdit;
    eLastName: TEdit;
    dtpDOB: TDateTimePicker;
    bSubmit: TButton;
    lError: TLabel;
    procedure bSubmitClick(Sender: TObject);
    procedure SetError(sError:string);
    procedure SaveEntry(sFirstName, sLastName:string; dDOB:TDate);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCreateEntry: TfCreateEntry;

implementation

{$R *.dfm}

procedure TfCreateEntry.bSubmitClick(Sender: TObject);
var
dDOB:TDate;
begin
lError.Visible:=false;
dDOB:=dtpDOB.DateTime;
if eFirstName.Text <> '' then
        if eLastName.Text <> '' then
        begin
             SaveEntry(eFirstName.Text, eLastName.Text, dDOB);
        end
        else
          SetError('Please enter a Last Name.')
     else
         SetError('Please enter a First Name.')
end;

procedure TfCreateEntry.SaveEntry(sFirstName, sLastName: string; dDOB: TDate);
begin
with dmEntries do
  begin
  tblEntries.Insert;
  tblEntries['FirstName']:= sFirstName;
  tblEntries['LastName']:= sLastName;
  tblEntries['DateOfBirth']:= dDOB;
  tblEntries.Post;
  end;
  fCreateEntry.close;
end;

procedure TfCreateEntry.SetError(sError: string);
begin
  lError.Visible:=true;
  lError.Caption:=sError;
end;

end.
