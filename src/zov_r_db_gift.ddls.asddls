@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@ObjectModel.sapObjectNodeType.name: 'ZOV_GIFT'
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZOV_R_DB_GIFT
  as select from ZOV_DB_GIFT
{
  key id as ID,
  inviter as Inviter,
  invitee as Invitee,
  event_id as EventID,
  gift_type as GiftType,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  amount as Amount,
  @Consumption.valueHelpDefinition: [ {
    entity.name: 'I_CurrencyStdVH', 
    entity.element: 'Currency', 
    useForValidation: true
  } ]
  currency_code as CurrencyCode,
  @Semantics.user.createdBy: true
  created_by as CreatedBy,
  @Semantics.systemDateTime.createdAt: true
  created_at as CreatedAt,
  @Semantics.user.localInstanceLastChangedBy: true
  local_last_changed_by as LocalLastChangedBy,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  local_last_changed_at as LocalLastChangedAt,
  @Semantics.systemDateTime.lastChangedAt: true
  last_changed_at as LastChangedAt
}
