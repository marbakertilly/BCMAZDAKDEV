pageextension 50102 "PurchaseJournalExt" extends "Purchase Journal"
{
    layout
    {
        addafter("Account Type")
        {
            field("Payment Reference05511"; Rec."Payment Reference")
            {
                ApplicationArea = All;
            }
            field("Payment Method Code"; Rec."Payment Method Code")
            {
                ApplicationArea = All;
            }
        }
        addafter("Bal. Gen. Prod. Posting Group")
        {
            field("Deferral Code"; Rec."Deferral Code")
            {
                ApplicationArea = All;
            }
        }
    }
}
