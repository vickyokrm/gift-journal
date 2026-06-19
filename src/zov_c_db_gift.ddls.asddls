@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: '###GENERATED Core Data Service Entity'
}
@Objectmodel: {
  Sapobjectnodetype.Name: 'ZOV_GIFT'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZOV_C_DB_GIFT
  provider contract TRANSACTIONAL_QUERY
  as projection on ZOV_R_DB_GIFT
  association [1..1] to ZOV_R_DB_GIFT as _BaseEntity on $projection.ID = _BaseEntity.ID
{
  key ID,
  Inviter,
  Invitee,
  EventID,
  GiftType,
  @Semantics: {
    Amount.Currencycode: 'CurrencyCode'
  }
  Amount,
  @Consumption: {
    Valuehelpdefinition: [ {
      Entity.Element: 'Currency', 
      Entity.Name: 'I_CurrencyStdVH', 
      Useforvalidation: true
    } ]
  }
  CurrencyCode,
  @Semantics: {
    User.Createdby: true
  }
  CreatedBy,
  @Semantics: {
    Systemdatetime.Createdat: true
  }
  CreatedAt,
  @Semantics: {
    User.Localinstancelastchangedby: true
  }
  LocalLastChangedBy,
  @Semantics: {
    Systemdatetime.Localinstancelastchangedat: true
  }
  LocalLastChangedAt,
  @Semantics: {
    Systemdatetime.Lastchangedat: true
  }
  LastChangedAt,
  _BaseEntity
}
