@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Project View Attachment'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZOV_C_ATTACHMENT
  as projection on ZOV_R_ATTACHMENT
{
  key AttachmentId,
      @EndUserText.label: 'Gift'
      GiftId,
      FileName,
      MimeType,
      Attachment,
      CreatedBy,
      CreatedAt,
      LocalLastChangedBy,
      LocalLastChangedAt,
      LastChangedAt,
      /* Associations */
      _Gift : redirected to parent ZOV_C_DB_GIFT

}
