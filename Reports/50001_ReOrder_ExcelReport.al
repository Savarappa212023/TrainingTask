report 50001 ReOrderExcel
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;
    Caption = 'ReOrdered LevelExcel';

    dataset
    {
        dataitem(Item; Item)
        {
            trigger OnAfterGetRecord()
            begin
                ExcelBuffer.NewRow();
                ExcelBuffer.AddColumn(Item."No.", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(Item.Description, false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(Item."Base Unit of Measure", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(Item."Minimum Order Quantity", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(Item.Inventory, false, '', false, false, false, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(Item."Maximum Order Quantity", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Number);
            end;

            trigger OnPreDataItem();
            begin
                ExcelBuffer.DELETEALL;
                CreateCaptions();
            end;

            trigger OnPostDataItem();
            begin
                ExcelBuffer.CreateNewBook(ReportFileName);
                ExcelBuffer.WriteSheet(ReportFileName, CompanyName, UserId);
                ExcelBuffer.CloseBook();
                ExcelBuffer.SetFriendlyFilename(ReportFileName);
                ExcelBuffer.OpenExcel();
            end;

        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {

                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }



    var
        ExcelBuffer: Record "Excel Buffer";
        Code: Code[20];
        ProductName: Text[250];
        UOM: Code[20];
        MinQty: Decimal;
        Stock: Decimal;
        MOQ: Decimal;
        ReportFileName: Label 'Reordered Level';

    procedure CreateCaptions()
    begin
        ExcelBuffer.NewRow();
        ExcelBuffer.AddColumn('', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Reordered Level', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.NewRow();
        ExcelBuffer.AddColumn('Code', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Product Name', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('UOM', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Min.OrderQuantity', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Stock', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('MOQ', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
    end;

}