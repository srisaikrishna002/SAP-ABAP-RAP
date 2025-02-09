@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View - Travel Data'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@Search.searchable: true
define root view entity zc_atravel_01 as projection on ZI_ATRAVEL_01
{
    key TravelUUID,
    @Search:{ defaultSearchElement: true, fuzzinessThreshold: 0.7 }
    @Consumption.valueHelpDefinition: [{ entity: {
        name: 'zi_atravel_01',
        element: 'TravelId'
    } }]
    TravelId,
    @Consumption.valueHelpDefinition: [{ entity: {
        name: '/DMO/I_Agency',
        element: 'AgencyID'
    } }]
    @ObjectModel.text.element: [ 'AgencyName' ]
    AgencyId,
    _Agency.Name as AgencyName,
    
    @Consumption.valueHelpDefinition: [{ entity: {
        name: '/DMO/I_Customer',
        element: 'CustomerID'
    } }]
    @ObjectModel.text: {
        element: [ 'CustomerName' ]
//        association: '_Customer'
//
//        reference: {
//            association: '_Customer'
//        }
    }
    CustomerId,
    _Customer.LastName as CustomerName,
    BeginDate,
    EndDate,
    
    
    
    @Semantics.amount.currencyCode: 'CurrencyCode'
    BookingFee,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    TotalPrice,
    CurrencyCode,
    Description,
    @Consumption.valueHelpDefinition: [{ entity:{ name: 'ZTRVLSTUS_VH', element: 'text' } }]
    @ObjectModel:{ text.element: [ 'StatusDesc' ] }
    Status,
    _TraveStatus.text as StatusDesc,
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt,
    LocalLastChangedAt,
    /* Associations */
    _Agency,
    _Booking : redirected to composition child zc_abooking_01,
    _Currency,
    _Customer,
    _TraveStatus
}
