@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Attachment'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZOV_R_ATTACHMENT
  as select from zov_attachment
  association to parent ZOV_R_DB_GIFT as _Gift on $projection.GiftId = _Gift.ID
{
  key attachment_id         as AttachmentId,
      gift_id               as GiftId,
      file_name             as FileName,
      @Semantics.mimeType: true
      mime_type             as MimeType,
      @Semantics.largeObject: { mimeType: 'MimeType',   //case-sensitive
                       fileName: 'FileName',   //case-sensitive
                       acceptableMimeTypes: ['image/png', 'image/jpeg'],
                       contentDispositionPreference: #ATTACHMENT }
      attachment            as Attachment,
      created_by            as CreatedBy,
      created_at            as CreatedAt,
      local_last_changed_by as LocalLastChangedBy,
      local_last_changed_at as LocalLastChangedAt,
      last_changed_at       as LastChangedAt,

      // Expose Parent
      _Gift
}
