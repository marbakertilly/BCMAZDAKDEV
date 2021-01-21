tableextension 50102 "Gen.JournalLineExt" extends "Gen. Journal Line"
{
    fields
    {
        field(50001; "Account Name 2"; Text[100])
        {
            CaptionML = ENU = 'Account Name', DAN = 'Kontonavn';
            FieldClass = FlowField;
            CalcFormula = lookup(Vendor.Name where("No." = FIELD("Account No.")));
        }
    }
}
