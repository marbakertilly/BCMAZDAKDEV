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
                field("Management Responsible"; "Management Responsible")
                {
                    ApplicationArea = All;
                }
                field("Customer Responsible"; "Customer Responsible")
                {
                    ApplicationArea = All;
                }
                field("Lead Provider"; "Lead Provider")
                {
                    ApplicationArea = All;
                }
                field("VAT Registered"; "VAT Registered")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        if "VAT Registered" then
                            isEditable := true
                        else
                            isEditable := false;
                    end;
                }
                field("VAT Period"; "VAT Period")
                {
                    ApplicationArea = All;
                    Editable = isEditable;
                }
                field(Paysum; Paysum)
                {
                    ApplicationArea = All;
                }
                field("Affiliated Customer"; "Affiliated Customer")
                {
                    ApplicationArea = All;
                }
                field(Stage; Stage)
                {
                    ApplicationArea = All;
                }
                field("Expected Yearly Fee"; "Expected Yearly Fee")
                {
                    ApplicationArea = All;
                }
                field("General Closing Date"; "General Closing Date")
                {
                    ApplicationArea = All;
                }
                field("Accounting Class"; "Accounting Class")
                {
                    ApplicationArea = All;
                }
                field("BT International"; "BT International")
                {
                    ApplicationArea = All;
                }
                field("ERP System"; "ERP System")
                {
                    ApplicationArea = All;
                }
                field("Customer Sign On Date"; "Customer Sign On Date")
                {
                    ApplicationArea = All;
                }
                field("Customer Sign Off Date"; "Customer Sign Off Date")
                {
                    ApplicationArea = All;
                }
                field("Company Type Code"; "Company Type Code")
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
