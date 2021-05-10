tableextension 50104 GLentryText extends "G/L Entry"
{
    fields
    {
        field(50100; "Customer Name"; Text[100])
        {
            CaptionML = DAN = 'Kundenavn', ENU = 'Customer Name';
            //DataClassification = ToBeClassified;
            FieldClass = FlowField;
            CalcFormula = lookup(Customer.Name where("No." = field("Customer Number")));
        }
        field(50101; "Customer Number"; Code[20])
        {
            CaptionML = DAN = 'Kundenummer', ENU = 'Customer Number';
            //DataClassification = ToBeClassified;
            FieldClass = FlowField;
            CalcFormula = lookup("Cust. Ledger Entry"."Customer No." where("Document Type" = field("Document Type"),
                                                                                        "Document No." = field("Document No.")));
        }
    }
}
