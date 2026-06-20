@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Person Basic Interface View'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZOV_R_DB_PERSON
  as select from zov_db_person
{
  key pernr                 as Pernr,
  key id                    as Id,
      firstname             as Firstname,
      lastname              as Lastname,
      initials              as Initials,
      city                  as City,
      @Semantics.user.createdBy: true
      created_by            as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at            as CreatedAt,
      @Semantics.user.localInstanceLastChangedBy: true
      local_last_changed_by as LocalLastChangedBy,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt
}
