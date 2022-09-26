page 50101 SuperOfficeIF
{
    APIGroup = 'apiGroup';
    APIPublisher = 'publisherName';
    APIVersion = 'v1.0';
    Caption = 'superOfficeIF';
    DelayedInsert = true;
    EntityName = 'entityName';
    EntitySetName = 'entitySetName';
    PageType = API;
    SourceTable = "Company Information";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Primary_Key"; Rec."Primary Key")
                { }
                field(superOfficeToken; Rec.SuperOfficeToken)
                { }
            }
        }
    }

}
