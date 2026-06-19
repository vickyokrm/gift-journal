CLASS zov_test_vscode DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

    "! Returns a demo message.
    "! @parameter result | Message text
    METHODS get_message
      RETURNING
        VALUE(result) TYPE string.
ENDCLASS.

CLASS zov_test_vscode IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    out->write( get_message( ) ).
  ENDMETHOD.

  METHOD get_message.
    result = 'Hello from ZOV_TEST_VSCODE'.
  ENDMETHOD.
ENDCLASS.
