//---------------------------------------------------------------------------

// This software is Copyright (c) 2016 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#pragma hdrstop

#include "APIDocCppAttributesUnit.h"
#include <memory>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma classgroup "System.Classes.TPersistent"
#pragma resource "*.dfm"
//---------------------------------------------------------------------------
__fastcall TSampleAttributesCppResource1::TSampleAttributesCppResource1(TComponent* Owner)
	: TDataModule(Owner)
{
}

void TSampleAttributesCppResource1::Get(TEndpointContext* AContext, TEndpointRequest* ARequest, TEndpointResponse* AResponse)
{
	EmployeeTable->SQL->Clear();
	EmployeeTable->SQL->Add("SELECT *  FROM EMPLOYEE");
	EmployeeTable->Open();
	TMemoryStream* MemStream = new TMemoryStream;
	try
	{
		FDSchemaAdapterEmployees->SaveToStream(MemStream, TFDStorageFormat::sfJSON);
		AResponse->Body->SetStream(MemStream, "application/json", true);
	}
	catch (Exception &Err)
	{
		delete MemStream;
	}
}

void TSampleAttributesCppResource1::GetItem(TEndpointContext* AContext, TEndpointRequest* ARequest, TEndpointResponse* AResponse)
{
	String item;
	item = ARequest->Params->Values["item"];
	EmployeeTable->SQL->Clear();
	EmployeeTable->SQL->Add("SELECT *  FROM EMPLOYEE WHERE FIRST_NAME ='" + item + "'");
	EmployeeTable->Open();
	if (EmployeeTable->RecordCount <= 0) {
		TJSONObjectBuilder* LJSONObjectBuilder = new TJSONObjectBuilder((TJsonWriter *)(AResponse->Body->JSONWriter));
		try
		{
			AResponse->StatusCode = 404;
			LJSONObjectBuilder->BeginObject()->Add("errormessage", "Error")
				->Add("description", "Not Found");
		}
		__finally
		{
			delete LJSONObjectBuilder;
		}
	}else{
		TMemoryStream* MemStream = new TMemoryStream;
		try
		{
			FDSchemaAdapterEmployees->SaveToStream(MemStream, TFDStorageFormat::sfJSON);
			AResponse->Body->SetStream(MemStream, "application/json", true);
		}
		catch (Exception &Err)
		{
			delete MemStream;
		}
	}
}

void TSampleAttributesCppResource1::Post(TEndpointContext* AContext, TEndpointRequest* ARequest, TEndpointResponse* AResponse)
{
	TJsonTextReader* LReader = ARequest->Body->JSONReader;
	LReader->Read();
	TJSONObjectBuilder* LJSONObjectBuilder = new TJSONObjectBuilder((TJsonWriter *)(AResponse->Body->JSONWriter));
	try
	{
		LJSONObjectBuilder->BeginObject()->BeginArray("PostedData");
		while(LReader->Read() && LReader->TokenType == TJsonToken::PropertyName){
			String LPropertyName = LReader->Value.AsString();
			LReader->Read();
			if ((LReader->TokenType != TJsonToken::String) && (LReader->TokenType != TJsonToken::Integer)) {
				throw Exception("Unexpected Token, expected string");
			}
			if (LPropertyName == "EMP_NO") {
				LJSONObjectBuilder->ParentArray->Add(IntToStr(LReader->Value.AsInteger()));
			}else if (LPropertyName == "FIRST_NAME") {
				LJSONObjectBuilder->ParentArray->Add(LReader->Value.AsString());
			}else if (LPropertyName == "LAST_NAME") {
				LJSONObjectBuilder->ParentArray->Add(LReader->Value.AsString());
			}else if (LPropertyName == "PHONE_EXT") {
				LJSONObjectBuilder->ParentArray->Add(LReader->Value.AsString());
			}else if (LPropertyName == "HIRE_DATE") {
				LJSONObjectBuilder->ParentArray->Add(LReader->Value.AsString());
			}else if (LPropertyName == "DEPT_NO") {
				LJSONObjectBuilder->ParentArray->Add(LReader->Value.AsString());
			}else if (LPropertyName == "JOB_CODE") {
				LJSONObjectBuilder->ParentArray->Add(LReader->Value.AsString());
			}else if (LPropertyName == "JOB_GRADE") {
				LJSONObjectBuilder->ParentArray->Add(IntToStr(LReader->Value.AsInteger()));
			}else if (LPropertyName == "JOB_COUNTRY") {
				LJSONObjectBuilder->ParentArray->Add(LReader->Value.AsString());
			}else if (LPropertyName == "SALARY") {
				LJSONObjectBuilder->ParentArray->Add(IntToStr(LReader->Value.AsInteger()));
			}
		}
	}
	__finally
	{
		delete LJSONObjectBuilder;
	}
}

