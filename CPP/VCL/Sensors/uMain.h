//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#ifndef uMainH
#define uMainH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <System.Sensors.Components.hpp>
#include <System.Sensors.hpp>
#include <Vcl.ExtCtrls.hpp>
//---------------------------------------------------------------------------
class TfrmMain : public TForm
{
__published:	// IDE-managed Components
	TButton *Button1;
	TGroupBox *GroupBox4;
	TButton *bSwitch;
	TPanel *Panel1;
	TGroupBox *GroupBox1;
	TLabel *lCoordinates;
	TLabel *lAddress;
	TLabel *lGeoCoordinates;
	TGroupBox *GroupBox2;
	TLabel *lAccel;
	TGroupBox *GroupBox3;
	TLabel *lCompass;
	TLabel *lInclinometr;
	TLocationSensor *lsLocation;
	TMotionSensor *msAccelerometr;
	TOrientationSensor *osCompass;
	TOrientationSensor *osInclinometer;
	TTimer *tOrientation;
	TTimer *tMotion;
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall tOrientationTimer(TObject *Sender);
	void __fastcall tMotionTimer(TObject *Sender);
	void __fastcall osInclinometerSensorChoosing(TObject *Sender, const TSensorArray Sensors,
          int &ChoseSensorIndex);
	void __fastcall osCompassSensorChoosing(TObject *Sender, const TSensorArray Sensors,
          int &ChoseSensorIndex);
	void __fastcall msAccelerometrSensorChoosing(TObject *Sender, const TSensorArray Sensors,
          int &ChoseSensorIndex);
	void __fastcall bSwitchClick(TObject *Sender);
	void __fastcall lsLocationLocationChanged(TObject *Sender, const TLocationCoord2D &OldLocation,
          const TLocationCoord2D &NewLocation);
private:	// User declarations
	TGeocoder * FGeocoder;
#ifndef _WIN64
	void __fastcall OnGeocodeEvent(const _dt_System_Sensors_1 Coords);
#else /* _WIN64 */
	void __fastcall OnGeocodeEvent(const System::TArray__1<TLocationCoord2D> Coords);
#endif
	void __fastcall OnGeocodeReverseEvent(TCivicAddress* const Address);
public:		// User declarations
	__fastcall TfrmMain(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TfrmMain *frmMain;
//---------------------------------------------------------------------------
#endif
