@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Event Basic Interface View'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZOV_R_DB_EVENT
  as select from zov_db_event
{
  key id                    as Id,
      inviter               as Inviter,
      title                 as Title,
      event_type            as EventType,
      event_date            as EventDate,
      location              as Location,
      created_by            as CreatedBy,
      created_at            as CreatedAt,
      local_last_changed_by as LocalLastChangedBy,
      local_last_changed_at as LocalLastChangedAt,
      last_changed_at       as LastChangedAt
}
