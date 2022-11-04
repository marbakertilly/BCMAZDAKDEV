tableextension 50138 "Tab-Ex50138.GLEntryPostPreview" extends "G/L Entry Posting Preview"
{
    fields
    {
        field(50100; "Balance at Date"; Decimal)
        {
            AutoFormatType = 1;
            FieldClass = FlowField;
            CalcFormula = Sum("G/L Entry".Amount
            WHERE("G/L Account No." = FIELD("G/L Account No.")));
            Caption = 'Balance at Date';
            Editable = false;
        }


        field(50101; "New Balance at Date"; Decimal)
        {
            Caption = 'New Balance at Date';

            DataClassification = ToBeClassified;
        }


    }


}


