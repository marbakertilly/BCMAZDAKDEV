tableextension 50103 ActivitesCueExt extends "Activities Cue"
{
    fields
    {
        field(50100; "Ongoing Credit Memos"; Integer)
        {
            Caption = 'Ongoing Credit Memos';
            CalcFormula = count("Sales Header" where("Document Type" = filter("Credit Memo")));
            FieldClass = FlowField;
        }
    }
}
