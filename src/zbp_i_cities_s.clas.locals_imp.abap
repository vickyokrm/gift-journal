CLASS lhc_citiesall DEFINITION FINAL INHERITING FROM cl_abap_behavior_handler.
  PUBLIC SECTION.
    CONSTANTS:
      co_entity               TYPE abp_entity_name VALUE `ZI_CITIES_S`,
      co_transport_object     TYPE mbc_cp_api=>indiv_transaction_obj_name VALUE `ZCITIES`,
      co_authorization_entity TYPE abp_entity_name VALUE `ZI_CITIES`.

  PRIVATE SECTION.
    METHODS:
      get_instance_features FOR INSTANCE FEATURES
        IMPORTING
                  keys   REQUEST requested_features FOR CitiesAll
        RESULT    result,
      selectcustomizingtransptreq FOR MODIFY
        IMPORTING
                  keys   FOR ACTION CitiesAll~SelectCustomizingTransptReq
        RESULT    result,
      get_global_authorizations FOR GLOBAL AUTHORIZATION
        IMPORTING
        REQUEST requested_authorizations FOR CitiesAll
        RESULT result,
      edit FOR MODIFY
        IMPORTING
          keys FOR ACTION CitiesAll~edit.
ENDCLASS.

CLASS lhc_citiesall IMPLEMENTATION.
  METHOD get_instance_features.
*    mbc_cp_api=>rap_bc_api( )->get_instance_features(
*      transport_object   = co_transport_object
*      entity             = co_entity
*      keys               = REF #( keys )
*      requested_features = REF #( requested_features )
*      result             = REF #( result )
*      failed             = REF #( failed )
*      reported           = REF #( reported ) ).

    READ ENTITIES OF ZI_Cities_S IN LOCAL MODE
          ENTITY CitiesAll
            ALL FIELDS WITH CORRESPONDING #( keys )
          RESULT DATA(lt_singleton).

    LOOP AT lt_singleton ASSIGNING FIELD-SYMBOL(<singleton>).
      APPEND INITIAL LINE TO result ASSIGNING FIELD-SYMBOL(<res>).
      <res>-%tky = <singleton>-%tky.



      " BYPASS TRANSPORT CHECK: Force Create button to always be visible!
      <res>-%assoc-_Cities = if_abap_behv=>fc-o-enabled.
      <res>-%action-Edit = if_abap_behv=>fc-o-enabled.
    ENDLOOP.

  ENDMETHOD.
  METHOD selectcustomizingtransptreq.
    mbc_cp_api=>rap_bc_api( )->select_transport_action(
      entity   = co_entity
      keys     = REF #( keys )
      result   = REF #( result )
      mapped   = REF #( mapped )
      failed   = REF #( failed )
      reported = REF #( reported ) ).
  ENDMETHOD.
  METHOD get_global_authorizations.
*    mbc_cp_api=>rap_bc_api( )->get_global_authorizations(
*      entity                   = co_authorization_entity
*      requested_authorizations = REF #( requested_authorizations )
*      result                   = REF #( result )
*      reported                 = REF #( reported ) ).

    " BYPASS SAP CLIENT / TRANSPORT SECURITY CHECKS

    " Allow updating the Singleton
    result-%update = if_abap_behv=>auth-allowed.

    " Allow executing the Edit action (Draft creation)
    result-%action-Edit = if_abap_behv=>auth-allowed.

    " Allow creating child records (Cities)
*    result-%assoc-Cities = if_abap_behv=>auth-allowed.

  ENDMETHOD.
  METHOD edit.
    mbc_cp_api=>rap_bc_api( )->get_default_transport_request(
      transport_object = co_transport_object
      entity           = co_entity
      keys             = REF #( keys )
      mapped           = REF #( mapped )
      failed           = REF #( failed )
      reported         = REF #( reported ) ).
  ENDMETHOD.
ENDCLASS.
CLASS lsc_citiesall DEFINITION FINAL INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.
    METHODS:
      save_modified REDEFINITION.
ENDCLASS.

CLASS lsc_citiesall IMPLEMENTATION.
  METHOD save_modified.
    mbc_cp_api=>rap_bc_api( )->record_changes(
      transport_object = lhc_CitiesAll=>co_transport_object
      entity           = lhc_CitiesAll=>co_entity
      create           = REF #( create )
      update           = REF #( update )
      delete           = REF #( delete )
      reported         = REF #( reported ) ).
    mbc_cp_api=>rap_bc_api( )->update_last_changed_date_time(
      maintenance_object = 'ZCITIES'
      entity             = lhc_CitiesAll=>co_authorization_entity
      create             = REF #( create )
      update             = REF #( update )
      delete             = REF #( delete )
      reported           = REF #( reported ) ).
  ENDMETHOD.
ENDCLASS.
CLASS lhc_cities DEFINITION FINAL INHERITING FROM cl_abap_behavior_handler.
  PUBLIC SECTION.
    CONSTANTS:
      co_entity TYPE abp_entity_name VALUE `ZI_CITIES`.

  PRIVATE SECTION.
    METHODS:
      get_global_features FOR GLOBAL FEATURES
        IMPORTING
        REQUEST requested_features FOR Cities
        RESULT result,
      validatetransportrequest FOR VALIDATE ON SAVE
        IMPORTING
          keys_citiesall FOR CitiesAll~ValidateTransportRequest
          keys_cities    FOR Cities~ValidateTransportRequest.
ENDCLASS.

CLASS lhc_cities IMPLEMENTATION.
  METHOD get_global_features.
    mbc_cp_api=>rap_bc_api( )->get_global_features(
      transport_object   = lhc_CitiesAll=>co_transport_object
      entity             = co_entity
      requested_features = REF #( requested_features )
      result             = REF #( result )
      reported           = REF #( reported ) ).
  ENDMETHOD.
  METHOD validatetransportrequest.
    RETURN.
*    mbc_cp_api=>rap_bc_api( )->validate_transport_request(
*      transport_object = lhc_CitiesAll=>co_transport_object
*      entity           = lhc_CitiesAll=>co_entity
*      validation_keys  = VALUE #( ( REF #( keys_CitiesAll ) )
*                                  ( REF #( keys_Cities ) ) )
*      failed           = REF #( failed )
*      reported         = REF #( reported ) ).
  ENDMETHOD.
ENDCLASS.
