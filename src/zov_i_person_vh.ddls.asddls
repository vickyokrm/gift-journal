@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help: Person'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZOV_I_PERSON_VH
  as select from ZOV_R_DB_PERSON
{
  key Id as PersonId,
      Firstname,
      Lastname,
      Initials,
      City
}
