@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Domain Fixed Values Value Help (Generic)'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZOV_I_DomainFixValuesVH
  as select from    DDCDS_CUSTOMER_DOMAIN_VALUE( p_domain_name: 'ZOV_GIFT_TYPE' )    as FixedValue
    left outer join DDCDS_CUSTOMER_DOMAIN_VALUE_T( p_domain_name: 'ZOV_GIFT_TYPE' ) as ValueText
                    on  FixedValue.domain_name = ValueText.domain_name
                    and FixedValue.value_low   = ValueText.value_low
{
  @UI.lineItem: [{ importance: #LOW, position: 100 }]
  @Consumption.valueHelpDefault.display: false
  key FixedValue.domain_name    as DomainName,

  @UI.hidden: true
  @Semantics.language: true
  key ValueText.language        as Language,

  @UI.lineItem: [{ importance: #HIGH, position: 20 }]
  @Consumption.valueHelpDefault.display: true
      FixedValue.value_low      as DomvalueL,

  @UI.lineItem: [{ importance: #HIGH, position: 30 }]
      FixedValue.value_high     as DomvalueH,

  @UI.lineItem: [{ importance: #HIGH, position: 50 }]
  @Consumption.valueHelpDefault.display: true
  @Semantics.text: true
      ValueText.text            as DomeValueText
}
where ValueText.language = $session.system_language
