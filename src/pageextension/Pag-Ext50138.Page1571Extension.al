pageextension 50138 "Page-1571-Extension" extends "G/L Entries Preview Subform"
{
    layout
    {
        addafter(Amount)
        {
            field(Balance; Rec."Balance at Date")
            {
                ApplicationArea = Basic, Suite;
                ToolTipML = ENG = 'Nuværende balance';
                Caption = 'Saldo';
            }
            field("New Balance"; Rec."New Balance at Date")
            {
                ApplicationArea = Basic, Suite;
                ToolTipML = ENG = 'Ny balance';
                Caption = 'Ny Saldo';
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        Rec."New Balance at Date" := Rec.Amount + Rec."Balance at Date";
    end;

    trigger OnClosePage()
    begin

    end;
}
