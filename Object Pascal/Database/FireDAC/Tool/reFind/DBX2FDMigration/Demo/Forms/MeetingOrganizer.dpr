//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

program MeetingOrganizer;

{ %TogetherDiagram 'ModelSupport_MeetingOrganizer\default.txaPackage' }
{ %TogetherDiagram 'ModelSupport_MeetingOrganizer\uMainForm\default.txaPackage' }
{ %TogetherDiagram 'ModelSupport_MeetingOrganizer\uAbstractForm\default.txaPackage' }
{ %TogetherDiagram 'ModelSupport_MeetingOrganizer\uAbstractDataTabForm\default.txaPackage' }
{ %TogetherDiagram 'ModelSupport_MeetingOrganizer\MeetingOrganizer\default.txaPackage' }
{ %TogetherDiagram 'ModelSupport_MeetingOrganizer\uUserDM\default.txaPackage' }
{ %TogetherDiagram 'ModelSupport_MeetingOrganizer\uRecError\default.txaPackage' }
{ %TogetherDiagram 'ModelSupport_MeetingOrganizer\uAbstractDataModule\default.txaPackage' }
{ %TogetherDiagram 'ModelSupport_MeetingOrganizer\uAbstractControl\default.txaPackage' }
{ %TogetherDiagram 'ModelSupport_MeetingOrganizer\uAbstractDataForm\default.txaPackage' }
{ %TogetherDiagram 'ModelSupport_MeetingOrganizer\default.txvpck' }
{ %TogetherDiagram 'ModelSupport_MeetingOrganizer\uAbstractControl\default.txvpck' }
{ %TogetherDiagram 'ModelSupport_MeetingOrganizer\MeetingOrganizer\default.txvpck' }
{ %TogetherDiagram 'ModelSupport_MeetingOrganizer\uUserForm\default.txaPackage' }
{ %TogetherDiagram 'ModelSupport_MeetingOrganizer\uUserControl\default.txaPackage' }
{ %TogetherDiagram 'ModelSupport_MeetingOrganizer\uUserControl\default.txvpck' }
{ %TogetherDiagram 'ModelSupport_MeetingOrganizer\uMainForm\default.txvpck' }
{ %TogetherDiagram 'ModelSupport_MeetingOrganizer\uRoomDM\default.txaPackage' }
{ %TogetherDiagram 'ModelSupport_MeetingOrganizer\uRoomControl\default.txaPackage' }
{ %TogetherDiagram 'ModelSupport_MeetingOrganizer\uRoomForm\default.txaPackage' }
{ %TogetherDiagram 'ModelSupport_MeetingOrganizer\uRoomControl\default.txvpck' }
{ %TogetherDiagram 'ModelSupport_MeetingOrganizer\uMeetingForm\default.txaPackage' }
{ %TogetherDiagram 'ModelSupport_MeetingOrganizer\uMeetingControl\default.txaPackage' }
{ %TogetherDiagram 'ModelSupport_MeetingOrganizer\uMeetingDM\default.txaPackage' }
{ %TogetherDiagram 'ModelSupport_MeetingOrganizer\uMeetingControl\default.txvpck' }
{ %TogetherDiagram 'ModelSupport_MeetingOrganizer\uMeetingAddForm\default.txaPackage' }
{ %TogetherDiagram 'ModelSupport_MeetingOrganizer\uUserLoginForm\default.txaPackage' }
{ %TogetherDiagram 'ModelSupport_MeetingOrganizer\uAbstractDataModule\default.txvpck' }
{ %TogetherDiagram 'ModelSupport_MeetingOrganizer\uAbstractDataForm\default.txvpck' }
{ %TogetherDiagram 'ModelSupport_MeetingOrganizer\uAbstractForm\default.txvpck' }
{ %TogetherDiagram 'ModelSupport_MeetingOrganizer\uRoomDM\default.txvpck' }
{ %TogetherDiagram 'ModelSupport_MeetingOrganizer\uRoomForm\default.txvpck' }
{ %TogetherDiagram 'ModelSupport_MeetingOrganizer\uUserForm\default.txvpck' }
{ %TogetherDiagram 'ModelSupport_MeetingOrganizer\uAbstractDataTabForm\default.txvpck' }
{ %TogetherDiagram 'ModelSupport_MeetingOrganizer\uUserDM\default.txvpck' }
{ %TogetherDiagram 'ModelSupport_MeetingOrganizer\uMainDM\default.txaPackage' }
{ %TogetherDiagram 'ModelSupport_MeetingOrganizer\uMainDM\default.txvpck' }
{ %TogetherDiagram 'ModelSupport_MeetingOrganizer\uMeetingDM\default.txvpck' }
{ %TogetherDiagram 'ModelSupport_MeetingOrganizer\uRecError\default.txvpck' }
{ %TogetherDiagram 'ModelSupport_MeetingOrganizer\uUserLoginForm\default.txvpck' }
{ %TogetherDiagram 'ModelSupport_MeetingOrganizer\uMeetingForm\default.txvpck' }
{ %TogetherDiagram 'ModelSupport_MeetingOrganizer\uMeetingAddForm\default.txvpck' }
{ %TogetherDiagram 'ModelSupport_MeetingOrganizer\uMeetingParticipantForm\default.txaPackage' }
{ %TogetherDiagram 'ModelSupport_MeetingOrganizer\uMeetingParticipantForm\default.txvpck' }
{ %ToDo 'MeetingOrganizer.todo' }
{ %TogetherDiagram 'ModelSupport_MeetingOrganizer\uMsgControl\default.txaPackage' }
{ %TogetherDiagram 'ModelSupport_MeetingOrganizer\uMeetingTimeRoomForm\default.txaPackage' }
{ %TogetherDiagram 'ModelSupport_MeetingOrganizer\uMeetingTimeRoomForm\default.txvpck' }
{ %TogetherDiagram 'ModelSupport_MeetingOrganizer\uMsgControl\default.txvpck' }

