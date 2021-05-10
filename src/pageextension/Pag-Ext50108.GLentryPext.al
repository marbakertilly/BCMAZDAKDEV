pageextension 50108 GLentryPext extends "General Ledger Entries"
{
    layout
    {
        addafter("Document No.")
        {
            field("Customer Number"; "Customer Number")
            {
                ApplicationArea = all;
            }
            field("Customer Name"; "Customer Name")
            {
                ApplicationArea = all;
            }
        }
    }
}