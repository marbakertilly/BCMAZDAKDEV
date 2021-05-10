pageextension 50108 GLentryPext extends "General Ledger Entries"
{
    layout
    {
        addafter("Document No.")
        {
            field("Customer Number"; Rec."Customer Number")
            {
                ApplicationArea = all;
            }
            field("Customer Name"; Rec."Customer Name")
            {
                ApplicationArea = all;
            }
        }
    }
}