void TSampleAttributesCppResource1::PutItem(TEndpointContext* AContext, TEndpointRequest* ARequest, TEndpointResponse* AResponse)
{
	String item;
	item = ARequest->Params->Values["item"];
	TJsonTextReader* LReader = ARequest->Body->JSONReader;
	LReader->Read();
	TJSONObjectBuilder* LJSONObjectBuilder = new TJSONObjectBuilder((TJsonWriter *)(AResponse->Body->JSONWriter));
	try
	{
		LJSONObjectBuilder->BeginObject()->Add("PathItem", item)
			->BeginArray("PostedData");
		while(LReader->Read() && LReader->TokenType == TJsonToken::PropertyName){
			String LPropertyName = LReader->Value.AsString();
			LReader->Read();
			if ((LReader->TokenType != TJsonToken::String) && (LReader->TokenType != TJsonToken::Integer)) {
				throw Exception("Unexpected Token, expected string");
			}
			if (LPropertyName == "EMP_NO") {
				LJSONObjectBuilder->ParentArray->Add(IntToStr(LReader->Value.AsInteger()));
			}else if (LPropertyName == "FIRST_NAME") {
				LJSONObjectBuilder->ParentArray->Add(LReader->Value.AsString());
			}else if (LPropertyName == "LAST_NAME") {
				LJSONObjectBuilder->ParentArray->Add(LReader->Value.AsString());
			}else if (LPropertyName == "PHONE_EXT") {
				LJSONObjectBuilder->ParentArray->Add(LReader->Value.AsString());
			}else if (LPropertyName == "HIRE_DATE") {
				LJSONObjectBuilder->ParentArray->Add(LReader->Value.AsString());
			}else if (LPropertyName == "DEPT_NO") {
				LJSONObjectBuilder->ParentArray->Add(LReader->Value.AsString());
			}else if (LPropertyName == "JOB_CODE") {
				LJSONObjectBuilder->ParentArray->Add(LReader->Value.AsString());
			}else if (LPropertyName == "JOB_GRADE") {
				LJSONObjectBuilder->ParentArray->Add(IntToStr(LReader->Value.AsInteger()));
			}else if (LPropertyName == "JOB_COUNTRY") {
				LJSONObjectBuilder->ParentArray->Add(LReader->Value.AsString());
			}else if (LPropertyName == "SALARY") {
				LJSONObjectBuilder->ParentArray->Add(IntToStr(LReader->Value.AsInteger()));
			}
		}
	}
	__finally
	{
		delete LJSONObjectBuilder;
	}
}


