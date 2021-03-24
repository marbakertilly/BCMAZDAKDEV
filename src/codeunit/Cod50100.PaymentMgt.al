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
}