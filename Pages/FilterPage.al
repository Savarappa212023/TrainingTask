page 50020 FilterPage
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = FilterTable;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(salary; Rec.salary)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the salary field.';
                }
              /*  field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';
                    trigger OnValidate()
                    var
                        DimensionSetentry: Codeunit DimensionManagement;
                    begin

                    end;
                }*/
                field(GivenDate; Rec.GivenDate)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the GivenDate field.';
                }


            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
        SalesOrderSubform: Page "Sales Order Subform";
        Msg: Label 'Today is ''%1''\Start Date of the month is ''%2''\End Date of the month is ''%3''';

    trigger OnOpenPage()
    var
        StartDate: Date;
        EndDate: Date;
        Givendate:Date;
        varOrigGroup: Integer;
        varCurrGroup: Integer;
        Text000: Label 'The original filtergroup is: %1';
        Text001: Label 'The current filtergroup is: %1';
    begin
        Rec.SetFilter("No.", '100..300');
        varOrigGroup := Rec.FilterGroup;
        Message(Text000, varOrigGroup);
        varCurrGroup := Rec.FilterGroup(1);
        Message(Text001, varCurrGroup);



        
            StartDate := CalcDate('<-CM>',Givendate );
            EndDate := CalcDate('<CM>', Givendate);
            Message(Msg, Givendate, StartDate, EndDate);
        end;
    



}