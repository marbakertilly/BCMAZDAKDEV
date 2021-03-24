table 50116 TeamMemberView
{
    Caption = 'TeamMemberView';
    DataClassification = ToBeClassified;

    fields
    {
        field(50100; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            DataClassification = ToBeClassified;
        }
        field(50101; "Owner Projects Count Open"; Integer)
        {
            Caption = 'Owner Projects Count';
            FieldClass = FlowField;
            //CalcFormula = count("RIT TimeLog Project" where("Owner Initials"=filter(USERID)));
        }
        field(50102; "Owner WIP"; Decimal)
        {
            Caption = 'Owner WIP';
            DataClassification = ToBeClassified;
        }
        field(50103; "Project Manager Count Open"; Integer)
        {
            Caption = 'Project Manager Projects Count';
            DataClassification = ToBeClassified;
        }
        field(50104; "Project Manager WIP"; Decimal)
        {
            Caption = 'Project Manager WIP';
            DataClassification = ToBeClassified;
        }
        field(50105; "Owner Projects Count Closed"; Integer)
        {
            Caption = 'Owner Projects Count Closed';
            FieldClass = FlowField;
        }
        field(50106; "Project Manager Count Closed"; Integer)
        {
            Caption = 'Project Manager Count Closed';
            FieldClass = FlowField;
        }
        field(50107; "User ID Filter"; code[20])
        {
            Caption = 'USER ID Filter';
            FieldClass = FlowField;
            //CalcFormula = lookup(User."User Name" where("User Name"=field())
        }
    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }

}
