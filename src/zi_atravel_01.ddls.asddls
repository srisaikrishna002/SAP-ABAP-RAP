@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface View - Travel Data'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZI_ATRAVEL_01 as select from ztab_travel_01
    composition [1..*] of ZI_ABOOKING_01 as _Booking
    association[0..1] to /DMO/I_Agency as _Agency on $projection.AgencyId = _Agency.AgencyID
    association[0..1] to /DMO/I_Customer as _Customer on $projection.CustomerId = _Customer.CustomerID
    association[0..1] to I_Currency as _Currency on $projection.CurrencyCode = _Currency.Currency
    association[1..1] to ZTRVLSTUS_VH as _TraveStatus on $projection.Status = _TraveStatus.value_low
{
    key travel_uuid as TravelUUID,
    travel_id as TravelId,
    agency_id as AgencyId,
    customer_id as CustomerId,
    begin_date as BeginDate,
    end_date as EndDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    booking_fee as BookingFee,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    total_price as TotalPrice,
    currency_code as CurrencyCode,
    description as Description,
    status as Status,
    created_by as CreatedBy,
    created_at as CreatedAt,
    last_changed_by as LastChangedBy,
    last_changed_at as LastChangedAt,
    local_last_changed_at as LocalLastChangedAt,
    
    _Booking,
    _Agency,
    _Customer,
    _Currency,
    _TraveStatus
}
