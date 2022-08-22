reportextension 50101 "Report-Ext50100.ReminderExt" extends Reminder
{
    dataset
    {
        add(Integer)
        {
            // add existing field from base table to dataset
            column(Iban; CompanyInfo4.IBAN)
            { }
            column(IbanText; IbanLbl)
            { }
            column(Swift; CompanyInfo4."SWIFT Code")
            { }
            column(SwiftText; SwiftLbl)
            { }

            column(BankBranchNo; CompanyInfo4."Bank Branch No.")
            { }
            column(BankBranchNoText; BankBranchNoLbl)
            { }
        }

    }
    trigger OnPreReport()
    begin
        CompanyInfo4.Get();
    end;

    var
        CompanyInfo4: Record "Company Information";
        IbanLbl: Label 'Iban';
        SwiftLbl: Label 'Swift';
        BankBranchNoLbl: Label 'Bank Branch No.';

}