System::String initYamlDefinitions()
{
	return "# "  sLineBreak
  " ItemObject:"   sLineBreak
  "    type: object"   sLineBreak
  "    properties:"   sLineBreak
  "      RowID:"   sLineBreak
  "        type: integer"   sLineBreak
  "      Original:"   sLineBreak
  "        type: object"   sLineBreak
  "        properties:"   sLineBreak
  "         EMP_NO:"   sLineBreak
  "          type: integer"   sLineBreak
  "         FIRST_NAME:"   sLineBreak
  "          type: string"   sLineBreak
  "         LAST_NAME:"   sLineBreak
  "          type: string"   sLineBreak
  "         PHONE_EXT:"   sLineBreak
  "          type: string"   sLineBreak
  "         HIRE_DATE:"   sLineBreak
  "          type: string"   sLineBreak
  "         DEPT_NO:"   sLineBreak
  "          type: string"   sLineBreak
  "         JOB_CODE:"   sLineBreak
  "          type: string"   sLineBreak
  "         JOB_GRADE:"   sLineBreak
  "          type: integer"   sLineBreak
  "         JOB_COUNTRY:"   sLineBreak
  "          type: string"   sLineBreak
  "         SALARY:"   sLineBreak
  "          type: integer"   sLineBreak
  "         FULL_NAME:"   sLineBreak
  "          type: string"   sLineBreak
  "# "   sLineBreak
  " TableObject:"   sLineBreak
  "    type: object"   sLineBreak
  "    properties:"   sLineBreak
  "      class:"   sLineBreak
  "        type: string"   sLineBreak
  "      Name:"   sLineBreak
  "        type: string"   sLineBreak
  "      SourceName:"   sLineBreak
  "        type: string"   sLineBreak
  "      SourceID:"   sLineBreak
  "        type: integer"   sLineBreak
  "      RowList:"   sLineBreak
  "        type: array"   sLineBreak
  "        items: "   sLineBreak
  "         $ref: \"#/definitions/ItemObject\""   sLineBreak
  "# "   sLineBreak
  " EmployeeTable:"   sLineBreak
  "    type: object"   sLineBreak
  "    properties:"   sLineBreak
  "      FBDS:"   sLineBreak
  "       type: object"   sLineBreak
  "       properties:"   sLineBreak
  "         Version:"   sLineBreak
  "           type: string"   sLineBreak
  "         Manager:"   sLineBreak
  "           type: object"   sLineBreak
  "           properties:"   sLineBreak
  "             TableList:"   sLineBreak
  "              type: array"   sLineBreak
  "              items:"   sLineBreak
  "               $ref: \"#/definitions/TableObject\""   sLineBreak
  "# "   sLineBreak
  " PostObject:"   sLineBreak
  "   properties:"   sLineBreak
  "    EMP_NO:"   sLineBreak
  "     type: integer"   sLineBreak
  "    FIRST_NAME:"   sLineBreak
  "     type: string"   sLineBreak
  "    LAST_NAME:"   sLineBreak
  "     type: string"   sLineBreak
  "    PHONE_EXT:"   sLineBreak
  "     type: string"   sLineBreak
  "    HIRE_DATE:"   sLineBreak
  "     type: string"   sLineBreak
  "     format: date-time"   sLineBreak
  "    DEPT_NO:"   sLineBreak
  "     type: string"   sLineBreak
  "    JOB_CODE:"   sLineBreak
  "     type: string"   sLineBreak
  "    JOB_GRADE:"   sLineBreak
  "     type: integer"   sLineBreak
  "    JOB_COUNTRY:"   sLineBreak
  "     type: string"   sLineBreak
  "    SALARY:"   sLineBreak
  "     type: integer"   sLineBreak
  "    FULL_NAME:"   sLineBreak
  "     type: string"   sLineBreak
  "# "   sLineBreak
  " PutObject:"   sLineBreak
  "   properties:"   sLineBreak
  "    EMP_NO:"   sLineBreak
  "     type: integer"   sLineBreak
  "    FIRST_NAME:"   sLineBreak
  "     type: string"   sLineBreak
  "    LAST_NAME:"   sLineBreak
  "     type: string"   sLineBreak
  "    PHONE_EXT:"   sLineBreak
  "     type: string"   sLineBreak
  "    HIRE_DATE:"   sLineBreak
  "     type: string"   sLineBreak
  "     format: date-time"   sLineBreak
  "    DEPT_NO:"   sLineBreak
  "     type: string"   sLineBreak
  "    JOB_CODE:"   sLineBreak
  "     type: string"   sLineBreak
  "    JOB_GRADE:"   sLineBreak
  "     type: integer"   sLineBreak
  "    JOB_COUNTRY:"   sLineBreak
  "     type: string"   sLineBreak
  "    SALARY:"   sLineBreak
  "     type: integer"   sLineBreak
  "    FULL_NAME:"   sLineBreak
  "     type: string"   sLineBreak
  "# "   sLineBreak
  " ItemPostedResponseObject:"   sLineBreak
  "    type: object"   sLineBreak
  "    properties:"   sLineBreak
  "      PostedData:"   sLineBreak
  "        type: array"   sLineBreak
  "        items:"   sLineBreak
  "         type: string"   sLineBreak
  "# "   sLineBreak
  " ItemPutResponseObject:"   sLineBreak
  "    type: object"   sLineBreak
  "    properties:"   sLineBreak
  "      PathItem:"   sLineBreak
  "        type: string"   sLineBreak
  "      PostedData:"   sLineBreak
  "        type: array"   sLineBreak
  "        items:"   sLineBreak
  "         type: string"   sLineBreak
  "";
}

