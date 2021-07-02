pageextension 50101 "CustomerCardExtension" extends "Customer Card"
{
    layout
    {
        /*         addlast(General)
                {
                    field(Ledelsansvarlig; Ledelsansvarlig)
                    {
                        ApplicationArea = All;
                    }
                } */
        addafter(Statistics)
        {
            group("Baker Tilly")
            {
                field("Management Responsible"; Rec."Management Responsible")
                {
                    ApplicationArea = All;
                }
                field("Customer Responsible"; Rec."Customer Responsible")
                {
                    ApplicationArea = All;
                }
                field("Lead Provider"; Rec."Lead Provider")
                {
                    ApplicationArea = All;
                }
                field("VAT Registered"; Rec."VAT Registered")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        if Rec."VAT Registered" then
                            isEditable := true
                        else
                            isEditable := false;
                    end;
                }
                field("VAT Period"; Rec."VAT Period")
                {
                    ApplicationArea = All;
                    Editable = isEditable;
                }
                field(Paysum; Rec.Paysum)
                {
                    ApplicationArea = All;
                }
                field("Affiliated Customer"; Rec."Affiliated Customer")
                {
                    ApplicationArea = All;
                }
                field(Stage; Rec.Stage)
                {
                    ApplicationArea = All;
                }
                field("Expected Yearly Fee"; Rec."Expected Yearly Fee")
                {
                    ApplicationArea = All;
                }
                field("General Closing Date"; Rec."General Closing Date")
                {
                    ApplicationArea = All;
                }
                field("Accounting Class"; Rec."Accounting Class")
                {
                    ApplicationArea = All;
                }
                field("BT International"; Rec."BT International")
                {
                    ApplicationArea = All;
                }
                field("ERP System"; Rec."ERP System")
                {
                    ApplicationArea = All;
                }
                field("Customer Sign On Date"; Rec."Customer Sign On Date")
                {
                    ApplicationArea = All;
                }
                field("Customer Sign Off Date"; Rec."Customer Sign Off Date")
                {
                    ApplicationArea = All;
                }
                field("Company Type Code"; Rec."Company Type Code")
                {
                    ApplicationArea = All;
                }
                field("Primary Industry Code"; Rec."Primary Industry Code")
                {
                    ApplicationArea = All;
                }


            }
        }
    }
    var
        isEditable: Boolean;
}
