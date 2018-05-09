*&---------------------------------------------------------------------*
*& Report  ZCLIENTES08_733
*&
*&---------------------------------------------------------------------*
*&DESCRIÇÃO: Relatório de clientes
*&AUTOR: EDUARDO PAES
*&---------------------------------------------------------------------*

REPORT  zclientes08_733.

*&---------------------------------------------------------------------*
*& TYPES
*&---------------------------------------------------------------------*

TYPES: BEGIN OF ty_clientes,

  codigo(5) TYPE c,
  nome(30) TYPE c ,

  END OF ty_clientes.

*&---------------------------------------------------------------------*
*& WORKAREA
*&---------------------------------------------------------------------*
DATA wa_clientes TYPE ty_clientes.

*&---------------------------------------------------------------------*
*& INTERNAL TABLE
*&---------------------------------------------------------------------*
DATA ti_clientes TYPE TABLE OF ty_clientes.


*&---------------------------------------------------------------------*
*& START OF SELECTION  --- EVENTO
*&---------------------------------------------------------------------*
START-OF-SELECTION.

* GRAVA NA TABELA INTERNA
  wa_clientes-codigo = '1'.
  wa_clientes-nome = 'JOÃO PAULO'.
  APPEND wa_clientes TO ti_clientes.

  wa_clientes-codigo = '2'.
  wa_clientes-nome = 'MARIA JOSÉ'.
  APPEND wa_clientes TO ti_clientes.

  wa_clientes-codigo = '3'.
  wa_clientes-nome = 'PEDRO PAULO'.
  APPEND wa_clientes TO ti_clientes.

* LEITURA DE DADOS DA TABELA INTERNA
  LOOP AT ti_clientes INTO wa_clientes.
    WRITE: / wa_clientes-codigo COLOR 1,
             wa_clientes-nome COLOR COL_TOTAL.
  ENDLOOP.
