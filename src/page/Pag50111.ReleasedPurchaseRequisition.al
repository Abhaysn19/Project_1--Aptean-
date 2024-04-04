//This is for GA Dept.
page 50111 ReleasedPurchaseRequisition
{
    Caption = 'Released Purchase Requisition List';
    PageType = StandardDialog;
    ApplicationArea = All;
    UsageCategory = Lists;
    Editable = false;
    SourceTable = PRSubformTable;
    SourceTableView = where(Status = filter(Released));
    layout
    {
        area(Content)
        {
            repeater(GAGroup)
            {
                field(DocumentNo; Rec.DocumentNo)
                {
                    ApplicationArea = All;

                }
                field(LineNo; Rec.LineNo)
                {
                    ApplicationArea = All;

                }
                field(ItemNo; Rec.ItemNo)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(RequestorQuantity; Rec.RequestorQuantity)
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }

                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
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

    trigger OnAfterGetRecord()
    begin
        Rec.SetFilter(Status, 'Released');
    end;

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    var
        PurchaseOrderSub: Record PurchaseOrderSubform;
        PurchaseOrder: Record PurchaseOrder;
    begin
        IF CloseAction = Action::OK then begin
            Message('%1', Rec.ItemNo);
            PurchaseOrderSub.Type := Rec.Type;
            // PurchaseOrderSub.LineNo := Rec.ItemNo;
            // PurchaseOrderSub.PrNo := Rec.DocumentNo;
            // PurchaseOrderSub.Insert(true);


            Message('%1', PurchaseOrderSub.Type);
            PurchaseOrderSub.Insert(true);
        end;
    end;
}