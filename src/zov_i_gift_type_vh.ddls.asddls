@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help: Gift Type'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZOV_I_GIFT_TYPE_VH
  as select from ZOV_I_GIFT_TYPE
{
  key Value,
      Text
}
