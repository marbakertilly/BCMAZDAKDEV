tableextension 50101 "ResponsibilityCenterExtension" extends "Responsibility Center"
{
    fields
    {
        field(50001; "Bank Name"; Text[50])
        {
            //Caption = 'Bank Name';
            CaptionML = ENU = 'Bank Name', DAN = 'Banknavn';
            DataClassification = ToBeClassified;
        }
        field(50002; "Bank Branch No."; Text[20])
        {
            //Caption = 'Bankregistreringsnr.';
            CaptionML = ENU = 'Bank Branch No.', DAN = 'Bankregistreringsnr.';
            DataClassification = ToBeClassified;
        }
        field(50003; "Bank Account No."; Text[30])
        {
            //Caption = 'Bankkontonr.';
            CaptionML = ENU = 'Bank Account No.', DAN = 'Bankkontonr.';
            DataClassification = ToBeClassified;
        }
        field(50004; IBAN; Code[50])
        {
            //Caption = 'IBAN';
            CaptionML = ENU = 'IBAN', DAN = 'IBAN';
            DataClassification = ToBeClassified;
        }
        field(50005; "SWIFT Code"; Code[20])
        {
            //Caption = 'SWIFT-kode';
            CaptionML = ENU = 'SWIFT Code', DAN = 'SWIFT-kode';
            DataClassification = ToBeClassified;
        }
        field(50006; "Payment Card Type"; Option)
        {
            //Caption = 'Betalingskorttype';
            CaptionML = ENU = 'Payment Card Type', DAN = 'Betalingskorttype';
            OptionMembers = " ","04","15","71";
            DataClassification = ToBeClassified;
        }
        field(50007; "Payment Account No."; Code[20])
        {
            //Caption = 'Betalingskontonr.';
            CaptionML = ENU = 'Payment Account No.', DAN = 'Betalingskontonr.';
            DataClassification = ToBeClassified;
        }
        field(50008; "Customer No. Length"; Integer)
        {
            //Caption = 'Kundenr. længde';
            CaptionML = ENU = 'Customer No. Length', DAN = 'Kundenr. længde';
            DataClassification = ToBeClassified;
        }
    }
}
