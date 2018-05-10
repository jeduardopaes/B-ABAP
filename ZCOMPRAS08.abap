*&---------------------------------------------------------------------*
*& Report  ZCOMPRAS08_733
*&
*&---------------------------------------------------------------------*
*&
*&AUTOR: EDUARDO PAES
*&---------------------------------------------------------------------*

REPORT  zcompras08_733.
*--------------------------------------------------------------------*
* TABLES
*--------------------------------------------------------------------*
TABLES: ekko,
        ekpo.


*--------------------------------------------------------------------*
* type STRUCT
*--------------------------------------------------------------------*
TYPES: BEGIN OF ty_uniq,
          ebeln TYPE ekko-ebeln,
          bsart TYPE ekko-bsart,
          ebelp TYPE ekpo-ebelp,
          matnr TYPE ekpo-matnr,
       END OF ty_uniq.



*--------------------------------------------------------------------*
* WORKAREA
*--------------------------------------------------------------------*
DATA wa_uniq TYPE ty_uniq.

*--------------------------------------------------------------------*
* TABELA INTERNA
*--------------------------------------------------------------------*
DATA ti_uniq TYPE TABLE OF ty_uniq.

*--------------------------------------------------------------------*
* PRIEMRA TELA
*--------------------------------------------------------------------*
SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE t01.

SELECT-OPTIONS: s_ebeln FOR ekko-ebeln.

SELECTION-SCREEN END OF BLOCK b1.


*--------------------------------------------------------------------*
* SELECT DAS TABELAS
*--------------------------------------------------------------------*
SELECT  ko~ebeln ko~bsart po~ebelp po~matnr
  FROM
      ekko AS ko
  INNER JOIN
      ekpo AS po
  ON
    ko~ebeln = po~ebeln
  INTO TABLE ti_uniq
  WHERE ko~ebeln IN s_ebeln.

*--------------------------------------------------------------------*
*  CRIANDO IF PARA CHECAR ERROS E VERIFICAR SE PODE CONTINUAR RODANDO
*IF SY-SUBRC EQ 0.
*
*   PROCESSO DE DADOS
*
*ENDIF.
*--------------------------------------------------------------------*


*--------------------------------------------------------------------*
* ABRE A TELA DE DEGUB AO RODAR O CÓDIGO, NÃO COLOCAR EM PRODUÇÃO!!!
*                                         NÃO COLOCAR EM PRODUÇÃO!!!
*
*BREAK-POINT.
*
*--------------------------------------------------------------------*





*--------------------------------------------------------------------*
* EXIBIR RETLATÓRIO
*--------------------------------------------------------------------*

TOP-OF-PAGE.

* (001) É A CRIAÇÃO DE UM CAMPO DE TEXTO PARA PODER TRADUZIR A STRING PARA OUTRAS LINGUAS.

  WRITE:  'Relatório de compras.'(001),
          40 'Paginas:'(002),
          47 sy-pagno.

  ULINE.


*COLOR TOTAL É TIPO UM CSS
  LOOP AT ti_uniq INTO wa_uniq.

    WRITE: /  wa_uniq-ebeln COLOR COL_TOTAL, 
              wa_uniq-bsart,
              wa_uniq-ebelp,
              wa_uniq-matnr.

  ENDLOOP.
