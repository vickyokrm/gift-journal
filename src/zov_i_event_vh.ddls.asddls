@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help: Events'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZOV_I_EVENT_VH as select from ZOV_R_DB_EVENT
{
  key Id        as EventId,
      Inviter,
      Title,
      EventType,
      EventDate,
      Location
}
