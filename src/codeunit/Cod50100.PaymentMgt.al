codeunit 50100 "Payment Mgt."
{
    procedure CreateOCRReferenceForPostedSalesInvoiceWithType71(SalesInvoiceHeader: Record "Sales Invoice Header"): Text
    var
        CompanyInfo: Record "Company Information";
        OCRReferenceInterface: Codeunit "CPM OCR Reference Interface";
        ResponsibilityCenter: Record "Responsibility Center"; //Rettelse 5.0
        KreditorNummer: Code[8]; //Rettelse 5.0
    begin
        CompanyInfo.Get();
        if ResponsibilityCenter.Get(SalesInvoiceHeader."Responsibility Center") then //Rettelse 5.0
            KreditorNummer := ResponsibilityCenter."Payment Account No."//Rettelse 5.0
        else //Rettelse 5.0
            KreditorNummer := CompanyInfo.BankCreditorNo; //Rettelse 5.0
        exit('+' + Format(Enum::"CPM OCR Reference Type"::"71") + '<' + OCRReferenceInterface.GenerateOcrReference(SalesInvoiceHeader, Enum::"CPM OCR Reference Type"::"71") + ' +' + KreditorNummer + '<');
        // exit('+' + Format(Enum::"CPM OCR Reference Type"::"71") + '<' + OCRReferenceInterface.GenerateOcrReference(SalesInvoiceHeader, Enum::"CPM OCR Reference Type"::"71") + ' +' + CompanyInfo.BankCreditorNo + '<');
    end;
    /* 
        procedure GetBankInformationResponsibilityCenter(SalesInvoiceHeader2: Record "Sales Invoice Header"; BankBranchNo: Text[20]; BankAccountNo: Text[30]; IBAN: Code[50]; SWIFT: Code[20]): Text
        var
            CompanyInfo2: Record "Company Information";
            ResponsibilityCenter2: Record "Responsibility Center";
        begin
            CompanyInfo2.get();
            if ResponsibilityCenter2.Get(SalesInvoiceHeader2."Responsibility Center") then begin
                BankBranchNo := ResponsibilityCenter2."Bank Branch No.";
                BankAccountNo := ResponsibilityCenter2."Bank Account No.";
                IBAN := ResponsibilityCenter2.IBAN;
                SWIFT := ResponsibilityCenter2."SWIFT Code";
            end else begin
                BankBranchNo := CompanyInfo2."Bank Branch No.";
                BankAccountNo := CompanyInfo2."Bank Account No.";
                IBAN := CompanyInfo2.IBAN;
                SWIFT := CompanyInfo2."SWIFT Code";
            end
        end; */
}