pageextension 50107 O365ActivitiesExt extends "O365 Activities"
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
    }
}
