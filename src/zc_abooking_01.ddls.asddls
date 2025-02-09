@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View - Booking Data'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity zc_abooking_01 as projection on ZI_ABOOKING_01
{
    key BookingUUID,
    TravelUUID,
    BookingId,
    BookingDate,
    @Consumption.valueHelpDefinition: [{ entity: {
        name: '/dmo/i_customer',
        element: 'CustomerID'
    } }]
    CustomerId,
    @Consumption.valueHelpDefinition: [{ entity: {
        name: '/DMO/I_Flight',
        element: 'AirlineID'
    } }]
    @ObjectModel:{ text.element: [ 'CarrierName' ] }
    CarrierId,
    _Carrier.Name as CarrierName,
    ConnectionId,
    FlightDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    FlightPrice,
    CurrencyCode,
    CreatedBy,
    LastChangedBy,
    LastChangedAt,
    /* Associations */
    _Carrier,
    _Connection,
    _Currency,
    _Customer,
    _Flight,
    _Travel : redirected to parent zc_atravel_01
}
