@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Gift Type Domain Values (Interface)'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZOV_I_GIFT_TYPE
  as select from    DDCDS_CUSTOMER_DOMAIN_VALUE(
                    p_domain_name : 'ZOV_GIFT_TYPE') as Values
    left outer join DDCDS_CUSTOMER_DOMAIN_VALUE_T(
                    p_domain_name : 'ZOV_GIFT_TYPE') as Texts
                    on  Texts.domain_name    = Values.domain_name
                    and Texts.value_position = Values.value_position
                    and Texts.language       = $session.system_language
{
  @EndUserText.label: 'Gift Type Value'
  key Values.value_low as Value,

  @EndUserText.label: 'Gift Type Text'
      Texts.text       as Text
}
