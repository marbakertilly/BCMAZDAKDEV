pageextension 50103 "ResponsibilityCenterCardExt" extends "Responsibility Center Card"
{
    layout
    {
        addafter(Communication)
        {
            group(Betalinger)
            {
                field("Bank Name"; "Bank Name")
                {
                    ApplicationArea = All;
                }
                field("Bank Branch No."; "Bank Branch No.")
                {
                    ApplicationArea = All;
                }
                field("Bank Account No."; "Bank Account No.")
                {
                    ApplicationArea = All;
                }
                field("SWIFT Code"; "SWIFT Code")
                {
                    ApplicationArea = All;
                }
                field(IBAN; IBAN)
                {
                    ApplicationArea = All;
                }
            }
        }
        addafter(Betalinger)
        {
            group(Betalingsoplysninger)
            {
                field("Payment Card Type"; "Payment Card Type")
                {
                    ApplicationArea = All;
                }
                field("Payment Account No."; "Payment Account No.")
                {
                    ApplicationArea = All;
                }
                field("Customer No. Length"; "Customer No. Length")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