System::String initJSONDefinitions()
{
	return  "{"   sLineBreak
  "    \"ItemObject\": {"   sLineBreak
  "        \"type\": \"object\","   sLineBreak
  "        \"properties\": {"   sLineBreak
  "            \"RowID\": {"   sLineBreak
  "                \"type\": \"integer\""   sLineBreak
  "            },"   sLineBreak
  "            \"Original\": {"   sLineBreak
  "                \"type\": \"object\","   sLineBreak
  "                \"properties\": {"   sLineBreak
  "                    \"EMP_NO\": {"   sLineBreak
  "                        \"type\": \"integer\""   sLineBreak
  "                    },"   sLineBreak
  "                    \"FIRST_NAME\": {"   sLineBreak
  "                        \"type\": \"string\""   sLineBreak
  "                    },"   sLineBreak
  "                    \"LAST_NAME\": {"   sLineBreak
  "                       \"type\": \"string\""   sLineBreak
  "                   },"   sLineBreak
  "                   \"PHONE_EXT\": {"   sLineBreak
  "                       \"type\": \"string\""   sLineBreak
  "                   },"   sLineBreak
  "                   \"HIRE_DATE\": {"   sLineBreak
  "                       \"type\": \"string\""   sLineBreak
  "                   },"   sLineBreak
  "                   \"DEPT_NO\": {"   sLineBreak
  "                       \"type\": \"string\""   sLineBreak
  "                   },"   sLineBreak
  "                   \"JOB_CODE\": {"   sLineBreak
  "                       \"type\": \"string\""   sLineBreak
  "                   },"   sLineBreak
  "                   \"JOB_GRADE\": {"   sLineBreak
  "                       \"type\": \"integer\""   sLineBreak
  "                   },"   sLineBreak
  "                   \"JOB_COUNTRY\": {"   sLineBreak
  "                       \"type\": \"string\""   sLineBreak
  "                   },"   sLineBreak
  "                   \"SALARY\": {"   sLineBreak
  "                       \"type\": \"integer\""   sLineBreak
  "                   },"   sLineBreak
  "                   \"FULL_NAME\": {"   sLineBreak
  "                      \"type\": \"string\""   sLineBreak
  "                   }"   sLineBreak
  "               }"   sLineBreak
  "          }"   sLineBreak
  "       }"   sLineBreak
  "   },"   sLineBreak
  "   \"TableObject\": {"   sLineBreak
  "       \"type\": \"object\","   sLineBreak
  "       \"properties\": {"   sLineBreak
  "           \"class\": {"   sLineBreak
  "               \"type\": \"string\""   sLineBreak
  "           },"   sLineBreak
  "           \"Name\": {"   sLineBreak
  "               \"type\": \"string\""   sLineBreak
  "           },"   sLineBreak
  "           \"SourceName\": {"   sLineBreak
  "               \"type\": \"string\""   sLineBreak
  "           },"   sLineBreak
  "           \"SourceID\": {"   sLineBreak
  "               \"type\": \"integer\""   sLineBreak
  "           },"   sLineBreak
  "           \"RowList\": {"   sLineBreak
  "               \"type\": \"array\","   sLineBreak
  "               \"items\": {"   sLineBreak
  "                   \"$ref\": \"#/definitions/ItemObject\""   sLineBreak
  "               }"   sLineBreak
  "           }"   sLineBreak
  "      }"   sLineBreak
  "   },"   sLineBreak
  "   \"EmployeeTable\": {"   sLineBreak
  "       \"type\": \"object\","   sLineBreak
  "       \"properties\": {"   sLineBreak
  "          \"FBDS\": {"   sLineBreak
  "               \"type\": \"object\","   sLineBreak
  "               \"properties\": {"   sLineBreak
  "                   \"Version\": {"   sLineBreak
  "                       \"type\": \"string\""   sLineBreak
  "                   },"   sLineBreak
  "                   \"Manager\": {"   sLineBreak
  "                       \"type\": \"object\","   sLineBreak
  "                       \"properties\": {"   sLineBreak
  "                           \"TableList\": {"   sLineBreak
  "                               \"type\": \"array\","   sLineBreak
  "                               \"items\": {"   sLineBreak
  "                                   \"$ref\": \"#/definitions/TableObject\""   sLineBreak
  "                               }"   sLineBreak
  "                           }"   sLineBreak
  "                       }"   sLineBreak
  "                   }"   sLineBreak
  "               }"   sLineBreak
  "           }"   sLineBreak
  "       }"   sLineBreak
  "   },"   sLineBreak
  "   \"PostObject\": {"   sLineBreak
  "       \"properties\": {"   sLineBreak
  "           \"EMP_NO\": {"   sLineBreak
  "               \"type\": \"integer\""   sLineBreak
  "           },"   sLineBreak
  "           \"FIRST_NAME\": {"   sLineBreak
  "               \"type\": \"string\""   sLineBreak
  "           },"   sLineBreak
  "           \"LAST_NAME\": {"   sLineBreak
  "               \"type\": \"string\""   sLineBreak
  "           },"   sLineBreak
  "           \"PHONE_EXT\": {"   sLineBreak
  "               \"type\": \"string\""   sLineBreak
  "           },"   sLineBreak
  "           \"HIRE_DATE\": {"   sLineBreak
  "               \"type\": \"string\","   sLineBreak
  "               \"format\": \"date-time\""   sLineBreak
  "           },"   sLineBreak
  "           \"DEPT_NO\": {"   sLineBreak
  "               \"type\": \"string\""   sLineBreak
  "           },"   sLineBreak
  "           \"JOB_CODE\": {"   sLineBreak
  "               \"type\": \"string\""   sLineBreak
  "           },"   sLineBreak
  "           \"JOB_GRADE\": {"   sLineBreak
  "               \"type\": \"integer\""   sLineBreak
  "           },"   sLineBreak
  "            \"JOB_COUNTRY\": {"   sLineBreak
  "                \"type\": \"string\""   sLineBreak
  "            },"   sLineBreak
  "            \"SALARY\": {"   sLineBreak
  "                \"type\": \"integer\""   sLineBreak
  "            },"   sLineBreak
  "            \"FULL_NAME\": {"   sLineBreak
  "                \"type\": \"string\""   sLineBreak
  "            }"   sLineBreak
  "        }"   sLineBreak
  "    },"   sLineBreak
  "   \"PutObject\": {"   sLineBreak
  "       \"properties\": {"   sLineBreak
  "           \"EMP_NO\": {"   sLineBreak
  "               \"type\": \"integer\""   sLineBreak
  "           },"   sLineBreak
  "           \"FIRST_NAME\": {"   sLineBreak
  "               \"type\": \"string\""   sLineBreak
  "           },"   sLineBreak
  "           \"LAST_NAME\": {"   sLineBreak
  "               \"type\": \"string\""   sLineBreak
  "           },"   sLineBreak
  "           \"PHONE_EXT\": {"   sLineBreak
  "               \"type\": \"string\""   sLineBreak
  "           },"   sLineBreak
  "           \"HIRE_DATE\": {"   sLineBreak
  "               \"type\": \"string\","   sLineBreak
  "               \"format\": \"date-time\""   sLineBreak
  "           },"   sLineBreak
  "           \"DEPT_NO\": {"   sLineBreak
  "               \"type\": \"string\""   sLineBreak
  "           },"   sLineBreak
  "           \"JOB_CODE\": {"   sLineBreak
  "               \"type\": \"string\""   sLineBreak
  "           },"   sLineBreak
  "           \"JOB_GRADE\": {"   sLineBreak
  "               \"type\": \"integer\""   sLineBreak
  "           },"   sLineBreak
  "            \"JOB_COUNTRY\": {"   sLineBreak
  "                \"type\": \"string\""   sLineBreak
  "            },"   sLineBreak
  "            \"SALARY\": {"   sLineBreak
  "                \"type\": \"integer\""   sLineBreak
  "            },"   sLineBreak
  "            \"FULL_NAME\": {"   sLineBreak
  "                \"type\": \"string\""   sLineBreak
  "            }"   sLineBreak
  "        }"   sLineBreak
  "    },"   sLineBreak
  "    \"ItemPostedResponseObject\": {"   sLineBreak
  "        \"type\": \"object\","   sLineBreak
  "        \"properties\": {"   sLineBreak
  "            \"PostedData\": {"   sLineBreak
  "                \"type\": \"array\","   sLineBreak
  "                \"items\": {"   sLineBreak
  "                    \"type\": \"string\""   sLineBreak
  "                }"   sLineBreak
  "            }"   sLineBreak
  "        }"   sLineBreak
  "    },"   sLineBreak
  "    \"ItemPutResponseObject\": {"   sLineBreak
  "        \"type\": \"object\","   sLineBreak
  "        \"properties\": {"   sLineBreak
  "            \"PathItem\": {"   sLineBreak
  "                \"type\": \"string\""   sLineBreak
  "            },"   sLineBreak
  "            \"PostedData\": {"   sLineBreak
  "                \"type\": \"array\","   sLineBreak
  "                \"items\": {"   sLineBreak
  "                    \"type\": \"string\""   sLineBreak
  "                }"   sLineBreak
  "            }"   sLineBreak
  "        }"   sLineBreak
  "    }"   sLineBreak
  "}"
  "";
}

