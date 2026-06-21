@EndUserText.label: 'Cities'
@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
define view entity ZI_Cities
  as select from ZOV_CITIES
  association to parent ZI_Cities_S as _CitiesAll on $projection.SingletonID = _CitiesAll.SingletonID
{
  key CODE as Code,
  NAME as Name,
  @Consumption.hidden: true
  1 as SingletonID,
  _CitiesAll
}
