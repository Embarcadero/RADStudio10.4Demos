//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit RegConst;

interface

resourcestring
  SAbout = 'Embarcadero Turbo Register Server -- COM Server Registration utility.' +
    #13#10'Version 1.2  Copyright (c) 1997-2010 Embarcadero Technologies, Inc.'#13#10;

// You may only use this software if you are an authorized licensee
// of Delphi, C++Builder or RAD Studio (Embarcadero Products).
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.
  SUsage = 'Syntax: TREGSVR [options] filename'#13#10 +
    '  -u  =  Unregister server or type library'#13#10 +
    '  -q  =  Quiet (silent) operation'#13#10 +
    '  -c  =  Register (unregister) for current user'#13#10 +
    '  -t  =  Register type library (default for .TLB files)'#13#10 +
    '  -s  =  "Side By Side" type library registration (do not use full path)'#13#10;
  sFileWithNoExt= 'Unabled to process file without extension: "%s"';
  SFileNotFound = 'File "%s" not found';
  sErrorMessage = 'Error: %s';
  sUnknownOption= 'Unknown command line option "%s"';
  sSearchingFor = 'Searching for typelibrary entries matching "%s" in %s';
  sEntriesFound = 'Found %d entries matching "%s" out of %d';
  sInvalidFound = 'Found %d invalid typelibrary entries matching "%s" out of %d';

{$IF FALSE}
  SCantFindProc = '%s procedure not found in "%s"';
  SRegFail = 'Call to %s failed in "%s"';
  SLoadFail = 'Failed to load "%s"';
  SRegSuccessful = 'Call to %s was successful!';
  SRegStr = 'registered';
  SUnregStr = 'unregistered';
  STlbName = 'Type library name: %s';
  STlbGuid = 'Type library GUID: %s';
  STlbRegSuccessful = 'Type library successfully %s!';
  SCantUnregTlb = 'The version of OLEAUT32.DLL on this machine does not ' +
    'support type library unregistration.';
  SExeRegSuccessful = '%s successfully called.';
  SExeRegUnsuccessful = '%s failed.';
{$IFEND}

implementation

end.
