pageextension 50102 "PurchaseJournalExt" extends "Purchase Journal"
{
    layout
    {
        addafter("Account Type")
        {
            field("Payment Reference05511"; "Payment Reference")
            {
                ApplicationArea = All;
            }
            field("Payment Method Code"; "Payment Method Code")
            {
                ApplicationArea = All;
            }
        }
        addafter("Bal. Gen. Prod. Posting Group")
        {
            field("Deferral Code"; "Deferral Code")
            {
                ApplicationArea = All;
            }
        }
    }
}
