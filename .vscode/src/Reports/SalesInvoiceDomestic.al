/// <summary>
/// Report DEV Sales Invoice Domestic (ID 50101).
/// </summary>
report 50101 "DEV Sales Invoice Domestic"
{
    Caption = 'Sales Invocie (Domestics)';
    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './src/Layout/DEVSalesInvoiceDomestic.rdl';

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            DataItemTableView = sorting(Status, "No.");
            RequestFilterFields = Status, "No.";

            Column(ReportCapLbl; ReportCapLbl)
            {
            }
            Column(NoCapLbl; NoCapLbl)
            {
            }
            Column(PurchaseDateCapLbl; PurchaseDateCapLbl)
            {
            }
            Column(DueDateCapLbl; DueDateCapLbl)
            {
            }
            Column(PaymentTermCapLbl; PaymentTermCapLbl)
            {
            }
            Column(CustomerCapLbl; CustomerCapLbl)
            {
            }
            Column(NameCapLbl; NameCapLbl)
            {
            }
            Column(AddressCapLbl; AddressCapLbl)
            {
            }
            Column(TaxidCapLbl; TaxidCapLbl)
            {
            }
            Column(DescCapLbl; DescCapLbl)
            {
            }
            Column(QuantityCapLbl; QuantityCapLbl)
            {
            }
            Column(PCSCapLbl; PCSCapLbl)
            {
            }
            Column(CTSCapLbl; CTSCapLbl)
            {
            }
            Column(AmountCapLbl; AmountCapLbl)
            {
            }
            Column(SubtotalCapLbl; SubtotalCapLbl)
            {
            }
            Column(GrandtotalCaplbl; GrandtotalCaplbl)
            {
            }
            Column(AuthorizedbyCapLbl; AuthorizedbyCapLbl)
            {
            }
            Column(DeliveryByCapLbl; DeliveryByCapLbl)
            {
            }
            Column(ReceivedCapLbl; ReceivedCapLbl)
            {
            }
            Column(DateCapLbl; DateCapLbl)
            {
            }
            Column(PageCapLbl; PageCapLbl)
            {
            }
            column(VATpercent; VATpercent)
            {
            }
            column(gvCustomerTel; 'Tel ' + gvCustomerTel + ' Fax ' + Customer."Fax No.")
            {
            }
            column(TaxIDNo; 'TAX ID. ' + Format("VAT Registration No.") + ' (' + gvbranch + ')')
            {
            }
            column(VATRegNo; "VAT Registration No.")
            {
            }
            column(CustomerNo; customer."No.")
            {
            }
            column(CustomerName; customer.Name + ' ' + customer."Name 2")
            {
            }
            column(CustAddr1; customer.Address)
            {
            }
            Column(CustAddr2; customer."Address 2")
            {
            }
            column(CustAddr3; customer.City + ' ' + customer.County + ' ' + customer."Post Code" + ' ' + CountryRegion."County Name")
            {
            }
            column(CustAddr4; 'Tel : ' + customer."Phone No." + ' ' + customer."Mobile Phone No." + 'Fax : ' + Customer."Fax No.")
            {
            }
            column(Contact; Customer.Contact)
            {
            }
            column(PaymentTerms; PaymentTerms.Description)
            {
            }
            column(No_hdr; "No.")
            {
            }
            column(OrderDate_Hdr; "Order Date")
            {
            }
            column(DueDate_Hdr; "Due Date")
            {
            }

            dataitem("Sales Line"; "Sales Line")
            {
                DataItemTableView = sorting("Document No.", "Line No.");
                DataItemLink = "Document No." = field("No.");
                DataItemLinkReference = "Sales Header";
                column(SeqNo; SeqNo)
                {
                }
                column(LineNo; "Line No.")
                {
                }
                column(Description; Description)
                {
                }
                column(QuantityPCS; QuantityPCS)
                {
                }
                column(QuantityCTS; QuantityCTS)
                {
                }
                column(UnitPrice; "Unit Price")
                {
                }
                column(Line_Amount; "Line Amount")
                {
                }
                column(PriceCaption; PriceCaption)
                {
                }
                column(gvlineAmount; gvlineAmount)
                {
                }
                column(gvAmount; gvAmount)
                {
                }
                column(gvTotal; gvTotal)
                {
                }
                column(gvGrandTotal; gvGrandTotal)
                {
                }
                column(gvVATPercent; gvVATPercent)
                {
                }
                column(GrandtotalText; '(' + UpperCase(GrandtotalText) + 'THAI BHAT)')
                {
                }
                column(gvComments; 'REMARK : ' + gvComments)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    clear(QuantityCTS);
                    clear(QuantityPCS);
                    Clear(VATpercent);
                    clear(gvComments);

                    if ("No." = '') then CurrReport.Skip();

                    if ("Line No." <> 0) and ("No." <> '') then begin

                        SeqNo := SeqNo + 1;

                        if ("Sales line"."Unit of Measure Code" = 'PCS') then begin
                            QuantityPCS := "Sales Line".Quantity;
                            QuantityCTS := "Sales Line"."DEV Second UOM Qty";
                        end;
                        if ("Sales Line"."Unit of Measure code" = 'CTS') then begin
                            QuantityPCS := "Sales Line"."DEV Second UOM Qty";
                            QuantityCTS := "Sales Line".Quantity;
                        end;
                    end;

                    if PriceCaptionOption = PriceCaptionOption::"PRICE/PCS" then begin
                        PriceCaption := 'PRICE/PCS';
                        gvlineAmount := QuantityPCS * "Unit Price";
                    end else begin
                        if PriceCaptionOption = PriceCaptionOption::"PRICE/CTS" then begin
                            PriceCaption := 'PRICE/CTS';
                            gvlineAmount := QuantityCTS * "Unit Price";
                        end;
                    end;

                    gvAmount += gvlineAmount;
                    gvtotal := (gvAmount - "Sales Header"."Invoice Discount Amount");
                    CalcSums("Sales Line"."Amount Including VAT");
                    gvGrandTotal := "Sales Line"."Amount Including VAT";
                    AmoutninWords(gvGrandTotal);
                    gvVATPercent := gvGrandTotal - gvAmount;

                    if gvVATPercent <> 0 then
                        VATpercent := 'VAT 7%'
                    else
                        VATpercent := 'VAT 0%';

                    CommnetLine.Reset();
                    CommnetLine.SetRange("No.", "Sales Line"."Document No.");
                    CommnetLine.SetRange("Line No.", "Sales Line"."Line No.");
                    if CommnetLine.FindFirst() then begin
                        gvComments := CommnetLine.Comment;
                        if gvComments = '' then CurrReport.Skip();
                    end;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                if not VATBusPostingGroup.Get("VAT Bus. Posting Group") then exit;

                if Customer.Get("Sell-to Customer No.") then begin
                    // if Customer."DSVC Branch ID" = '00000' then
                    //     gvbranch := 'Head Office'
                    // else
                    //     gvbranch := Customer."DSVC Branch ID";

                    // if Customer."Phone No." <> '' then
                    //     gvCustomerTel := Customer."Phone No."
                    // else
                    //     if Customer."Mobile Phone No." <> '' then
                    //         gvCustomerTel := Customer."Phone No.";
                end;
                if not CountryRegion.Get(Customer."Country/Region Code") then exit;

                if not PaymentTerms.Get("Payment Terms Code") then exit;
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group("Options")
                {
                    field(PriceCaptionOption; PriceCaptionOption)
                    {
                        Caption = 'Price Caption';
                        ApplicationArea = all;
                    }
                }
            }
        }
    }

    var
        Customer: Record Customer;
        SalesPeople: Record "Salesperson/Purchaser";
        VATBusPostingGroup: Record "VAT Business Posting Group";
        CountryRegion: record "Country/Region";
        CommnetLine: Record "Comment Line";
        PaymentTerms: Record "Payment Terms";
        SeqNo: Integer;
        QuantityCTS: Decimal;
        QuantityPCS: Decimal;
        VATpercent: text[6];
        PriceCaption: Text;
        GrandtotalText: Text;
        gvAmount: Decimal;
        gvlineAmount: Decimal;
        gvTotal: Decimal;
        gvVATPercent: Decimal;
        gvGrandTotal: Decimal;
        gvbranch: Text[15];
        gvCustomerTel: Text[30];
        gvComments: Text;
        ReportCapLbl: label 'TAX INVOICE';
        NoCapLbl: label 'NO.';
        PurchaseDateCapLbl: label 'DATE';
        DueDateCapLbl: label 'DUE DATE';
        PaymentTermCapLbl: label 'PAYMENT TERM';
        CustomerCapLbl: label 'CUSTOMER';
        NameCapLbl: label 'NAME';
        AddressCapLbl: label 'ADDRESS';
        TaxidCapLbl: label 'TAX ID';
        DescCapLbl: label 'ITEM DESCRIPTION';
        QuantityCapLbl: label 'Quantity';
        PCSCapLbl: label 'PCS';
        CTSCapLbl: label 'CTS';
        AmountCapLbl: label 'AMOUNT';
        SubtotalCapLbl: label 'SUBTOTAL';
        GrandtotalCaplbl: label 'GRAND TOTAL';
        AuthorizedbyCapLbl: label 'AUTHORIZED BY';
        DeliveryByCapLbl: label 'DELIVERED BY';
        ReceivedCapLbl: label 'RECEIVED BY';
        DateCapLbl: label 'DATE';
        PageCapLbl: Label 'Page';
        PriceCaptionOption: Option "PRICE/PCS","PRICE/CTS";

    /// <summary>
    /// AmoutninWords.
    /// </summary>
    /// <param name="GrandAmount">Decimal.</param>
    procedure AmoutninWords(GrandAmount: Decimal)
    var
        ReportCheck: Report Check;
        AmountinWords: array[2] of Text[250];
    begin
        // ReportCheck.InitTextVariable();
        // ReportCheck.FormatNoText(AmountinWords, GrandAmount, '');
        // GrandtotalText := AmountinWords[1];
    end;

}
