tableextension 50100 "Customer_textension" extends Customer
{
    fields
    {
        field(50001; "Management Responsible"; Code[20])
        {
            //Caption = 'Ledelsansvarlig';
            CaptionML = ENU = 'Management Responsible', DAN = 'Ledelsansvarlig';
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";
            /* trigger OnValidate()
            begin
                "Global Dimension 1 Code" := '';
                "Global Dimension 2 Code" := '';
            end; */
        }
        field(50002; "Customer Responsible"; Code[20])
        {
            CaptionML = ENU = 'Customer Provider', DAN = 'Kundeansvarlig';
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
    }
    var
        DefaultDimension: Record "Default Dimension";
}
