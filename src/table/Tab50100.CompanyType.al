table 50100 "Company Type"
{
    CaptionML = ENU = 'Company Type', DAN = ' Virksomhedstype';
    DataClassification = ToBeClassified;
    /* Permissions = tabledata 50100 = rimd; */

    fields
    {
        field(50001; Code; Code[10])
        {
            CaptionML = ENU = 'Code', DAN = 'Kode';
            DataClassification = ToBeClassified;
        }
        field(50002; Description; Text[50])
        {
            CaptionML = ENU = 'Description', DAN = 'Beskrivelse';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }

}
