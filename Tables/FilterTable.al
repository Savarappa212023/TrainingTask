table 50020 FilterTable
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1;"No."; Code[20])
        {
            DataClassification = ToBeClassified;
caption = 'No.';
            
        }
        field(2; Name; Text[150])
        {
            DataClassification = ToBeClassified;
          caption = 'Name';
        }
        field(3; salary; Decimal)
        {
            DataClassification = ToBeClassified;
        }
      /*  field(4; "Shortcut Dimension 3 Code"; code[50])
        {
           // DataClassification = ToBeClassified;
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("Dimension Set Entry"."Dimension Value Code" where("Dimension Set ID" = field("Dimension Set ID"),
                                                                                    "Global Dimension No." = const(3)));
        }*/
        field(5; GivenDate; Date)
        {
            DataClassification = ToBeClassified;
        }
    }
    
    keys
    {
        key(pk; "No.")
        {
            Clustered = true;
        }
    }
    
    var
        myInt: Integer;
    
    trigger OnInsert()
    begin
        
    end;
    
    trigger OnModify()
    begin
        
    end;
    
    trigger OnDelete()
    begin
        
    end;
    
    trigger OnRename()
    begin
        
    end;
    
}
