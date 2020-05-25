//---------------------------------------------------------------------------
// Copyright (c) 2016 Embarcadero Technologies, Inc. All rights reserved.  
//
// This software is the copyrighted property of Embarcadero Technologies, Inc. 
// ("Embarcadero") and its licensors. You may only use this software if you 
// are an authorized licensee of Delphi, C++Builder or RAD Studio 
// (the "Embarcadero Products").  This software is subject to Embarcadero's 
// standard software license and support agreement that accompanied your 
// purchase of the Embarcadero Products and is considered a Redistributable, 
// as such term is defined thereunder. Your use of this software constitutes 
// your acknowledgement of your agreement to the foregoing software license 
// and support agreement. 
//---------------------------------------------------------------------------
unit CollectionObjects;

interface

type
  TPerson = class
  private
    FAge: Integer;
    FLastName: string;
    FFirstName: string;
  public
    constructor Create(const FirstName, LastName: String; Age: Integer);
    property FirstName: string read FFirstName write FFirstName;
    property LastName: string read FLastName write FLastName;
    property Age: Integer read FAge write FAge;
  end;

implementation

{ TPerson }

constructor TPerson.Create(const FirstName, LastName: String; Age: Integer);
begin
  FFirstName := FirstName;
  FLastName := LastName;
  FAge := Age;
end;

end.
