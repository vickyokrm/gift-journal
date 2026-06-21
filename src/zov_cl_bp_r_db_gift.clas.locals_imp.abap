CLASS lhc_zov_r_db_gift DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS:
      get_global_authorizations FOR GLOBAL AUTHORIZATION
        IMPORTING
        REQUEST requested_authorizations FOR Gift
        RESULT result,
      createEvent FOR MODIFY
        IMPORTING keys FOR ACTION Gift~createEvent,
      SetDefaultValues FOR DETERMINE ON MODIFY
        IMPORTING keys FOR Gift~SetDefaultValues.

    METHODS ValidateAmount FOR VALIDATE ON SAVE
      IMPORTING keys FOR Gift~ValidateAmount.
    METHODS AddPerson FOR MODIFY
      IMPORTING keys FOR ACTION Gift~AddPerson.

ENDCLASS.

CLASS lhc_zov_r_db_gift IMPLEMENTATION.
  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD createEvent.

  ENDMETHOD.

  METHOD SetDefaultValues.

    READ ENTITIES OF zov_r_db_gift IN LOCAL MODE
      ENTITY Gift
        FIELDS ( Amount CurrencyCode GiftType GiftDate )
        WITH CORRESPONDING #( keys )
      RESULT DATA(lt_gifts).

    CHECK lt_gifts IS NOT INITIAL.


    MODIFY ENTITIES OF zov_r_db_gift IN LOCAL MODE
      ENTITY Gift
        UPDATE FIELDS ( GiftDate CurrencyCode )
        WITH VALUE #( FOR ls_gift IN lt_gifts ( %tky = ls_gift-%tky
                                                 GiftDate = COND #( WHEN ls_gift-GiftDate IS INITIAL THEN cl_abap_context_info=>get_system_date( )
                                                                    ELSE ls_gift-GiftDate )
                                                 CurrencyCode = 'INR' ) ).

  ENDMETHOD.

  METHOD ValidateAmount.

    READ ENTITIES OF zov_r_db_gift IN LOCAL MODE
    ENTITY Gift
    FIELDS ( Amount )
    WITH CORRESPONDING #( keys )
    RESULT DATA(lt_gifts).

    LOOP AT lt_gifts INTO DATA(ls_gift).
      IF ls_gift-Amount <= 0.
        "Report error for invalid amount
        APPEND VALUE #( %tky = ls_gift-%tky ) TO failed-Gift.
        " Optionally, add a message to explain the failure
        APPEND VALUE #( %tky = ls_gift-%tky
                        %msg = new_message( id = 'ZOV_GIFT'
                                            number = '001'
                                            severity = if_abap_behv_message=>severity-error ) ) TO reported-Gift.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.


  METHOD AddPerson.

    DATA lt_new_person TYPE TABLE FOR CREATE zov_r_db_person.

    LOOP AT keys ASSIGNING FIELD-SYMBOL(<fs_key>).
      APPEND VALUE #(
                %cid = 'NEW_PERSON_CID' " A temporary Content ID for the framework
                FirstName    = <fs_key>-%param-FirstName
                LastName     = <fs_key>-%param-LastName
                Initials     = <fs_key>-%param-Initials
                City         = <fs_key>-%param-City
                %control = VALUE #(
                    FirstName    = if_abap_behv=>mk-on
                    LastName     = if_abap_behv=>mk-on
                    Initials     = if_abap_behv=>mk-on
                    City         = if_abap_behv=>mk-on ) ) TO lt_new_person.
    ENDLOOP.

    MODIFY ENTITIES OF zov_r_db_person
      ENTITY Person
        CREATE FROM lt_new_person
        MAPPED DATA(mapped_person)
        FAILED DATA(failed_person)
        REPORTED DATA(reported_person).

    " Inform the UI of success or failure
    IF failed_person IS NOT INITIAL.
      " Pass error messages back to the Gift UI
      reported = CORRESPONDING #( DEEP reported_person ).
    ELSE.
      " Optional: Send a success toast message back to the user
      APPEND VALUE #(
           %msg = new_message_with_text(
                    severity = if_abap_behv_message=>severity-success
                    text     = 'Person added successfully! You can now select them.' )
      ) TO reported-gift.
    ENDIF.

  ENDMETHOD.
ENDCLASS.
