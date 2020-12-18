codeunit 50100 "Payment Mgt."
{
    procedure CreateOCRReferenceForPostedSalesInvoiceWithType71(SalesInvoiceHeader: Record "Sales Invoice Header"): Text
    var
        CompanyInfo: Record "Company Information";
        OCRReferenceInterface: Codeunit "CPM OCR Reference Interface";
    begin
        CompanyInfo.Get();
        exit('+' + Format(Enum::"CPM OCR Reference Type"::"71") + '<' + OCRReferenceInterface.GenerateOcrReference(SalesInvoiceHeader, Enum::"CPM OCR Reference Type"::"71") + ' +' + CompanyInfo.BankCreditorNo + '<');
    end;
}