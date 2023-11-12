/// <summary>
/// TableExtension Sales Line Ext (ID 50101) extends Record Sales Line.
/// </summary>
tableextension 50101 "Sales Line Ext" extends "Sales Line"
{
    fields
    {
        field(50100; "DEV Second UOM Qty"; Decimal)
        {
            Caption = 'Second UOM Qty';
            DataClassification = CustomerContent;
        }
        field(50101; "DEV Second UOM Code"; code[20])
        {
            Caption = 'Second UOM Code';
            DataClassification = CustomerContent;
        }
    }
}
