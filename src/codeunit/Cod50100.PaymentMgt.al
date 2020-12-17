codeunit 50100 "Payment Mgt."
{
    procedure CreateOCRReferenceForPostedSalesInvoiceWithType71(SalesInvoiceHeader: Record "Sales Invoice Header"): Text
    var
        OCRReferenceInterface: Codeunit "CPM OCR Reference Interface";
    begin
        exit('+' + Format(Enum::"CPM OCR Reference Type"::"71") + OCRReferenceInterface.GenerateOcrReference(SalesInvoiceHeader, Enum::"CPM OCR Reference Type"::"71"));
    end;
}