codeunit 50105 EventSubscriberPurchase
{

    EventSubscriberInstance = StaticAutomatic;

    [EventSubscriber(ObjectType::Page, Page::"Vendor Card", 'OnClosePageEvent', '', true, true)]
    local procedure GetVATInfo(var Rec: Record Vendor);
    var
        HttpClient: HttpClient;
        ResponseMessage: HttpResponseMessage;
        JsonToken: JsonToken;
        JsonValue: JsonValue;
        JsonObject: JsonObject;
        JsonArray: JsonArray;
        JsonText: text;
        i: Integer;
    begin
        if Rec."VAT Registration No." = '' then
            exit;
        If Rec.Address = '' then begin
            // Simple web service call
            HttpClient.DefaultRequestHeaders.Add('User-Agent', 'Dynamics 365');
            if not HttpClient.Get('https://api.lassox.com/v2/providers/CVR/company/' + Rec."VAT Registration No." + '?accessKey=NMXrzCCLqNTAB9fXnlbYe8PwmyYQT6glDDwpNSED1MM',
                                ResponseMessage)
            then
                Error('The call to the web service failed.');

            if not ResponseMessage.IsSuccessStatusCode then
                error('The web service returned an error message:\' +
                    'Status code: %1' +
                    'Description: %2',
                    ResponseMessage.HttpStatusCode,
                    ResponseMessage.ReasonPhrase);

            ResponseMessage.Content.ReadAs(JsonText);

            // Process JSON response
            if not JsonArray.ReadFrom(JsonText) then begin
                // probably single object
                JsonToken.ReadFrom(JsonText);
                InsertValues(JsonToken, Rec);
            end else begin
                // array
                for i := 0 to JsonArray.Count - 1 do begin
                    JsonArray.Get(i, JsonToken);
                    InsertValues(JsonToken, Rec);
                end;
            end;
        end;
    end;

    procedure InsertValues(JsonToken: JsonToken; Vendor: Record Vendor);
    var
        JsonObject: JsonObject;
    begin
        JsonObject := JsonToken.AsObject;

        //Message(COPYSTR(GetJsonToken(JsonObject, 'address1').AsValue.AsText, 1, 250));
        Vendor.Address := COPYSTR(GetJsonToken(JsonObject, 'address1').AsValue.AsText, 1, 250);
        Vendor."Post Code" := COPYSTR(GetJsonToken(JsonObject, 'zipCode').AsValue.AsText, 1, 250);
        Vendor.City := COPYSTR(GetJsonToken(JsonObject, 'city').AsValue.AsText, 1, 250);
        Vendor."Country/Region Code" := 'DK';
        Vendor.Modify(true);
        /* "name"."localIdentifierTypeName" := COPYSTR(GetJsonToken(JsonObject,'localIdentifierTypeName').AsValue.AsText, 1, 250);
        "name"."localIdentifier" := COPYSTR(GetJsonToken(JsonObject,'localIdentifier').AsValue.AsText, 1, 250);
        "name"."statusCode" := COPYSTR(GetJsonToken(JsonObject,'statusCode').AsValue.AsText, 1, 250);
        "name"."statusText" := COPYSTR(GetJsonToken(JsonObject,'statusText').AsValue.AsText, 1, 250);
        "name"."companyType" := COPYSTR(GetJsonToken(JsonObject,'companyType').AsValue.AsText, 1, 250);
        "name"."employees" := COPYSTR(GetJsonToken(JsonObject,'employees').AsValue.AsText, 1, 250);
        "name"."employeeCount" := GetJsonToken(JsonObject,'employeeCount').AsValue.AsInteger;
        "name"."primaryIndustry" := COPYSTR(GetJsonToken(JsonObject,'primaryIndustry').AsValue.AsText, 1, 250);
        "name"."primaryIndustryCode" := COPYSTR(GetJsonToken(JsonObject,'primaryIndustryCode').AsValue.AsText, 1, 250);
        "name"."name" := COPYSTR(GetJsonToken(JsonObject,'name').AsValue.AsText, 1, 250);
        "name"."lassoId" := COPYSTR(GetJsonToken(JsonObject,'lassoId').AsValue.AsText, 1, 250);
        "name"."entityType" := COPYSTR(GetJsonToken(JsonObject,'entityType').AsValue.AsText, 1, 250);
        "name"."address1" := COPYSTR(GetJsonToken(JsonObject,'address1').AsValue.AsText, 1, 250);
        "name"."address2" := COPYSTR(GetJsonToken(JsonObject,'address2').AsValue.AsText, 1, 250);
        "name"."zipCode" := COPYSTR(GetJsonToken(JsonObject,'zipCode').AsValue.AsText, 1, 250);
        "name"."postalCode" := COPYSTR(GetJsonToken(JsonObject,'postalCode').AsValue.AsText, 1, 250);
        "name"."city" := COPYSTR(GetJsonToken(JsonObject,'city').AsValue.AsText, 1, 250);
        "name"."country" := COPYSTR(GetJsonToken(JsonObject,'country').AsValue.AsText, 1, 250);
        "name"."telephone" := COPYSTR(GetJsonToken(JsonObject,'telephone').AsValue.AsText, 1, 250);
        "name"."email" := COPYSTR(GetJsonToken(JsonObject,'email').AsValue.AsText, 1, 250);
        "name"."houseNo" := COPYSTR(GetJsonToken(JsonObject,'houseNo').AsValue.AsText, 1, 250);
        "name"."houseLetter" := COPYSTR(GetJsonToken(JsonObject,'houseLetter').AsValue.AsText, 1, 250);
        "name"."streetName" := COPYSTR(GetJsonToken(JsonObject,'streetName').AsValue.AsText, 1, 250);
        "name"."municipality" := COPYSTR(GetJsonToken(JsonObject,'municipality').AsValue.AsText, 1, 250);

        "name".Insert; */
    end;

    procedure GetJsonToken(JsonObject: JsonObject; TokenKey: text) JsonToken: JsonToken;
    begin
        if not JsonObject.Get(TokenKey, JsonToken) then
            Error('Could not find a token with key %1', TokenKey);
    end;

    procedure SelectJsonToken(JsonObject: JsonObject; Path: text) JsonToken: JsonToken;
    begin
        if not JsonObject.SelectToken(Path, JsonToken) then
            Error('Could not find a token with path %1', Path);
    end;
}


