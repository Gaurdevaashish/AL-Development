/// <summary>
/// PageExtension Sales Order Subform Ext (ID 50101) extends Record Sales Order Subform.
/// </summary>
pageextension 50101 "Sales Order Subform Ext" extends "Sales Order Subform"
{
    layout
    {
        addafter("Unit of Measure Code")
        {
            field("DEV Second UOM Code"; Rec."DEV Second UOM Code")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies second unit of measure code';
            }
            field("DEV Second UOM Qty"; Rec."DEV Second UOM Qty")
            {
                ApplicationArea = all;
                ToolTip = 'Sepecifies Second unit of measur quantity.';
            }
        }
    }
}
