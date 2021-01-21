pageextension 50105 PaymentJournalExt extends "Payment Journal"
{
    layout
    {
        addafter("Account No.")
        {
            field("Account Name 2"; "Account Name 2")
            {
                ApplicationArea = All;
            }
        }
    }
}
