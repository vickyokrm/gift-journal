@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@EndUserText: {
  label: '###GENERATED Core Data Service Entity'
}
@ObjectModel: {
  sapObjectNodeType.name: 'ZOV_GIFT'
}
@OData.entityType.name: 'Gift_Type'
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZOV_C_DB_GIFT
  provider contract transactional_query
  as projection on ZOV_R_DB_GIFT
  association [1..1] to ZOV_R_DB_GIFT as _BaseEntity on $projection.ID = _BaseEntity.ID
{
  key ID,

      @EndUserText.label: 'Inviter ID'
      @Consumption.valueHelpDefinition: [ { entity: { name: 'ZOV_I_PERSON_VH', element: 'PersonId' } } ]
      InviterId,

      @EndUserText.label: 'Inviter'
      @Consumption.valueHelpDefinition: [ { entity: { name: 'ZOV_I_PERSON_VH', element: 'PersonId' } } ]
      Inviter,

      @EndUserText.label: 'Invitee ID'
      @Consumption.valueHelpDefinition: [ { entity: { name: 'ZOV_I_PERSON_VH', element: 'PersonId' } } ]
      InviteeId,

      @EndUserText.label: 'Invitee'
      @Consumption.valueHelpDefinition: [ { entity: { name: 'ZOV_I_PERSON_VH', element: 'PersonId' } } ]
      Invitee,

      @EndUserText.label: 'Event'
      @Consumption.valueHelpDefinition: [ { entity: { name: 'ZOV_I_EVENT_VH', element: 'EventId' } } ]
      EventID,

      @EndUserText.label: 'Event Title'
      EventTitle,

      @EndUserText.label: 'Gift Type'
      @Consumption.valueHelpDefinition: [ { entity: { name: 'ZOV_I_GIFT_TYPE_VH', element: 'Value' } } ]
      GiftType,

      @EndUserText.label: 'Gift Date'
//      @Consumption.valueHelpDefinition: [ { entity: { name: 'ZOV_I_GIFT_TYPE_VH', element: 'Value' } } ]
      GiftDate,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      Amount,

      @Consumption.valueHelpDefinition: [ {
        entity.element: 'Currency',
        entity.name: 'I_CurrencyStdVH',
        useForValidation: true
      } ]
      CurrencyCode,

      @Semantics.user.createdBy: true
      CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      CreatedAt,
      @Semantics.user.localInstanceLastChangedBy: true
      LocalLastChangedBy,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      LocalLastChangedAt,
      @Semantics.systemDateTime.lastChangedAt: true
      LastChangedAt,

      _BaseEntity,
      _Attachments : redirected to composition child ZOV_C_ATTACHMENT
}
