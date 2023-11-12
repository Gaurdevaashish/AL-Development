// <summary>
/// Report DSVC Purchase Bill (ID 61000).
/// </summary>
report 50100 "Purchase Bill"
{
    Caption = 'Purchase Bill';
    UsageCategory = Administration;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './src/Layout/DEVPurchaseBill.rdl';
    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            DataItemTableView = sorting(Status, "No.");
            RequestFilterFields = Status, "No.";

            Column(CompanyAddr1; CompanyAddr[1])
            {
            }
            column(CompanyAddr2; CompanyAddr[2])
            {
            }
            column(CompanyAddr3; CompanyAddr[3])
            {
            }
            column(CompanyAddr4; CompanyAddr[4])
            {
            }
            column(CompanyAddr5; CompanyAddr[5])
            {
            }
            column(CompanyAddr6; CompanyAddr[6])
            {
            }
            column(CompanyAddr7; CompanyAddr[7])
            {
            }
            column(CompanyAddr8; CompanyAddr[8])
            {
            }
            column(Name_Company; CompanyInfo.Name)
            {
            }
            column(Picture_Company; CompanyInfo.Picture)
            {
            }
            column(Addr_Company; CompanyInfo.Address)
            {
            }
            column(Adddr2_Company; CompanyInfo."Address 2")
            {
            }
            column(PhoneNo_Company; CompanyInfo."Phone No.")
            {
            }
            column(VATRegNo_Company; CompanyInfo."VAT Registration No.")
            {
            }
            column(VATRegNo_PurchInvHeader; "VAT Registration No.")
            {
            }
            column(VendorNo_PurchInvHeader; "Buy-from Vendor No.")
            {
            }
            column(Name_PurchInvHeader; "Pay-to Name" + ' ' + "Pay-to Name 2")
            {
            }
            column(Addr_Vendor; Vendor.Address)
            {
            }
            Column(Addr2_Vendor; Vendor."Address 2")
            {
            }
            column(VendorDetl1; Vendor.City + ' ' + Vendor.County + ' ' + Vendor."Post Code" + ' ' + CountryRegion."County Name")
            {
            }
            column(Tel_Vendor; Vendor."Phone No." + ' ' + Vendor."Mobile Phone No.")
            {
            }
            column(gvVendorTel; 'Tel ' + gvVendorTel + ' Fax ' + Vendor."Fax No.")
            {
            }
            column(TaxIDNo; 'TAX ID No. ' + Format("VAT Registration No.") + ' (' + gvbranch + ')')
            {
            }
            column(Fax_Vendor; Vendor."Fax No.")
            {
            }
            column(Contact_Vendor; Vendor.Contact)
            {
            }
            column(No_PurchInvHeader; "No.")
            {
            }
            column(Order_Date; "Order Date")
            {
            }
            column(Due_Date; "Due Date")
            {
            }
            column(PurchaserName; '(' + format(SalesPeople."Name") + ')')
            {
            }
            column(Comment; Comment)
            {
            }
            column(Your_Reference; "Your Reference")
            {
            }
            column(gvbranch; gvbranch)
            {
            }
            Column(ReportCapLbl; ReportCapLbl)
            {
            }
            Column(PurchaseNoCapLbl; PurchaseNoCapLbl)
            {
            }
            Column(PurchaseDateCapLbl; PurchaseDateCapLbl)
            {
            }
            Column(DueDateCapLbl; DueDateCapLbl)
            {
            }
            Column(PurchaserCapLbl; PurchaserCapLbl)
            {
            }
            Column(VendorNoCapLbl; VendorNoCapLbl)
            {
            }
            Column(VendNameCapLbl; VendNameCapLbl)
            {
            }
            Column(AdressCapLbl; AdressCapLbl)
            {
            }
            Column(TelPhoneCapLbl; TelPhoneCapLbl)
            {
            }
            Column(FaxCapLbl; FaxCapLbl)
            {
            }
            Column(ATTNCapLbl; ATTNCapLbl)
            {
            }
            column(BranchIDCapLbl; BranchIDCapLbl)
            {
            }
            Column(NoCapLbl; NoCapLbl)
            {
            }
            Column(ReferenceCapLbl; ReferenceCapLbl)
            {
            }
            Column(DescriptionCapLbl; DescriptionCapLbl)
            {
            }
            Column(QuantityCapLbl; QuantityCapLbl)
            {
            }
            Column(UOMCapLbl; UOMCapLbl)
            {
            }
            Column(PCSCapLbl; PCSCapLbl)
            {
            }
            Column(CTSCapLbl; CTSCapLbl)
            {
            }
            Column(PriceCapLbl; PriceCapLbl)
            {
            }
            Column(AmountCapLbl; AmountCapLbl)
            {
            }
            Column(TotalCapLbl; TotalCapLbl)
            {
            }
            Column(GrandTotalCapLbl; GrandTotalCapLbl)
            {
            }
            Column(RemarkCapLbl; RemarkCapLbl)
            {
            }
            Column(PreparedByCapLbl; PreparedByCapLbl)
            {
            }
            Column(ApprovedByCapLbl; ApprovedByCapLbl)
            {
            }
            Column(DateCapLbl; DateCapLbl)
            {
            }
            Column(PageNoCapLbl; PageNoCapLbl)
            {
            }
            Column(PrintDateCapLbl; PrintDateCapLbl)
            {
            }
            column(ApprovedbyNameCapLbl; ApprovedbyNameCapLbl)
            {
            }

            dataitem("Purchase Line"; "Purchase Line")
            {
                DataItemTableView = sorting("Document No.", "Line No.");
                DataItemLink = "Document No." = field("No.");
                DataItemLinkReference = "Purchase Header";

                column(SeqNo; SeqNo)
                {
                }
                column(No; "No.")
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
                column(UOM; "Unit of Measure Code")
                {
                }
                column(Amount_Including_VAT; "Amount Including VAT")
                {
                }
                column(Line_Amount; "Line Amount")
                {
                }
                column(VATpercent; VATpercent)
                {
                }
                column(VAT_Base_Amount; "VAT Base Amount")
                {
                }
                column(lvAmount; lvAmount)
                {
                }
                column(Direct_Unit_Cost; "Direct Unit Cost")
                {
                }
                column(lvTotal; lvTotal)
                {
                }
                column(lvGrandTotal; lvGrandTotal)
                {
                }
                column(lvVATPercent; lvVATPercent)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    clear(QuantityCTS);
                    clear(QuantityPCS);
                    Clear(VATpercent);

                    if ("No." = '') then CurrReport.Skip();

                    if ("Line No." <> 0) and ("No." <> '') then begin

                        SeqNo := SeqNo + 1;

                        if ("purchase line"."Unit of Measure Code" = 'PCS') then begin
                            QuantityPCS := "Purchase Line".Quantity;
                           // QuantityCTS := "Purchase Line"."DEV Second UOM Qty";
                        end;
                        if ("Purchase Line"."Unit of Measure code" = 'CTS') then begin
                            // QuantityPCS := "Purchase Line"."DEV Second UOM Qty";
                            QuantityCTS := "Purchase Line".Quantity;
                        end;
                    end;

                    "Purchase Line".CalcSums(Amount);
                    lvAmount := "Purchase Line".Amount;
                    lvtotal := (lvAmount - "Purchase Header"."Invoice Discount Amount");
                    CalcSums("Purchase Line"."Amount Including VAT");
                    lvGrandTotal := "Purchase Line"."Amount Including VAT";
                    lvVATPercent := lvGrandTotal - lvAmount;

                    if lvVATPercent <> 0 then
                        VATpercent := 'VAT 7%'
                    else
                        VATpercent := 'VAT 0%';
                end;
            }
            trigger OnAfterGetRecord()
            begin
                Clear(gvVendorTel);

                if "Currency Code" = '' then begin
                    PriceCapLbl := 'PRICE (THB)';
                    AmountCapLbl := 'AMOUNT (THB)';
                end else begin
                    PriceCapLbl := 'PRICE' + '(' + "Currency Code" + ')';
                    AmountCapLbl := 'AMOUNT' + '(' + "Currency Code" + ')';
                end;

                if not VATBusPostingGroup.Get("VAT Bus. Posting Group") then exit;

                if Vendor.Get("Buy-from Vendor No.") then begin
                    // if Vendor."Exp Branch ID" = '00000' then
                    //     gvbranch := 'Head Office'
                    // else
                    // gvbranch := Vendor."Exp Branch ID";

                    if Vendor."Phone No." <> '' then
                        gvVendorTel := Vendor."Phone No."
                    else
                        if Vendor."Mobile Phone No." <> '' then
                            gvVendorTel := Vendor."Phone No.";

                    if not CountryRegion.Get(Vendor."Country/Region Code") then exit;
                end else
                    exit;

                if not SalesPeople.Get("Purchaser Code") then
                    exit;
            end;
        }
    }
    trigger OnPreReport()
    begin
        CompanyInfo.Get();
        FormatAddr.Company(CompanyAddr, CompanyInfo);
    end;

    var
        SeqNo: Integer;
        CompanyInfo: Record "Company Information";
        FormatAddr: Codeunit "Format Address";
        SalesPeople: Record "Salesperson/Purchaser";
        VATBusPostingGroup: Record "VAT Business Posting Group";
        Vendor: Record Vendor;
        CountryRegion: record "Country/Region";
        QuantityCTS: Decimal;
        QuantityPCS: Decimal;
        VATpercent: text[6];

        CompanyAddr: array[8] of Text[50];
        GrandtotalText: text[250];
        lvAmount: Decimal;
        lvTotal: Decimal;
        lvVATPercent: Decimal;
        lvGrandTotal: Decimal;
        gvbranch: Text[15];
        gvVendorTel: Text[30];

        ReportCapLbl: label 'PURCHASE BILL';
        PurchaseNoCapLbl: label 'Purchase No.';
        PurchaseDateCapLbl: label 'Purchase Date';
        DueDateCapLbl: label 'Due Date';
        PurchaserCapLbl: label 'Purchaser';
        VendorNoCapLbl: label 'Vendor No.';
        VendNameCapLbl: label 'Vendor Name';
        AdressCapLbl: label 'Address';
        BranchIDCapLbl: label 'Branch';
        TelPhoneCapLbl: label 'TEL';
        FaxCapLbl: label 'FAX';
        ATTNCapLbl: label 'TAX ID No.';
        NoCapLbl: label 'NO.';
        ReferenceCapLbl: label 'REF NO.';
        DescriptionCapLbl: label 'ITEM DESCRIPTION';
        QuantityCapLbl: label 'QUANTITY';
        UOMCapLbl: label 'UNIT';
        PCSCapLbl: label 'PCS';
        CTSCapLbl: label 'CTS';
        PriceCapLbl: Text;
        AmountCapLbl: Text;
        TotalCapLbl: label 'SUBTOTAL';
        GrandTotalCapLbl: label 'GRAND TOTAL';
        RemarkCapLbl: label 'Remark';
        PreparedByCapLbl: label 'PREPARED BY:';
        ApprovedByCapLbl: label 'APPROVED BY:';
        DateCapLbl: label 'DATE';
        PageNoCapLbl: label 'Page';
        PrintDateCapLbl: label 'Print Date';
        ApprovedbyNameCapLbl: label '( MR.LI CHONG JIE)';
}
