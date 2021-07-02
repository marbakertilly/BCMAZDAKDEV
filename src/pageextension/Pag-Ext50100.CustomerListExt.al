// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 "CustomerListExt" extends "Customer List"
{
    layout
    {
        addafter("Responsibility Center")
        {
            field("Management Responsible"; Rec."Management Responsible")
            {
                ApplicationArea = all;
            }
            field("Customer Responsible"; Rec."Customer Responsible")
            {
                ApplicationArea = all;
            }
        }
    }
}