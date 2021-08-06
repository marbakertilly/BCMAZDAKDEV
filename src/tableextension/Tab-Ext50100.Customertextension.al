tableextension 50100 "Customer_textension" extends Customer
{
    fields
    {
        field(50001; "Management Responsible"; Code[20])
        {
            //Caption = 'Ledelsansvarlig';
            CaptionML = ENU = 'Management Responsible', DAN = 'Kundeejer';
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";
            trigger OnValidate()
            begin
                if DimensionValue.Get('PARTNER', "Management Responsible") then begin
                    if DefaultDimension.Get(18, "No.", 'PARTNER') then begin
                        DefaultDimension."Dimension Value Code" := "Management Responsible";
                        DefaultDimension.Modify();
                    end else begin
                        DefaultDimension."Table ID" := 18;
                        DefaultDimension."No." := "No.";
                        DefaultDimension."Dimension Code" := 'PARTNER';
                        DefaultDimension."Dimension Value Code" := "Management Responsible";
                        DefaultDimension.Insert(true);
                    end;
                end else begin
                    Message('Ledelsesansvarlig SKAL være en partner.');
                    "Management Responsible" := xRec."Management Responsible";
                end;
                UpdateTimeLogOwner('999998', 'PNI', 'PNI');
            end;
        }
        field(50002; "Customer Responsible"; Code[20])
        {
            CaptionML = ENU = 'Customer Provider', DAN = 'Sekundær kundejer';
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";
        }
        field(50003; "Lead Provider"; Code[20])
        {
            //Caption = 'Kundeskaffer';
            CaptionML = ENU = 'Lead Provider', DAN = 'Kundeskaffer';
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";
        }
        field(50004; "VAT Registered"; Boolean)
        {
            //Caption = 'Momsregistreret';
            CaptionML = ENU = 'VAT Registered', DAN = 'Momsregistreret';
            DataClassification = ToBeClassified;
        }
        field(50005; "VAT Period"; Option)
        {
            //Caption = 'Momsperiode';
            CaptionML = ENU = 'VAT Period', DAN = 'Momsperiode';
            OptionMembers = " ","Month","Quarter","Half-Yearly";
            OptionCaptionML = ENU = ' ,Month,Quarter,Half-Yearly', DAN = ' ,Måned,Kvartal,Halvårlig';
            DataClassification = ToBeClassified;
        }
        field(50006; Paysum; Boolean)
        {
            CaptionML = ENU = 'Paysum', DAN = 'Lønsum';
            DataClassification = ToBeClassified;
        }
        field(50007; "Affiliated Customer"; Code[20])
        {
            CaptionML = ENU = 'Affiliated Customer', DAN = 'Firmaforbundne';
            DataClassification = ToBeClassified;
            TableRelation = Customer."No.";
        }
        field(50008; Stage; Option)
        {
            CaptionML = ENU = 'Stage', DAN = 'Stadie';
            OptionMembers = "Active","Inactive";
            OptionCaptionML = ENU = 'Active,Inactive', DAN = 'Aktiv,Inaktiv';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                if Stage = Stage::Inactive then
                    "Customer Sign Off Date" := Today
                else
                    "Customer Sign Off Date" := 0D;
            end;
        }
        field(50009; "Expected Yearly Fee"; Decimal)
        {
            //Caption = 'Forventet årligt honorar';
            CaptionML = ENU = 'Expected Yearly Fee', DAN = 'Forventet årligt honorar';
            DataClassification = ToBeClassified;
        }
        field(50010; "General Closing Date"; Text[5])
        {
            CaptionML = ENU = 'General Closing Date', DAN = 'Regnskabsafslutning';
            DataClassification = ToBeClassified;
        }
        field(50011; "Accounting Class"; Option)
        {
            CaptionML = ENU = 'Accounting Class', DAN = 'Regnskabsklasse';
            OptionMembers = " ","Class A","Class B","Class C","Class D";
            OptionCaptionML = ENU = ' ,Class A,Class B,Class C,Class D', DAN = ' ,Klasse A,Klasse B,Klasse C,Klasse D';
            DataClassification = ToBeClassified;
        }
        field(50012; "BT International"; Boolean)
        {
            CaptionML = ENU = 'BTI', DAN = 'BTI';
            DataClassification = ToBeClassified;
        }
        field(50013; "ERP System"; Text[250])
        {
            CaptionML = ENU = 'ERP System', DAN = 'ERP System';
            DataClassification = ToBeClassified;
        }
        field(50014; "Customer Sign On Date"; Date)
        {
            CaptionML = ENU = 'Customer Sign On Date', DAN = 'Dato for tilgang';
            DataClassification = ToBeClassified;
        }
        field(50015; "Customer Sign Off Date"; Date)
        {
            CaptionML = ENU = 'Customer Sign Off Date', DAN = 'Dato for afgang';
            DataClassification = ToBeClassified;
        }
        field(50016; "Company Type Code"; Code[10])
        {
            CaptionML = ENU = 'Company Type Code', DAN = 'Virksomhedstypekode';
            DataClassification = ToBeClassified;
            TableRelation = "Company Type";
        }
        field(50017; "Primary Industry Code"; Code[10])
        {
            CaptionML = ENU = 'Primary Industry Code', DAN = 'Branchekode';
            DataClassification = ToBeClassified;
        }
    }
    var
        DefaultDimension: Record "Default Dimension";
        DimensionValue: Record "Dimension Value";

    procedure UpdateTimeLogOwner(CustNumber: Code[20]; KAM1: Code[10]; KAM2: Code[10])
    var

        Client: HttpClient;
        Content: HttpContent;
        Response: HttpResponseMessage;
        Request: HttpRequestMessage;
        RequestHeaders: HttpHeaders;
        ContentText: Text;
        responseText: Text;
    begin
        Request.SetRequestUri('https://dublin.runmyjobs.cloud/baker-tilly-denmark/dev/api-soap/submit/WS_TL1');
        Request.Method('POST');
        Request.GetHeaders(RequestHeaders);
        RequestHeaders.Clear();
        ContentText := '<soapenv:Envelope xmlns:soapenv=http://schemas.xmlsoap.org/soap/envelope/ xmlns:red="Redwood-Software.customer.redwood.com"><soapenv:Header><SOAPAction>submit/WS_TL1</SOAPAction>';
        ContentText += '</soapenv:Header><soapenv:Body><red:SubmitJobParameters>';
        ContentText += '<red:CustID>' + CustNumber + '</red:CustID>';
        ContentText += '<red:Kam1>' + KAM1 + '</red:Kam1>';
        ContentText += '<red:Kam2>' + KAM2 + '</red:Kam2>';
        ContentText += '</red:SubmitJobParameters></soapenv:Body></soapenv:Envelope>';
        RequestHeaders.Add('SOAPAction', 'submit/WS_TL1');
        RequestHeaders.Add('Accept', '*/*');
        RequestHeaders.Add('Authorization', 'Basic cG5pQGJha2VydGlsbHkuZGs6U3RhbXBlMTIzXzc4OQ==');
        Content.WriteFrom(ContentText);
        Request.Content := Content;
        client.Timeout(30000);
        Client.Send(Request, Response);
        Response.Content.ReadAs(responseText);
        Message(responseText);
    end;

}