program Project1;

uses
  Vcl.Forms,
  crm_u in 'crm_u.pas' {fCRUD},
  dmEntries_u in 'dmEntries_u.pas' {dmEntries: TDataModule},
  CreateEntry_u in 'CreateEntry_u.pas' {fCreateEntry},
  edit_u in 'edit_u.pas' {fEditForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfCRUD, fCRUD);
  Application.CreateForm(TdmEntries, dmEntries);
  Application.CreateForm(TfCreateEntry, fCreateEntry);
  Application.CreateForm(TfEditForm, fEditForm);
  Application.Run;
end.
