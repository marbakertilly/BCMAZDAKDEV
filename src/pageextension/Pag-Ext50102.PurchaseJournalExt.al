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
                    Rec.ValidateShortcutDimCode(1, Vendor."Global Dimension 1 Code");
                    rec.ValidateShortcutDimCode(2, Vendor."Global Dimension 2 Code");
                    Rec.Modify(true);
                end;
        end;
    end;
}
