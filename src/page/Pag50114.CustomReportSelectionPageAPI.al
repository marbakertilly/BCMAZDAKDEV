page 50114 "CustomReportSelectionPageAPI"
{
    Caption = 'Document Layouts API';
    DataCaptionFields = "Source No.";
    DelayedInsert = true;
    PageType = List;
    SourceTable = "Custom Report Selection";
    // Page til kundeoprettelse - Kun API der skal bruges

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                FreezeColumn = "Custom Report Description";
                field(Usage2; Usage2)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Usage';
                    OptionCaption = 'Quote,Confirmation Order,Invoice,Credit Memo,Customer Statement,Job Quote,Reminder,Shipment';
                    ToolTip = 'Specifies which type of document the report is used for.';

                    trigger OnValidate()
                    begin
                        case Usage2 of
                            Usage2::Quote:
                                Rec.Usage := Rec.Usage::"S.Quote";
                            Usage2::"Confirmation Order":
                                Rec.Usage := Rec.Usage::"S.Order";
                            Usage2::Invoice:
                                Rec.Usage := Rec.Usage::"S.Invoice";
                            Usage2::"Credit Memo":
                                Rec.Usage := Rec.Usage::"S.Cr.Memo";
                            Usage2::"Customer Statement":
                                Rec.Usage := Rec.Usage::"C.Statement";
                            Usage2::"Job Quote":
                                Rec.Usage := Rec.Usage::JQ;
                            Usage2::Reminder:
                                Rec.Usage := Rec.Usage::Reminder;
                            Usage2::Shipment:
                                Rec.Usage := Rec.Usage::"S.Shipment";
                        end;
                    end;
                }
                field(ReportID; Rec."Report ID")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Report ID';
                    ToolTip = 'Specifies the ID of the report.';
                }
                field(ReportCaption; Rec."Report Caption")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Report Caption';
                    ToolTip = 'Specifies the name of the report.';
                }
                field("Custom Report Description"; Rec."Custom Report Description")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Custom Layout Description';
                    DrillDown = true;
                    Lookup = true;
                    ToolTip = 'Specifies a description of the custom report layout.';

                    trigger OnDrillDown()
                    begin
                        Rec.LookupCustomReportDescription;
                        CurrPage.Update(true);
                    end;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Rec.LookupCustomReportDescription;
                        CurrPage.Update(true);
                    end;

                    trigger OnValidate()
                    var
                        CustomReportLayout: Record "Custom Report Layout";
                    begin
                        if Rec."Custom Report Description" = '' then begin
                            Rec.Validate("Custom Report Layout Code", '');
                            Rec.Modify(true);
                        end else begin
                            CustomReportLayout.SetRange("Report ID", Rec."Report ID");
                            CustomReportLayout.SetFilter(Description, StrSubstNo('@*%1*', Rec."Custom Report Description"));
                            if not CustomReportLayout.FindFirst then
                                Error(CouldNotFindCustomReportLayoutErr, Rec."Custom Report Description");

                            Rec.Validate("Custom Report Layout Code", CustomReportLayout.Code);
                            Rec.Modify(true);
                        end;
                    end;
                }
                field("Custom Report Layout Code"; Rec."Custom Report Layout Code")
                {
                    ApplicationArea = Basic, Suite;
                }
                field(SendToEmail; Rec."Send To Email")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Send To Email';
                    ToolTip = 'Specifies that the report is used when sending emails.';

                    trigger OnAssistEdit()
                    begin
                        Rec.ShowSelectedContacts();
                    end;
                }
                field("Use for Email Body"; Rec."Use for Email Body")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies that summarized information, such as invoice number, due date, and payment service link, will be inserted in the body of the email that you send.';
                }
                field("Email Body Layout Code"; Rec."Email Body Layout Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the ID of the email body layout that is used.';
                    Visible = false;
                }
                field("Email Body Layout Description"; Rec."Email Body Layout Description")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDown = true;
                    Lookup = true;
                    ToolTip = 'Specifies a description of the email body layout that is used.';

                    trigger OnDrillDown()
                    begin
                        Rec.LookupEmailBodyDescription;
                        CurrPage.Update(true);
                    end;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Rec.LookupEmailBodyDescription;
                        CurrPage.Update(true);
                    end;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(CopyFromReportSelectionsAction)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Copy from Report Selection';
                Image = Copy;
                Promoted = true;
                PromotedOnly = true;
                PromotedCategory = Process;
                ToolTip = 'Copy reports that are set up on the Report Selection page.';

                trigger OnAction()
                var
                    ReportSelections: Record "Report Selections";
                    CustomReportSelection: Record "Custom Report Selection";
                begin
                    CustomReportSelection := Rec;
                    FilterCustomerUsageReportSelections(ReportSelections);
                    Rec.CopyFromReportSelections(ReportSelections, Database::Customer, Rec.GetFilter("Source No."));
                    CurrPage.SetRecord(CustomReportSelection);
                end;
            }

            action(SelectFromContactsAction)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Select Email from Contacts';
                Image = ContactFilter;
                Promoted = true;
                PromotedOnly = true;
                PromotedCategory = Process;
                ToolTip = 'Select an email address from the list of contacts.';

                trigger OnAction()
                var
                    ContBusRel: Record "Contact Business Relation";
                begin
                    Rec.GetSendToEmailFromContactsSelection(ContBusRel."Link to Table"::Customer.AsInteger(), Rec.GetFilter("Source No."));
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        MapTableUsageValueToPageValue;
        Rec.GetSendToEmail(false);
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.InitUsage;
        MapTableUsageValueToPageValue;
    end;

    var
        Usage2: Option Quote,"Confirmation Order",Invoice,"Credit Memo","Customer Statement","Job Quote",Reminder,Shipment;
        CouldNotFindCustomReportLayoutErr: Label 'There is no custom report layout with %1 in the description.', Comment = '%1 Description of custom report layout';

    local procedure MapTableUsageValueToPageValue()
    var
        CustomReportSelection: Record "Custom Report Selection";
    begin
        case Rec.Usage of
            CustomReportSelection.Usage::"S.Quote":
                Usage2 := Usage2::Quote;
            CustomReportSelection.Usage::"S.Order":
                Usage2 := Usage2::"Confirmation Order";
            CustomReportSelection.Usage::"S.Invoice":
                Usage2 := Usage2::Invoice;
            CustomReportSelection.Usage::"S.Cr.Memo":
                Usage2 := Usage2::"Credit Memo";
            CustomReportSelection.Usage::"C.Statement":
                Usage2 := Usage2::"Customer Statement";
            CustomReportSelection.Usage::JQ:
                Usage2 := Usage2::"Job Quote";
            CustomReportSelection.Usage::Reminder:
                Usage2 := Usage2::Reminder;
            CustomReportSelection.Usage::"S.Shipment":
                Usage2 := Usage2::Shipment;
        end;
    end;

    local procedure FilterCustomerUsageReportSelections(var ReportSelections: Record "Report Selections")
    var
        CustomReportSelection: Record "Custom Report Selection";
    begin
        ReportSelections.SetFilter(
            Usage, '%1|%2|%3|%4|%5|%6|%7|%8',
            CustomReportSelection.Usage::"S.Quote",
            CustomReportSelection.Usage::"S.Order",
            CustomReportSelection.Usage::"S.Invoice",
            CustomReportSelection.Usage::"S.Cr.Memo",
            CustomReportSelection.Usage::"C.Statement",
            CustomReportSelection.Usage::JQ,
            CustomReportSelection.Usage::Reminder,
            CustomReportSelection.Usage::"S.Shipment");
    end;
}
