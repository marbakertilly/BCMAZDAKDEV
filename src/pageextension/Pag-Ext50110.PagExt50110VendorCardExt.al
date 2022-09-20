pageextension 50110 "Pag-Ext50110.VendorCardExtensi" extends "Vendor Card"
{
    layout
    {
        modify("VAT Registration No.")
        {
            trigger OnAfterValidate();
            var
                HttpClient: HttpClient;
                ResponseMessage: HttpResponseMessage;
                JsonToken: JsonToken;
                JsonValue: JsonValue;
                JsonObject: JsonObject;
                JsonArray: JsonArray;
                JsonText: text;
                i: Integer;

            Begin
                if ("VAT Registration No." = '') then
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
                End;

            end;
        }
    }
    procedure InsertValues(JsonToken: JsonToken; Vendor: Record Vendor);

    var
        JsonObject: JsonObject;
    begin
        JsonObject := JsonToken.AsObject;
        Rec.validate(Address, COPYSTR(GetJsonToken(JsonObject, 'address1').AsValue.AsText, 1, 250));
        Rec.validate("Post Code", COPYSTR(GetJsonToken(JsonObject, 'zipCode').AsValue.AsText, 1, 250));
        Rec.validate(City, COPYSTR(GetJsonToken(JsonObject, 'city').AsValue.AsText, 1, 250));
        Rec.validate("Country/Region Code", 'DK');
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