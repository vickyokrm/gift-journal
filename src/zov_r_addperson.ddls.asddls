@EndUserText.label: 'Add Person'
define abstract entity ZOV_R_ADDPERSON

{
  @EndUserText.label: 'First Name'
  FirstName : zov_firstname;

  @EndUserText.label: 'Last Name'
  LastName  : zov_lastname;

  @EndUserText.label: 'Initials'
  Initials  : zov_initials;
  
  @EndUserText.label: 'City'
  @Consumption.valueHelpDefinition: [{ entity: { name: 'ZOV_I_CITY_VH', element: 'Code' } }]
  @Consumption.defaultValue: '001'
  City      : zov_city;

}
