pageextension 50103 "ResponsibilityCenterCardExt" extends "Responsibility Center Card"
{
    layout
    {
        addafter(Communication)
        {
            group(Betalinger)
            {
                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = All;
                }
                field("Bank Branch No."; Rec."Bank Branch No.")
                {
                    ApplicationArea = All;
                }
                field("Bank Account No."; Rec."Bank Account No.")
                {
                    ApplicationArea = All;
                }
                field("SWIFT Code"; Rec."SWIFT Code")
                {
                    ApplicationArea = All;
                }
                field(IBAN; Rec.IBAN)
                {
                    ApplicationArea = All;
                }
            }
        }
        addafter(Betalinger)
        {
            group(Betalingsoplysninger)
            {
                field("Payment Card Type"; Rec."Payment Card Type")
                {
                    ApplicationArea = All;
                }
                field("Payment Account No."; Rec."Payment Account No.")
                {
                    ApplicationArea = All;
                }
                field("Customer No. Length"; Rec."Customer No. Length")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
