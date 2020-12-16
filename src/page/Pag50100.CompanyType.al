page 50100 "Company Type"
{

    ApplicationArea = All;
    CaptionML = ENU = 'Company Type', DAN = 'Virksomhedstype';
    PageType = List;
    SourceTable = "Company Type";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

}
