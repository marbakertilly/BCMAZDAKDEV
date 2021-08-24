tableextension 50105 "VendorTExt" extends Vendor
{
    trigger OnModify()
    begin
        /*         if xRec.Address <> Rec.Address then
                    GetCVRData(Rec."VAT Registration No.");
                if xRec."VAT Registration No." <> Rec."VAT Registration No." then
                    GetCVRData(Rec."VAT Registration No."); */
    end;

    procedure GetCVRData(VATNumber: Text[20])
    var

        Client: HttpClient;
        Content: HttpContent;
        Response: HttpResponseMessage;
        Request: HttpRequestMessage;
        RequestHeaders: HttpHeaders;
        ContentText: Text;
        responseText: Text;
        ContentHeaders: HttpHeaders;
    begin
        Request.SetRequestUri('https://api.lassox.com/v2/providers/CVR/company/' + VATNumber + '?accessKey=NMXrzCCLqNTAB9fXnlbYe8PwmyYQT6glDDwpNSED1MM');
        Request.Method('GET');
        Request.GetHeaders(RequestHeaders);
        RequestHeaders.Clear();
        RequestHeaders.Add('Accept', '*/*');

        /*         Content.WriteFrom(ContentText);
                Content.GetHeaders(ContentHeaders);
                ContentHeaders.Clear();
                ContentHeaders.Add('Content-Type', 'application/json');
                Request.Content := Content; */
        Client.Send(Request, Response);
        Response.Content.ReadAs(responseText);
        Message(responseText);
    end;
}