static void Register()
{

		std::auto_ptr<TEMSResourceAttributes> attributes(new TEMSResourceAttributes());
		attributes->ResourceName = "SampleAttributesCpp";

		//YAML definitions
		attributes->YAMLDefinitions["SampleAttributesCpp"] = initYamlDefinitions();

		//JSON definitions
		attributes->JSONDefinitions["SampleAttributesCpp"] = initJSONDefinitions();

		// Get
		//Add Summary
		std::unique_ptr<EndPointRequestSummaryAttribute> RequestSummary(new EndPointRequestSummaryAttribute("Sample Tag",
			"Summary Title", "Get Method Description", "application/json", ""));
		attributes->RequestSummary["Get"] = RequestSummary.get();
		//Add Parameters
		std::unique_ptr<EndPointRequestParameterAttribute> ResponseParameter(new EndPointRequestParameterAttribute(TAPIDocParameter::TParameterIn::Query, "skip",
			"Query Parameter Description", false, TAPIDoc::TPrimitiveType::spNumber, TAPIDoc::TPrimitiveFormat::Int32, TAPIDoc::TPrimitiveType::spNull, "", ""));
		attributes->AddRequestParameter("Get", ResponseParameter.get());
		//Add Responses
		std::unique_ptr<EndPointResponseDetailsAttribute> ResponseDetail(new EndPointResponseDetailsAttribute(200, "OK",
			TAPIDoc::TPrimitiveType::spObject, TAPIDoc::TPrimitiveFormat::None, "", "#/definitions/EmployeeTable"));
		attributes->AddResponseDetail("Get", ResponseDetail.get());

		// Get Item
		//Add Summary
		attributes->ResourceSuffix["GetItem"] = "{item}";
		//Add Summary
		RequestSummary.reset(new EndPointRequestSummaryAttribute("Sample Tag", "Summary Title", "GetItem Method Description",
			"application/json", ""));
		attributes->RequestSummary["GetItem"] = RequestSummary.get();
		//Add Parameters
		ResponseParameter.reset(new EndPointRequestParameterAttribute(TAPIDocParameter::TParameterIn::Path, "item",
			"Path Parameter item Description", true, TAPIDoc::TPrimitiveType::spString, TAPIDoc::TPrimitiveFormat::None, TAPIDoc::TPrimitiveType::spString, "", ""));
		attributes->AddRequestParameter("GetItem", ResponseParameter.get());
		//Add Responses
		ResponseDetail.reset(new EndPointResponseDetailsAttribute(200, "OK", TAPIDoc::TPrimitiveType::spObject,
			TAPIDoc::TPrimitiveFormat::None, "", "#/definitions/EmployeeTable"));
		attributes->AddResponseDetail("GetItem", ResponseDetail.get());
		ResponseDetail.reset(new EndPointResponseDetailsAttribute(404, "Not Found", TAPIDoc::TPrimitiveType::spNull,
			TAPIDoc::TPrimitiveFormat::None, "", ""));
		attributes->AddResponseDetail("GetItem", ResponseDetail.get());

		// Post
		//Add Summary
		RequestSummary.reset(new EndPointRequestSummaryAttribute("Sample Tag", "Summary Title", "Post Method Description",
			"application/json", "application/json"));
		attributes->RequestSummary["Post"] = RequestSummary.get();
		//Add Parameters
		ResponseParameter.reset(new EndPointRequestParameterAttribute(TAPIDocParameter::TParameterIn::Body, "body",
			"Body Param Description", true, TAPIDoc::TPrimitiveType::spObject, TAPIDoc::TPrimitiveFormat::None, TAPIDoc::TPrimitiveType::spObject,
			"", "#/definitions/PostObject"));
		attributes->AddRequestParameter("Post", ResponseParameter.get());
		//Add Responses
		ResponseDetail.reset(new EndPointResponseDetailsAttribute(200, "OK", TAPIDoc::TPrimitiveType::spObject,
			TAPIDoc::TPrimitiveFormat::None, "", "#/definitions/ItemPostedResponseObject"));
		attributes->AddResponseDetail("Post", ResponseDetail.get());
		ResponseDetail.reset(new EndPointResponseDetailsAttribute(409, "Item Exist", TAPIDoc::TPrimitiveType::spNull,
			TAPIDoc::TPrimitiveFormat::None, "", ""));
		attributes->AddResponseDetail("Post", ResponseDetail.get());

		// Put
		//Add Summary
		attributes->ResourceSuffix["PutItem"] = "{item}";
		RequestSummary.reset(new EndPointRequestSummaryAttribute("Sample Tag", "Summary Title", "PutItem Method Description",
			"application/json", "application/json"));
		attributes->RequestSummary["PutItem"] = RequestSummary.get();
		//Add Parameters
		ResponseParameter.reset(new EndPointRequestParameterAttribute(TAPIDocParameter::TParameterIn::Path, "item",
			"Path Parameter item Description", true, TAPIDoc::TPrimitiveType::spString, TAPIDoc::TPrimitiveFormat::None, TAPIDoc::TPrimitiveType::spString, "", ""));
		attributes->AddRequestParameter("PutItem", ResponseParameter.get());
		ResponseParameter.reset(new EndPointRequestParameterAttribute(TAPIDocParameter::TParameterIn::Body, "body",
			"Body Param Description", true, TAPIDoc::TPrimitiveType::spObject, TAPIDoc::TPrimitiveFormat::None, TAPIDoc::TPrimitiveType::spObject,
			"", "#/definitions/PutObject"));
		attributes->AddRequestParameter("PutItem", ResponseParameter.get());
		//Add Responses
		ResponseDetail.reset(new EndPointResponseDetailsAttribute(200, "OK", TAPIDoc::TPrimitiveType::spObject,
			TAPIDoc::TPrimitiveFormat::None, "", "#/definitions/ItemPutResponseObject"));
		attributes->AddResponseDetail("PutItem", ResponseDetail.get());
		ResponseDetail.reset(new EndPointResponseDetailsAttribute(404, "Not Found", TAPIDoc::TPrimitiveType::spNull,
			TAPIDoc::TPrimitiveFormat::None, "", ""));
		attributes->AddResponseDetail("PutItem", ResponseDetail.get());

       	RegisterResource(__typeinfo(TSampleAttributesCppResource1), attributes.release());
}

#pragma startup Register 32




void __fastcall TSampleAttributesCppResource1::DataModuleCreate(TObject *Sender)
{
	EmployeeConnection->Connected = true;
	EmployeeTable->Active = true;
}
//---------------------------------------------------------------------------

