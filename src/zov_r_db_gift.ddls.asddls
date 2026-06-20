@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@ObjectModel.sapObjectNodeType.name: 'ZOV_GIFT'
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZOV_R_DB_GIFT
  as select from zov_db_gift
  association [1..1] to ZOV_R_DB_EVENT  as _Event   on $projection.EventID  = _Event.Id
  association [1..1] to ZOV_R_DB_PERSON as _Inviter on $projection.InviterId = _Inviter.Id
  association [1..1] to ZOV_R_DB_PERSON as _Invitee on $projection.InviteeId = _Invitee.Id
{
  key id                    as ID,
      inviter               as InviterId,
      _Inviter.Firstname    as Inviter,
      invitee               as InviteeId,
      _Invitee.Firstname    as Invitee,
      event_id              as EventID,
      _Event.Title          as EventTitle,
      gift_type             as GiftType,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      amount                as Amount,
      @Consumption.valueHelpDefinition: [ {
        entity.name: 'I_CurrencyStdVH',
        entity.element: 'Currency',
        useForValidation: true
      } ]
      currency_code         as CurrencyCode,
      @Semantics.user.createdBy: true
      created_by            as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at            as CreatedAt,
      @Semantics.user.localInstanceLastChangedBy: true
      local_last_changed_by as LocalLastChangedBy,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt,

      // Associations
      _Event,
      _Inviter,
      _Invitee
}

