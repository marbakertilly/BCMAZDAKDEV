pageextension 50109 "GeneralJournalPExt" extends "General Journal"
{
    trigger OnModifyRecord(): Boolean
    var
        Vendor: Record Vendor;
        DimensionSetEntry: Record "Dimension Set Entry";
    begin
        if Rec."Dimension Set ID" <> xRec."Dimension Set ID" then begin
            DimensionSetEntry.SetRange(DimensionSetEntry."Dimension Set ID", Rec."Dimension Set ID");
            if DimensionSetEntry.FindSet() then
                if Vendor.Get(DimensionSetEntry."Dimension Value Code") then begin
                    rec."Shortcut Dimension 1 Code" := Vendor."Global Dimension 1 Code";
                    rec."Shortcut Dimension 2 Code" := Vendor."Global Dimension 2 Code";
                    Rec.Modify(true);
                end;
        end;
    end;
}
