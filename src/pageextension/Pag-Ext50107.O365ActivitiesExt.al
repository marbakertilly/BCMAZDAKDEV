pageextension 50107 "O365ActivitiesExt" extends "O365 Activities"
{
    layout
    {
        modify("Ongoing Sales Quotes")
        {
            Visible = false;
        }
        addbefore("Ongoing Sales Orders")
        {
            field("Ongoing Credit Memos"; Rec."Ongoing Credit Memos")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Kreditnotaer';
                DrillDownPageId = "Sales Credit Memos";
            }
        }
        modify("Non-Applied Payments")
        {
            Visible = false;
        }

        addbefore("Outstanding Vendor Invoices")
        {
            field("Timelog expenses"; Rec."Timelog expenses")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Timelog udlæg';
                trigger OnDrillDown()
                var
                    x: Record "Gen. Journal Line";
                begin
                    x.SetRange(x."Journal Batch Name", 'STANDARD');
                    x.Setrange(x."Journal Template Name", 'TIMELOG');
                    Page.Run(Page::"General Journal", x);
                end;
            }
        }
    }
}
