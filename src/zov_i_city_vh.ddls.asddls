@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value help for city'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZOV_I_CITY_VH
  as select from zov_cities
{
      @ObjectModel.text.element: ['Name']
      @UI.hidden: true // Hide the raw ID in the dropdown list
  key code as Code,

      name as Name
}
