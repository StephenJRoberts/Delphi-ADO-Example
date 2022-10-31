program Project1;

uses
  Vcl.Forms,
  crud_u in 'crud_u.pas' {frmMain},
  dmEntries_u in 'dmEntries_u.pas' {dmEntries: TDataModule},
  CreateEntry_u in 'CreateEntry_u.pas' {frmCreateEntry},
  edit_u in 'edit_u.pas' {fEditForm},
  stats_u in 'stats_u.pas' {frmStats};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TdmEntries, dmEntries);
  Application.CreateForm(TfrmCreateEntry, frmCreateEntry);
  Application.CreateForm(TfEditForm, fEditForm);
  Application.CreateForm(TfrmStats, frmStats);
  Application.Run;
end.
