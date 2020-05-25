//---------------------------------------------------------------------------

#ifndef uMainH
#define uMainH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <System.IOUtils.hpp>
#include <FMX.Controls.hpp>
#include <FMX.Forms.hpp>
#include <FMX.Controls.Presentation.hpp>
#include <FMX.Layouts.hpp>
#include <FMX.ListBox.hpp>
#include <FMX.Media.hpp>
#include <FMX.Objects.hpp>
#include <FMX.StdCtrls.hpp>
#include <FMX.Types.hpp>
//---------------------------------------------------------------------------
class TfrmMain : public TForm
{
__published:	// IDE-managed Components
	TMediaPlayer *MediaPlayer1;
	TTimer *Timer1;
	TRectangle *Rectangle1;
	TMediaPlayerControl *MediaPlayerControl1;
	TScrollBox *ScrollBox1;
	TListBox *ListBox1;
	TListBoxGroupHeader *ListBoxGroupHeader1;
	TButton *bToTheStart;
	TPanel *Panel1;
	TButton *bPlay;
	TButton *bStop;
	TButton *bToTheEnd;
	TButton *b10SecBackward;
	TButton *b10SecForward;
	TPanel *Panel2;
	TPanel *Panel3;
	TButton *bMovingParentUp;
	TButton *bMovingParentDown;
	TButton *bChangeParentsVisible;
	TTrackBar *tbProcess;
	TTrackBar *tbVolume;
	void __fastcall b10SecBackwardClick(TObject* Sender);
	void __fastcall b10SecForwardClick(TObject* Sender);
	void __fastcall bChangeParentsVisibleClick(TObject* Sender);
	void __fastcall bMovingParentDownClick(TObject* Sender);
	void __fastcall bMovingParentUpClick(TObject* Sender);
	void __fastcall bPlayClick(TObject* Sender);
	void __fastcall bStopClick(TObject* Sender);
	void __fastcall bToTheEndClick(TObject* Sender);
	void __fastcall bToTheStartClick(TObject* Sender);
	void __fastcall FormCreate(TObject* Sender);
	void __fastcall ListBox1ItemClick(TCustomListBox * const Sender, TListBoxItem * const Item);
	void __fastcall Panel1Click(TObject* Sender);
	void __fastcall tbVolumeChange(TObject* Sender);
	void __fastcall Timer1Timer(TObject* Sender);
private:
	String FLibraryPath;
	String GetPathWithVideo();
	void FillFilesList();
public:		// User declarations
	__fastcall TfrmMain(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TfrmMain *frmMain;
//---------------------------------------------------------------------------
#endif