uses
  Forms,
  MidasLib,
  uMainForm in 'uMainForm.pas' {MainForm} ,
  uAbstractForm in 'uAbstractForm.pas' {AbstractForm} ,
  uAbstractDataForm in 'uAbstractDataForm.pas' {AbstractDataForm} ,
  uAbstractDataTabForm in 'uAbstractDataTabForm.pas' {AbstractDataTabForm} ,
  uMainDM in 'uMainDM.pas' {MainDM: TDataModule} ,
  uAbstractDataModule
    in 'uAbstractDataModule.pas' {AbstractDataModule: TDataModule} ,
  uRecError in 'uRecError.pas' {ReconcileErrorForm} ,
  uUserDM in 'uUserDM.pas' {UserDM: TDataModule} ,
  uAbstractControl in 'uAbstractControl.pas',
  uUserForm in 'uUserForm.pas' {UserForm} ,
  uUserControl in 'uUserControl.pas',
  uRoomDM in 'uRoomDM.pas' {RoomDM: TDataModule} ,
  uRoomForm in 'uRoomForm.pas' {RoomForm} ,
  uRoomControl in 'uRoomControl.pas',
  uMeetingDM in 'uMeetingDM.pas' {MeetingDM: TDataModule} ,
  uMeetingControl in 'uMeetingControl.pas',
  uUserLoginForm in 'uUserLoginForm.pas' {UserLoginForm} ,
  uMeetingTimeRoomForm in 'uMeetingTimeRoomForm.pas' {MeetingTimeRoomForm} ,
  uMsgControl in 'uMsgControl.pas',
  uMeetingForm in 'uMeetingForm.pas' {MeetingForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Meeting Organizer';
  Application.MainFormOnTaskBar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TMainDM, MainDM);
  if TUserControl.GetInstance.DoUserLogin then
    Application.Run
  else
    Application.Terminate;

end.
