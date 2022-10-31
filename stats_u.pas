unit stats_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,DateUtils,
  Vcl.ComCtrls, Data.Win.ADODB, Data.DB;

type
  TfrmStats = class(TForm)
    pnlStats: TPanel;
    lblTotalTable1: TLabel;
    lblTotalTable2: TLabel;
    lblOldest1: TLabel;
    lblOldest2: TLabel;
    cboSelect: TComboBox;
    mmoPersonBox: TMemo;
    procedure FormShow(Sender: TObject);
    procedure cboSelectChange(Sender: TObject);
  private
    { Private declarations }
    idArray:array [0..100] of integer;
  public
    { Public declarations }
  end;

var
  frmStats: TfrmStats;

implementation

{$R *.dfm}

uses dmEntries_u;

{ OnShow Event to load statistical data from SQL query }
procedure TfrmStats.cboSelectChange(Sender: TObject);
var
intItemIndex, intID:integer;
strFirstName,strLastName:string;
dtDOB:TDateTime;
begin
mmoPersonBox.Lines.Clear;
intItemIndex := cboSelect.ItemIndex;
intID := idArray[intItemIndex];
dmEntries.qryOldest.SQL.Clear;
dmEntries.qryOldest.SQL.Add('SELECT * from tableEntries where ID = :IDValue');
dmEntries.qryOldest.Parameters.ParamByName('IDValue').Value := intID;
dmEntries.qryOldest.Prepared;
dmEntries.qryOldest.Active := true;
dmEntries.qryOldest.First;
dmEntries.qryOldest.Open;
while not dmEntries.qryOldest.EOF do begin
      strFirstName := dmEntries.qryOldest.Fields[1].AsString;//fn
      strLastName := dmEntries.qryOldest.Fields[2].AsString;//ln
      dtDOB := dmEntries.qryOldest.Fields[3].AsDateTime;//dob
      dmEntries.qryOldest.Next;
    end;
mmoPersonBox.Lines.Add('ID: ' + IntToStr(intID));
mmoPersonBox.Lines.Add('First Name: ' + strFirstName);
mmoPersonBox.Lines.Add('Last Name: ' + strLastName);
end;

procedure TfrmStats.FormShow(Sender: TObject);
var
intTotal,intAge,i:integer;
strFirstName,strLastName:string;
dtDOB:TDateTime;
begin
intTotal:=0;

{ Table 1 Total }
dmEntries.qryCount.SQL.Clear;
dmEntries.qryCount.SQL.Add('SELECT COUNT(*) as total from tableEntries');
dmEntries.qryCount.Prepared;
dmEntries.qryCount.Active := true;
dmEntries.qryCount.Open;
while not dmEntries.qryCount.EOF do begin
      intTotal := dmEntries.qryCount.Fields[0].AsInteger;
      dmEntries.qryCount.Next;
    end;
lblTotalTable1.Caption := 'Total Entries for Table 1: ' + intToStr(intTotal);
dmEntries.qryCount.Close;

{ Table 2 Total }
dmEntries.qryCount.SQL.Clear;
dmEntries.qryCount.SQL.Add('SELECT COUNT(*) as total from tableEntries1');
dmEntries.qryCount.Prepared;
dmEntries.qryCount.Active := true;
dmEntries.qryCount.Open;
while not dmEntries.qryCount.EOF do begin
      intTotal := dmEntries.qryCount.Fields[0].AsInteger;
      dmEntries.qryCount.Next;
    end;
lblTotalTable2.Caption := 'Total Entries for Table 2: ' + intToStr(intTotal);
dmEntries.qryCount.Close;


{ Oldest Person in Table 1 }
dmEntries.qryOldest.SQL.Clear;
dmEntries.qryOldest.SQL.Add('SELECT * from tableEntries ORDER BY DateOfBirth DESC');
dmEntries.qryOldest.Prepared;
dmEntries.qryOldest.Active := true;
dmEntries.qryOldest.Open;
while not dmEntries.qryOldest.EOF do begin
      strFirstName := dmEntries.qryOldest.Fields[1].AsString;//fn
      strLastName := dmEntries.qryOldest.Fields[2].AsString;//ln
      dtDOB := dmEntries.qryOldest.Fields[3].AsDateTime;//dob
      dmEntries.qryOldest.Next;
    end;
intAge := YearsBetween(Now, dtDOB);

lblOldest1.Caption := 'Oldest Person in Table 1:  ' + DateToStr(dtDOB) + ' : ' + strFirstName + ' ' + strLastName + ' (Age: ' + IntToStr(intAge) + ')';
dmEntries.qryOldest.Close;


{ Oldest Person in Table 2 }
dmEntries.qryOldest.SQL.Clear;
dmEntries.qryOldest.SQL.Add('SELECT * from tableEntries1 ORDER BY DateOfBirth DESC');
dmEntries.qryOldest.Prepared;
dmEntries.qryOldest.Active := true;
dmEntries.qryOldest.Open;
while not dmEntries.qryOldest.EOF do begin
      strFirstName := dmEntries.qryOldest.Fields[1].AsString;//fn
      strLastName := dmEntries.qryOldest.Fields[2].AsString;//ln
      dtDOB := dmEntries.qryOldest.Fields[3].AsDateTime;//dob
      dmEntries.qryOldest.Next;
    end;
intAge := YearsBetween(Date, dtDOB);

lblOldest2.Caption := 'Oldest Person in Table 2:  ' + DateToStr(dtDOB) + ' : ' + strFirstName + ' ' + strLastName + ' (Age: ' + IntToStr(intAge) + ')';
dmEntries.qryOldest.Close;

{ Get Combo Box Entries }
dmEntries.qryOldest.SQL.Clear;
dmEntries.qryOldest.SQL.Add('SELECT * from tableEntries');
dmEntries.qryOldest.Prepared;
dmEntries.qryOldest.Active := true;
dmEntries.qryOldest.Open;
i:=0;
while not dmEntries.qryOldest.EOF do begin
      strFirstName := dmEntries.qryOldest.Fields[1].AsString;//fn
      strLastName := dmEntries.qryOldest.Fields[2].AsString;//ln
      dtDOB := dmEntries.qryOldest.Fields[3].AsDateTime;//dob
      idArray[i]:=dmEntries.qryOldest.Fields[0].AsInteger;
      Inc(i);
      cboSelect.Items.Add(strFirstName);
      dmEntries.qryOldest.Next;
    end;
end;

end.
