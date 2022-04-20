codeunit 50106 "SalesSubscribers"
{
    EventSubscriberInstance = StaticAutomatic;

    [EventSubscriber(ObjectType::Table, Database::"Reminder Line", 'OnCalcFinChrgOnBeforeValidatePostingGroups', '', true, true)]
    local procedure "Reminder Line_OnCalcFinChrgOnBeforeValidatePostingGroups"
   (
       var ReminderLine: Record "Reminder Line";
       var ReminderHeader: Record "Reminder Header";
       var Amount: Decimal
   )
    begin

        if ReminderLine."Document Type" = ReminderLine."Document Type"::"Finance Charge Memo" then
            Amount := 0;
    end;
}