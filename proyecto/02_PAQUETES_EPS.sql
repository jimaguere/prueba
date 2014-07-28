ALTER SESSION SET NLS_LANGUAGE ='AMERICAN'
/
ALTER SESSION SET NLS_TERRITORY ='AMERICA'
/
SET SERVEROUTPUT ON SIZE UNLIMITED
/
spool LOG_02_PAQUETES_EPS.log
/

--VERSION FINAL 1.1.0		21/07/2014
CREATE OR REPLACE PACKAGE &&owner..pck_gador_malla_valida_datos
IS
   FUNCTION FN_GADOR_MALLA_VAL_CIA (id_factura        NUMBER,
                                    p_pln          IN VARCHAR2,
                                    r_fact         IN VARCHAR2,
                                    r_cias         IN NUMBER,
                                    r_meds         IN VARCHAR2,
                                    p_cia          IN VARCHAR2,
                                    c_sw_control      VARCHAR2)
      RETURN VARCHAR2;
   -->Rev

   FUNCTION FN_GADOR_MALLA_VALI_CDPRESTA (id_factura      NUMBER,
                                          p_pln           VARCHAR2,
                                          r_fact          VARCHAR2,
                                          r_cias          VARCHAR2,
                                          r_meds          VARCHAR2,
                                          r_fing          VARCHAR2,
                                          p_cuam          VARCHAR2,
                                          p_cia           VARCHAR2,
                                          p_frad          VARCHAR2,
                                          s_soci          VARCHAR2,
                                          c_sw_control    VARCHAR2)
      RETURN VARCHAR2;
    -->

   FUNCTION FN_GADOR_MALLA_VAL_PRESTA (id_factura      NUMBER,
                                       p_prestador     VARCHAR2,
                                       r_meds          VARCHAR2,
                                       p_pln           VARCHAR2,
                                       r_fact          VARCHAR2,
                                       r_cias          VARCHAR2,
                                       c_sw_control    VARCHAR2)
      RETURN VARCHAR2;

   FUNCTION FN_GADOR_MALLA_NFACT (id_factura      NUMBER,
                                  s_soci          VARCHAR2,
                                  r_meds          VARCHAR2,
                                  p_pln           VARCHAR2,
                                  r_fact          VARCHAR2,
                                  r_cias          VARCHAR2,
                                  c_sw_control    VARCHAR2)
      RETURN VARCHAR2;

   FUNCTION FN_GADOR_MALLA_VAL_VALORFAC (id_factura      NUMBER,
                                         r_vlor          NUMBER,
                                         s_soci          VARCHAR2,
                                         r_meds          VARCHAR2,
                                         p_pln           VARCHAR2,
                                         r_fact          VARCHAR2,
                                         r_cias          VARCHAR2,
                                         c_sw_control    VARCHAR2)
      RETURN VARCHAR2;
    -->Rev

   FUNCTION FN_GADOR_MALLA_CTA_MODER (id_factura      NUMBER,
                                      r_VlrCuoMod     NUMBER,
                                      s_soci          VARCHAR2,
                                      r_meds          VARCHAR2,
                                      p_pln           VARCHAR2,
                                      r_fact          VARCHAR2,
                                      r_cias          VARCHAR2,
                                      c_sw_control    VARCHAR2) --,sw_control number)
      RETURN VARCHAR2;


   FUNCTION FN_GADOR_MALLA_VLR_REC_CO (id_factura      NUMBER,
                                       r_VlrCopag      NUMBER,
                                       s_soci          VARCHAR2,
                                       r_meds          VARCHAR2,
                                       p_pln           VARCHAR2,
                                       r_fact          VARCHAR2,
                                       r_cias          VARCHAR2,
                                       c_sw_control    VARCHAR2) --,sw_control number)
      RETURN VARCHAR2;

   FUNCTION FN_GADOR_MALLA_VLR_REC_PMC (id_factura      NUMBER,
                                        r_VlrPerMin     NUMBER,
                                        s_soci          VARCHAR2,
                                        r_meds          VARCHAR2,
                                        p_pln           VARCHAR2,
                                        r_fact          VARCHAR2,
                                        r_cias          VARCHAR2,
                                        c_sw_control    VARCHAR2) --,sw_control number)
      RETURN VARCHAR2;

   FUNCTION FN_GADOR_MALLA_FEC_ING (id_factura      NUMBER,
                                    r_fing          VARCHAR2,
                                    s_soci          VARCHAR2,
                                    r_meds          VARCHAR2,
                                    p_pln           VARCHAR2,
                                    r_fact          VARCHAR2,
                                    r_cias          VARCHAR2,
                                    c_sw_control    VARCHAR2) --,sw_control number)
      RETURN VARCHAR2;

   FUNCTION FN_GADOR_MALLA_FEC_SAL (id_factura      NUMBER,
                                    r_fing          VARCHAR2,
                                    r_fsal          VARCHAR2,
                                    r_meds          VARCHAR2,
                                    p_pln           VARCHAR2,
                                    r_fact          VARCHAR2,
                                    c_sw_control    VARCHAR2)
      RETURN VARCHAR2;

   FUNCTION FN_GADOR_MALLA_NRO_SOL (id_factura      NUMBER,
                                    r_nsol          VARCHAR2,
                                    r_meds          VARCHAR2,
                                    p_pln           VARCHAR2,
                                    r_fact          VARCHAR2,
                                    c_sw_control    VARCHAR2,
									p_fechaprestserv Varchar2 --23/05/2014 JaFarias
									)
      RETURN VARCHAR2;

   FUNCTION FN_GADOR_MALLA_FEC_FACT (id_factura      NUMBER,
                                     r_ffac          VARCHAR2,
                                     r_nsol          VARCHAR2,
                                     r_meds          VARCHAR2,
                                     p_pln           VARCHAR2,
                                     r_fact          VARCHAR2,
                                     c_sw_control    VARCHAR2)
      RETURN VARCHAR2;
  PROCEDURE pr_gador_malla_grab_inci(p_id_factura      IN number,
                                      p_id_incidencia   IN number,
                                      p_nom_archivo     IN varchar2,
                                      p_campo           IN varchar2,
                                      p_cod_error       IN varchar2,
                                      p_contenido_campo IN varchar2,
                                      p_nro_factura     IN varchar2,
                                      p_ctrl_cambio     IN varchar2,
                                      p_desc_error      IN varchar2,
                                      p_objeto          IN varchar2);

  PROCEDURE pr_gador_malla_val_inci(p_id_factura      IN number,
                                    p_nom_archivo     IN varchar2,
                                    p_campo           IN varchar2,
                                    p_cod_error       IN varchar2,
                                    p_nro_factura     IN varchar2
                                    );
  --> CU 8 IMPUESTO
PROCEDURE pr_gador_malla_val_conc (p_porc         IN OUT NUMBER,
                                    p_tipoCon     IN OUT VARCHAR2,
                                    id_factura    IN NUMBER,    --id factura
                                    p_pln          IN VARCHAR2,  --nombre archivo
                                    r_fact        IN VARCHAR2,  --Numero de Factura
                                    p_cia          IN VARCHAR2,  --compañia
                                    i_impu        IN VARCHAR2,  --codigo concepto
                                    c_sw_control  IN VARCHAR2);

FUNCTION fn_gador_malla_val_valb (  id_factura    NUMBER,    --id factura
                p_pln      VARCHAR2,  --nombre archivo
                r_fact      VARCHAR2,  --Numero de Factura
                i_vlor      VARCHAR2,  --Valor base retención
                p_tipoCon    VARCHAR2,  --concepto (retorno campo 2)
                c_sw_control  VARCHAR2)
                 RETURN VARCHAR2;
  --> CU 9 SOCIEDADES

FUNCTION fn_gador_malla_val_prests (id_factura    NUMBER,    --id factura
                  p_pln          VARCHAR2,  --nombre archivo
                  r_fact        VARCHAR2,  --Numero de Factura
                  s_soci        VARCHAR2,  --Código de prestador socio
                  p_cia          VARCHAR2,  --Compania
                  r_meds        VARCHAR2,  --Codigo Prestador
                  p_frad        VARCHAR2, --Fecha Radicacion (Fecha Ingreso?)
                  p_cuam        varchar2, --cuadro medico
                  r_fing        varchar2, --Fecha Ingreso
                  c_sw_control  VARCHAR2) RETURN VARCHAR2;

FUNCTION fn_gador_malla_val_thonor(  id_factura    NUMBER,    --id factura
                p_pln      VARCHAR2,  --nombre archivo
                r_fact      VARCHAR2,  --Numero de Factura
                s_hono      VARCHAR2,  --Tipo de honorario
                r_meds      VARCHAR2,  --Codigo Prestador
                s_soci      VARCHAR2,  --Código de prestador socio
                c_sw_control  VARCHAR2)
                 RETURN VARCHAR2;

FUNCTION fn_gador_malla_val_vfacso(  id_factura    NUMBER,    --id factura
                p_pln      VARCHAR2,  --nombre archivo
                r_fact      VARCHAR2,  --Numero de Factura
                s_vlor      VARCHAR2,  --Valor facturado socio
                c_sw_control  VARCHAR2)
                 RETURN VARCHAR2;
   -->Tipo Detalle
   FUNCTION fn_gador_malla_fec_doc_sop (id_factura        NUMBER    --id_factura
                                        ,d_fec_doc_sop    VARCHAR2  --fecha documento soporte
                                        ,r_fing           VARCHAR2  --fecha ingreso
                                        ,r_fsal           VARCHAR2  --fecha salida
                                        ,p_pln            VARCHAR2  --nombre archivo
                                        ,r_fact           VARCHAR2  --numero de factura
                                        ,c_sw_control     VARCHAR2)
      RETURN VARCHAR2;

   FUNCTION VALFE(p_pln            VARCHAR2  --nombre archivo
                 ,r_fact          VARCHAR2  --numero de factura
                 ,fecha          VARCHAR2
                 ,fechV           VARCHAR2
                 ,validar         NUMBER)
  RETURN NUMBER ;

   PROCEDURE pr_gador_malla_tip_doc_sop (id_factura    IN       NUMBER       --id_factura
                                        ,d_tip_doc_sop  IN OUT   VARCHAR2     --tipo documento_soporte
                                        ,p_pln          IN       VARCHAR2     --nombre archivo
                                        ,r_fact         IN       VARCHAR2     --numero de factura
                                        ,p_cdramo       OUT      VARCHAR2     --Retorna CDRAMO
                                        ,p_nmpoliza     OUT      VARCHAR2     --Retorna NMPOLIZA
                                        ,r_meds      IN    VARCHAR2    --Codigo Prestador
                                        ,s_inci      OUT    VARCHAR2  --incidencia
                                        ,c_sw_control   IN       VARCHAR2
                                        ,p_cuam        In      Varchar2 --(JaFarias) Nueva validación Honorario-Tipo Servicio y Clase 22/05/2014
                                        ,p_nsolvol     In      Number --(JaFarias) Nueva validación Honorario-Tipo Servicio y Clase 22/05/2014
                                        ,p_cia         in      Varchar2         --(JaFarias) Nueva validación Honorario-Tipo Servicio y Clase 22/05/2014
                                        ,s_hono        In Varchar2          --(JaFarias) Nueva validación Honorario-Tipo Servicio y Clase 22/05/2014
                                        );

   PROCEDURE fn_gador_malla_nro_doc_sop (id_factura      IN    NUMBER    --id factura
                                        ,d_nro_doc_sop   IN   VARCHAR2  --número documento de soporte
                                        ,d_tip_doc_sop   IN   VARCHAR2  --tipo documento de soporte
                                        ,r_cias          IN   VARCHAR2  --unidad económica
                                        ,d_plan          IN   VARCHAR2  --plan
                                        ,d_contrato      IN   VARCHAR2  --contrato
                                        ,d_familia       IN   VARCHAR2  --familia
                                        ,p_pln           IN   VARCHAR2  --nombre archivo
                                        ,r_fact          IN   VARCHAR2  --número factura
                    ,s_inci       OUT   VARCHAR2  --incidencia
                    ,v_pln       OUT  NUMBER  --CDRAMO de la tabla mvalesop
                    ,v_cto       OUT   NUMBER  --NMPOLIZA de la tabla mvalesop
                                        ,c_sw_control    IN    VARCHAR2);

   FUNCTION fn_gador_malla_sec_doc_sop (id_factura        NUMBER    --id factura
                                        ,d_sec_doc_sop    VARCHAR2  --secuencia documento soporte
                                        ,p_pln            VARCHAR2  --nombre archivo
                                        ,r_fact           VARCHAR2  --numero factura
                                        ,c_sw_control     VARCHAR2)
      RETURN VARCHAR2;

   FUNCTION fn_gador_malla_plan (id_factura       NUMBER    --id factura
                                 ,d_plan          VARCHAR2  --plan
                                 ,p_cia           VARCHAR2  --compañia
                                 ,d_contrato      VARCHAR2  --contrato
                                 ,d_familia       VARCHAR2  --familia
                                 ,d_usuario       VARCHAR2  --usuario
                                 ,p_pln           VARCHAR2  --nombre archivo
                                 ,r_fact          VARCHAR2  --numero factura
                                 ,c_sw_control    VARCHAR2)
      RETURN VARCHAR2;

   FUNCTION fn_gador_malla_contrato (id_factura        NUMBER   --id factura
                                     ,d_contrato       VARCHAR2 --contrato
                                     ,d_plan           VARCHAR2 --plan
                                     ,p_cia            VARCHAR2 --compañía
                                     ,d_fec_doc_sop    VARCHAR2 --fecha documento soporte
                                     ,d_tip_doc_sop    VARCHAR2 --tipo documento soporte
                                     ,p_pln            VARCHAR2 --nombre archivo
                                     ,r_fact           VARCHAR2 --número factura
                                     ,p_cdramo         VARCHAR2 --cdramo de MVALESOP (Validación campo 3)
                                     ,p_nmpoliza       VARCHAR2 --nmpoliza de MVALESOP  (Validación campo 3)
                                     ,c_sw_control     VARCHAR2)
      RETURN VARCHAR2;

   PROCEDURE pr_gador_malla_usuario (id_factura       IN      NUMBER     --id factura
                                    ,d_usuario        IN     VARCHAR2   --usuario/devolver incidencia
                                    ,d_contrato       IN      VARCHAR2   --contrato
                                    ,d_plan           IN      VARCHAR2   --plan
                                    ,p_cia            IN      VARCHAR2   --compañía
                                    ,d_familia        IN      VARCHAR2   --familia
                                    ,d_fec_doc_sop    IN      VARCHAR2   --fecha documento de soporte
                                    ,p_cuam           IN      VARCHAR2   --cuadro médico
                                    ,p_pln            IN      VARCHAR2   --nombre archivo
                                    ,r_fact           IN      VARCHAR2   --número factura
                                    ,p_cua_ser        OUT     VARCHAR2   --retornar v_ct3_cua_ser (cuadro de servicios)
                  ,s_inci         OUT    VARCHAR2   -- incidencia
                                    ,c_sw_control     IN      VARCHAR2);

   FUNCTION fn_gador_malla_tipo_id (id_factura       NUMBER     --id factura
                                    ,d_tipo_id       VARCHAR2   --tipo identificación
                                    ,p_pln           VARCHAR2   --nombre archivo
                                    ,r_fact          VARCHAR2   --número factura
                                    ,c_sw_control    VARCHAR2)
      RETURN VARCHAR2;

   FUNCTION fn_gador_malla_nro_id (id_factura       NUMBER      --id factura
                                   ,d_nro_id        VARCHAR2    --número identificación
                                   ,d_tipo_id       VARCHAR2    --tipo identificación
                                   ,d_contrato      VARCHAR2    --contrato
                                   ,d_plan          VARCHAR2    --plan
                                   ,p_cia           VARCHAR2    --compañía
                                   ,d_familia       VARCHAR2    --familia
                                   ,d_usuario       VARCHAR2    --usuario
                                   ,p_pln           VARCHAR2    --nombre archivo
                                   ,r_fact          VARCHAR2    --número factura
                                   ,c_sw_control    VARCHAR2)
      RETURN VARCHAR2;

   FUNCTION fn_gador_malla_lugar_prest (id_factura        NUMBER    --id factura
                                        ,d_lugar_prest    VARCHAR2  --lugar prestación/Retornar incidencia
                                        ,p_pln            VARCHAR2  --nombre archivo
                                        ,r_fact           VARCHAR2  --número factura
                                        ,r_meds           VARCHAR2  --código prestador
                                        ,c_sw_control     VARCHAR2)
      RETURN VARCHAR2;

   PROCEDURE pr_gador_malla_cod_man_tar (id_factura       IN       NUMBER     --id factura
                                        ,d_cod_man_tarifa IN       VARCHAR2   --código manual tarifario ó catálogo de codificación
                                        ,p_cia            IN       VARCHAR2   --compañía
                                        ,r_meds           IN       VARCHAR2   --código prestador
                                        ,d_fec_doc_sop    IN       VARCHAR2   --fecha documento de soporte
                                        ,p_pln            IN       VARCHAR2   --nombre archivo
                                        ,r_fact           IN       VARCHAR2   --número factura
                                        ,p_cdalias        OUT      VARCHAR2   --retorna código alias
                                        ,s_inci            OUT       VARCHAR2   --incidencia
                                        ,d_lugar_prest    IN       VARCHAR2   --lugar prestación
                                        ,c_sw_control     IN       VARCHAR2);

  PROCEDURE pr_gador_malla_cod_ser_pres (id_factura           IN      NUMBER      --id factura
                                         ,d_cod_ser_prestado  IN OUT  VARCHAR2    --código servicio/Retornar incidencia
                                         ,d_cod_man_tarifa    IN      VARCHAR2    --código manual tarifario
                                         ,p_cia               IN      VARCHAR2    --compañía
                                         ,r_meds              IN      VARCHAR2    --código prestador
                                         ,p_pln               IN      VARCHAR2    --nombre archivo
                                         ,r_fact              IN      VARCHAR2    --número factura
                                         ,p_cua_ser           IN      VARCHAR2    --cuadro de servicios (campo trabajo 3)
                                         ,d_lugar_prest       IN      VARCHAR2    --lugar de prestación del servicio
                                         ,r_nsol              IN      VARCHAR2    --Número de solicitud del volante
                                         ,p_cdalias           IN      VARCHAR2    --Código alias (Validación campo 13)
                                         ,p_cod_alea          OUT     VARCHAR2    --Retornar campo de trabajo 5 v_ct5_cod_alea
                                         ,p_niv_aut           OUT     VARCHAR2    --Retornar campo de trabajo 8 v_ct8_niv_aut
                                         ,s_inci         OUT     VARCHAR2   -- incidencia
                                         ,c_sw_control        IN      VARCHAR2
                                         ,p_fdoc              IN      VARCHAR2);  -- Fecha de prestacion de servicio

   FUNCTION fn_gador_malla_cant_serv (id_factura          NUMBER    --id factura
                                      ,d_cant_servicio    IN OUT VARCHAR2    --cantidad servicio
                                      ,d_fec_doc_sop      VARCHAR2  --fecha documento soporte
                                      ,p_pln              VARCHAR2  --nombre archivo
                                      ,r_fact             VARCHAR2  --número factura
                                      ,c_sw_control       VARCHAR2)
      RETURN VARCHAR2;

   FUNCTION fn_gador_malla_recargo (id_factura        NUMBER      --id factura
                                    ,d_recargo        VARCHAR2    --recargo
                                    ,d_fec_doc_sop    VARCHAR2    --fecha documento soporte
                                    ,p_pln            VARCHAR2    --nombre archivo
                                    ,r_fact           VARCHAR2    --número factura
                                    ,c_sw_control     VARCHAR2)
      RETURN VARCHAR2;

   FUNCTION fn_gador_malla_pres_ordena (id_factura             NUMBER     --id factura
                                        ,d_prestador_ordena    VARCHAR2   --prestador ordena
                                        ,p_cia                 VARCHAR2   --compañía
                                        ,p_cuam                VARCHAR2   --cuadro médico
                                        ,p_pln                 VARCHAR2   --nombre archivo
                                        ,r_fact                VARCHAR2   --número factura
                                        ,c_sw_control          VARCHAR2)
      RETURN VARCHAR2;

   FUNCTION fn_gador_malla_valor_servicio (id_factura           NUMBER    --id factura
                                           ,d_valor_servicio    VARCHAR2    --valor servicio
                                           ,p_cia               VARCHAR2  --compañía
                                           ,r_meds              VARCHAR2  --código prestador
                                           ,p_cuam              VARCHAR2  --cuadro medico
                                           ,d_cod_ser_prestado  VARCHAR2  --código del servicio
                                           ,d_lugar_prest       VARCHAR2      --lugar prestación
                                           ,d_fec_doc_sop       VARCHAR2  --fecha documento soporte
                                           ,d_cant_servicio     VARCHAR2 --cantida de servicio
                                           ,d_recargo           VARCHAR2      --recargo
                                           ,s_soci              VARCHAR2  --codigo prestador socio
                                           ,p_pln               VARCHAR2  --nombre archivo
                                           ,r_fact              VARCHAR2  --número factura
                                           ,p_cod_alea          VARCHAR2  --código alea (variable trabajo 5 - v_ct5_cod_alea)
                                           ,c_sw_control        VARCHAR2)
      RETURN VARCHAR2;

   FUNCTION fn_gador_malla_nro_solicitud (id_factura          NUMBER    --id factura
                                          ,d_nro_solicitud    VARCHAR2    --número solicitud
                                          ,p_pln              VARCHAR2  --nombre archivo
                                          ,r_fact             VARCHAR2  --número factura
                                          ,p_niv_aut          VARCHAR2  --nivel autorización campo trabajo 8 v_ct8_niv_aut
                                          ,d_fec_doc_sop      VARCHAR2  --Fecha documento de soporte
                                          ,r_meds             VARCHAR2  --código del prestador
                                          ,c_sw_control       VARCHAR2
										  ,p_ramo             Number    --JaFarias 23/05/2014
                                          ,p_cto              Number    --JaFarias 23/05/2014
                                          ,p_fam              Number    --JaFarias 23/05/2014
                                          ,p_usu              Number    --JaFarias 23/05/2014

										  )
      RETURN VARCHAR2;

   FUNCTION fn_gador_malla_nro_sesiones (id_factura          NUMBER   --id factura
                                         ,d_nro_sesiones     VARCHAR2 --número de sesiones
                                         ,d_nro_solicitud    VARCHAR2 --número de solicitud
                                         ,d_lugar_prest      VARCHAR2 --lugar prestación
                                         ,p_pln              VARCHAR2 --nombre archivo
                                         ,r_fact             VARCHAR2 --número fatura
                                         ,c_sw_control       VARCHAR2)
      RETURN VARCHAR2;

   FUNCTION fn_gador_malla_dias_estancia (id_factura             NUMBER   --id factura
                                        ,d_cod_ser_prestado    VARCHAR2   --código servicio prestado
                                        ,d_nro_solicitud       VARCHAR2   --número de solicitud
                                        ,d_lugar_prest         VARCHAR2     --lugar prestación
                                        ,d_nro_sesiones        VARCHAR2   --NUmero de sesiones
                                        ,p_pln                 VARCHAR2 --nombre archivo
                                        ,r_fact                VARCHAR2 --número factura
                                        ,r_meds             VARCHAR2  --código del prestador
                                        ,c_sw_control          VARCHAR2)
    RETURN VARCHAR2;

   -->Tipo Totales
   FUNCTION fn_gador_malla_nro_reg_s (id_factura       NUMBER   --id factura
                                      ,t_nro_reg_s     NUMBER   --número de registros tipo S
                                      ,p_pln           VARCHAR2 --nombre archivo
                                      ,r_fact          VARCHAR2 --número factura
                                      ,c_sw_control    VARCHAR2)
      RETURN VARCHAR2;

   FUNCTION fn_gador_malla_nro_reg_d (id_factura       NUMBER   --id factura
                                      ,t_nro_reg_d     VARCHAR2 --numero de registros tipo D
                                      ,p_pln           VARCHAR2 --nombre archivo
                                      ,r_fact          VARCHAR2 --número factura
                    ,v_num_reg_det  NUMBER  --Numero de registros en la factura - D
                                      ,c_sw_control    VARCHAR2)
      RETURN VARCHAR2;

    FUNCTION fn_gador_malla_sum_reg_d (id_factura      NUMBER   --id factura
                                      ,t_sum_reg_d     VARCHAR2 --suma de registros tipo D
                                      ,r_vlor          VARCHAR2 --valor total factura
                                      ,p_pln           VARCHAR2 --nombre archivo
                                      ,r_fact          VARCHAR2 --número factura
                                      ,c_sw_control    VARCHAR2)
      RETURN VARCHAR2;

    PROCEDURE pr_graba_error_plano(p_nom_archivo IN varchar2,
                                   p_ora_error      IN varchar2,
                                   p_error  IN varchar2,
                                   p_num_factura IN varchar2);
   sw_control   NUMBER (1);
   v_cias       NUMBER (3) := 0;
   v_meds       VARCHAR2 (15);
   w_cias       NUMBER (1) := 0;
   s_cias       VARCHAR2 (5);
   s_meds       VARCHAR2 (5);
   s_noj        NUMBER (1) := 0;
   w_cdperson   NUMBER (9);
   w_seq        NUMBER (30) := 0;
   w_inci       NUMBER (10) := 0;

   s_inci       VARCHAR2 (10);
   s_campoVal   VARCHAR2 (50);
   s_campo      VARCHAR2 (30);
   s_objeto     VARCHAR2 (100);
   s_error      VARCHAR2 (500);
   --
   s_oraError   VARCHAR2(2000);

--Guarda descripcion del error cuando se genera en la db


END pck_gador_malla_valida_datos;
/

CREATE OR REPLACE PACKAGE BODY &owner..pck_gador_malla_valida_datos
IS
   /* ************************************************************** */
   /* FUNCIONES MALLA DE VALIDACION                                  */
   /* ************************************************************** */


   -- Versión    Autor            Fecha       Comentario
   -- 1.0.000  Viviana Hurtado   13/09/2013   Creación - Procedimiento encargado de realizar las validaciones del campo 2 (Unidad Económica) del archivo
   FUNCTION fn_gador_malla_val_cia (id_factura      NUMBER,
                                    p_pln           VARCHAR2,
                                    r_fact          VARCHAR2,
                                    r_cias          NUMBER,
                                    r_meds          VARCHAR2,
                                    p_cia           VARCHAR2,
                                    c_sw_control    VARCHAR2) --, sw_control number)
      RETURN VARCHAR2
   IS
      v_cias       NUMBER (3) := 0;
      v_meds       VARCHAR2 (15);
      s_meds       VARCHAR2(15);
      w_cias       NUMBER (1) := 0;
      s_cias       VARCHAR2 (5);
      sw_control   NUMBER;
      w_seq        NUMBER (30) := 0;
      w_inci       NUMBER (10) := 1;
   BEGIN
      v_cias := TO_NUMBER (r_cias);
      v_meds := RTRIM (r_meds, ' ');
      s_meds := RTRIM (r_meds, ' ');

      s_inci :='OK';
      s_campoVal:='UNIDAD ECONOMICA';
      s_campo:='UNIDAD_ECONOMICA';
      s_objeto:='pck_gador_malla_valida_datos.fn_gador_malla_val_cia';

      -- valida el campo v_cias
      -->El campo 2 (Unidad Económica), debe ser igual al dato de entrada 15 (Compañía).
      /*SELECT COUNT (1)
        INTO w_cias
        FROM TUNIDECO T
       WHERE T.CDUNIECO = v_cias;*/

      -->Compañia de entrada diferente a compañi del plano
      IF to_number(p_cia) <> to_number(r_cias) --w_cias = 0
      THEN
        s_inci:='R0201';
        s_error:='Compañía del plano no corresponde con la ingresada por pantalla';
        w_inci:= 1;
        pr_gador_malla_grab_inci(id_factura,
                                  w_inci,
                                  p_pln,
                                  s_campo,
                                  s_inci,
                                  r_cias,
                                  r_fact,
                                  c_sw_control,
                                  s_error,
                                  s_objeto);
      ELSE
        -->Cambiar estado de incidencia registrada por este el mismo motivo
        s_inci:='R0201';
        pr_gador_malla_val_inci(id_factura,
                                p_pln,
                                s_campo,
                                s_inci,
                                r_fact
                                );
      END IF;
      RETURN s_inci;
   EXCEPTION
   WHEN OTHERS THEN
     s_oraError := SQLERRM;
     pr_graba_error_plano(p_pln,
                         s_oraError,
                         'valida_datos.fn_gador_malla_val_cia',
                         r_fact);
     RETURN s_inci;
   END;

   -- Versión    Autor            Fecha       Comentario
   -- 1.0.000  Viviana Hurtado   13/09/2013   Creación - Procedimiento encargado de realizar las validaciones del campo 3 (Código de prestador) del archivo
   FUNCTION fn_gador_malla_vali_cdpresta (id_factura      NUMBER,
                                          p_pln           VARCHAR2,
                                          r_fact          VARCHAR2,
                                          r_cias          VARCHAR2,
                                          r_meds          VARCHAR2,
                                          r_fing          VARCHAR2,
                                          p_cuam          VARCHAR2,
                                          p_cia           VARCHAR2,
                                          p_frad          VARCHAR2,
                                          s_soci          VARCHAR2,
                                          c_sw_control    VARCHAR2) --,s_meds varchar2)
      RETURN VARCHAR2
   IS
      p_tipocobr   VARCHAR2 (1);

      v_cias       NUMBER (5);
      v_meds       VARCHAR2 (15);
      v_frad       DATE;

      v_cdgo       VARCHAR2 (9);
      w_vig        NUMBER (1);
      w_ccia       NUMBER (3) := 0;
      w_cdperson   NUMBER (9) := 0;
      w_ciu        NUMBER (5) := 0;
      w_cdalias    VARCHAR2 (5);
      v_est        VARCHAR2 (1);
      w_ads        VARCHAR2 (7);
      w_cob        VARCHAR2 (1);
      w_vto        VARCHAR2 (40);
      w_cesp       VARCHAR2 (5);

      w_cdgo       VARCHAR2 (9);
      sw_control   NUMBER (1) := 0;

      s_existe     VARCHAR2 (1);
      s_meds       VARCHAR2 (5);
      s_noj        NUMBER (1);
      w_inci       NUMBER (10) := 1;
   -- variable de salida retorno

   BEGIN
      s_inci :='OK';
      s_campoVal:='CODIGO PRESTADOR';
      s_campo:='CODIGO_PRESTADOR';
      s_objeto:='pck_gador_malla_valida_datos.fn_gador_malla_vali_cdpresta';

      v_cias := TO_NUMBER (r_cias);
      v_meds := RTRIM(r_meds, ' ');

      v_frad := TO_DATE(p_frad, 'dd-mm-yyyy');

      -- validar que el codigo del prestador sea valido
      -->Validar que el codigo de prestador esté activo

      -->Rev
      Frecep_Ga.Ver_Vign (v_meds, w_vig);
      IF w_vig = 0
      THEN
         s_inci := 'R0301';
         --sw_control := 1;
         s_error:='Prestador inactivo';
         w_inci:= 1;
         pr_gador_malla_grab_inci(id_factura,
                                    w_inci,
                                    p_pln,
                                    s_campo,
                                    s_inci,
                                    r_meds,
                                    r_fact,
                                    c_sw_control,
                                    s_error,
                                    s_objeto);

      ELSE
        -->Cambiar estado de incidencia registrada por este el mismo motivo
        s_inci := 'R0301';
        pr_gador_malla_val_inci(id_factura,
                                p_pln,
                                s_campo,
                                s_inci,
                                r_fact
                                );
      END IF;

      --  valida que pertenece a un centro de costo
      --  S_MEDS := r_MEDS;
      -->Rev
      Frecep_Ga.Ver_Cads (v_meds, w_ciu);
      IF w_ciu = '00000'
      THEN
        s_inci := 'R0302';
        sw_control := 1;
        s_error:='Oficina de prestador incorrecta';
        w_inci:= 1;
        pr_gador_malla_grab_inci(id_factura,
                                  w_inci,
                                  p_pln,
                                  s_campo,
                                  s_inci,
                                  r_meds,
                                  r_fact,
                                  c_sw_control,
                                  s_error,
                                  s_objeto);
      ELSE
        -->Cambiar estado de incidencia registrada por este el mismo motivo
        s_inci := 'R0302';
        pr_gador_malla_val_inci(id_factura,
                                p_pln,
                                s_campo,
                                s_inci,
                                r_fact
                                );
      END IF;

      -->Rev
      -- valida si el prestador esta inscrito a la cia
      Frecep_Ga.Ver_Tuni (r_cias, v_meds, w_ccia);
      IF w_ccia = 99
      THEN
        s_inci := 'R0303';
        --sw_control := 1;
        s_error:='Prestador no adscrito a compañía';
        w_inci:= 1;
        pr_gador_malla_grab_inci(id_factura,
                                  w_inci,
                                  p_pln,
                                  s_campo,
                                  s_inci,
                                  p_cia,
                                  r_fact,
                                  c_sw_control,
                                  s_error,
                                  s_objeto);
      ELSE
        -->Cambiar estado de incidencia registrada por este el mismo motivo
        s_inci := 'R0303';
        pr_gador_malla_val_inci(id_factura,
                                p_pln,
                                s_campo,
                                s_inci,
                                r_fact
                                );
      END IF;



      -- Busca el codigo del manual tarifario para el prestador
      pck_epsga_grb.ali_pres (r_cias,
                              v_meds,
                              w_cdalias,
                              r_fing);
      --  validacion cdpresta con el   estado = A

      Frecep_Ga.Ver_Mcua (r_cias,
                         p_cuam,
                         v_meds,
                         v_est);

      IF v_est != 'A'
      THEN
        s_inci := 'R0304';
        --sw_control := 1;
        s_error:='Prestador inactivo para cuadro médico';
        --w_inci:= 1;
        pr_gador_malla_grab_inci(id_factura,
                                  w_inci,
                                  p_pln,
                                  s_campo,
                                  s_inci,
                                  r_meds,
                                  r_fact,
                                  c_sw_control,
                                  s_error,
                                  s_objeto);
      ELSE
        -->Cambiar estado de incidencia registrada por este el mismo motivo
        s_inci := 'R0304';
        pr_gador_malla_val_inci(id_factura,
                                p_pln,
                                s_campo,
                                s_inci,
                                r_fact
                                );
      END IF;


      -- Valida tipo de cobro
      Frecep_Ga.Ver_Cobr (v_meds,
                         to_number(r_cias),
                         p_cuam,
                         w_ads,
                         w_cob);

      IF w_cob NOT IN ('A', 'E', 'C')
      THEN
        s_inci := 'R0305';
        sw_control := 1;
        s_error:='Tipo de cobro asociado no es correcto';
        w_inci:= 1;
        pr_gador_malla_grab_inci(id_factura,
                                  w_inci,
                                  p_pln,
                                  s_campo,
                                  s_inci,
                                  r_meds,
                                  r_fact,
                                  c_sw_control,
                                  s_error,
                                  s_objeto);
      ELSE
        -->Cambiar estado de incidencia registrada por este el mismo motivo
        s_inci := 'R0305';
        pr_gador_malla_val_inci(id_factura,
                                p_pln,
                                s_campo,
                                s_inci,
                                r_fact
                                );
      END IF;
      -- TIPO DE COBRO 'C'
      IF w_cob = 'C'
      THEN
        s_inci := 'R0306';
        sw_control := 1;
        s_error:='Prestador cobra por capitación';
        w_inci:= 1;
        pr_gador_malla_grab_inci(id_factura,
                                  w_inci,
                                  p_pln,
                                  s_campo,
                                  s_inci,
                                  r_meds,
                                  r_fact,
                                  c_sw_control,
                                  s_error,
                                  s_objeto);
      ELSE
        -->Cambiar estado de incidencia registrada por este el mismo motivo
        s_inci := 'R0306';
        pr_gador_malla_val_inci(id_factura,
                                p_pln,
                                s_campo,
                                s_inci,
                                r_fact
                                );
      END IF;
      -- valida q cdpresta tenga informacion en el atributo 7
      Frecep_Ga.Ver_Dvto (V_Meds, W_Vto);
      IF w_vto <= 0
      THEN
        s_inci := 'R0307';
        sw_control := 1;
        s_error:='Número de días para pago es incorrecto';
        w_inci:= 1;
        pr_gador_malla_grab_inci(id_factura,
                                  w_inci,
                                  p_pln,
                                  s_campo,
                                  s_inci,
                                  r_meds,
                                  r_fact,
                                  c_sw_control,
                                  s_error,
                                  s_objeto);
      ELSE
        -->Cambiar estado de incidencia registrada por este el mismo motivo
        s_inci := 'R0307';
        pr_gador_malla_val_inci(id_factura,
                                p_pln,
                                s_campo,
                                s_inci,
                                r_fact
                                );
      END IF;                                           --- SI NO HAY ERROR

      -->Rev
      -- valida q cdpresta tenga informacion en el atributo 10
      Frecep_Ga.Ver_Norj (r_meds, s_noj);
      IF s_noj = 0
      THEN
        s_inci := 'R0308';
        sw_control := 1;
        s_error:='Figura jurídica de prestador no es válida';
        w_inci:= 1;
        pr_gador_malla_grab_inci(id_factura,
                                  w_inci,
                                  p_pln,
                                  s_campo,
                                  s_inci,
                                  r_meds,
                                  r_fact,
                                  c_sw_control,
                                  s_error,
                                  s_objeto);
      ELSE
        -->Cambiar estado de incidencia registrada por este el mismo motivo
        s_inci := 'R0308';
        pr_gador_malla_val_inci(id_factura,
                                p_pln,
                                s_campo,
                                s_inci,
                                r_fact
                                );
      END IF;
      --  se valida el codigo tarifario para los prestadores de infraestructura
      pck_epsga_grb.ali_pres (r_cias,
                              r_meds,
                              w_cdalias,
                              r_fing);

      -- validacion de la especialidad
      pck_epsga_grb.dat_espe (s_soci, w_cesp);
      IF w_cesp = '99QQQ'
      THEN
        s_inci := 'R0309';
        sw_control := 1;
        s_error:='Prestador no tiene especialidad parametrizada';
        w_inci:= 1;
        pr_gador_malla_grab_inci(id_factura,
                                  w_inci,
                                  p_pln,
                                  s_campo,
                                  s_inci,
                                  r_meds,
                                  r_fact,
                                  c_sw_control,
                                  s_error,
                                  s_objeto);
      ELSE
        -->Cambiar estado de incidencia registrada por este el mismo motivo
        s_inci := 'R0309';
        pr_gador_malla_val_inci(id_factura,
                                p_pln,
                                s_campo,
                                s_inci,
                                r_fact
                                );
      END IF;
      -- Validacion condicion de pago
      s_existe := 'N';
      BEGIN
       SELECT 'S'
        INTO   s_existe
        FROM   Geps_Tb_Mcpagpre
        WHERE  Cdunieco = to_number(v_cias)
        AND    Cdcuamed = p_cuam
        AND    Cdpresta = v_meds
        --AND    Tipocobr = w_cob   -->El CU no menciona que se filtre por tipo de cobro
        AND Trunc(sysdate) BETWEEN Trunc(Fedesde) AND Trunc(Nvl(Fehasta, sysdate+1))
       -- AND    Fedesde <= trunc(sysdate, 'MM')
        --AND    (Fehasta >= trunc(sysdate) OR Fehasta IS NULL)
        AND    ROWNUM   = 1;
      EXCEPTION
      WHEN NO_DATA_FOUND THEN
      s_existe := 'N';
      END;

      IF s_existe = 'N'
      THEN
        s_inci := 'R0310';
        sw_control := 1;
        s_error:='Prestador no tiene asociada condición de pago';
        w_inci:= 1;
        pr_gador_malla_grab_inci(id_factura,
                                  w_inci,
                                  p_pln,
                                  s_campo,
                                  s_inci,
                                  r_meds,
                                  r_fact,
                                  c_sw_control,
                                  s_error,
                                  s_objeto);
      ELSE
        -->Cambiar estado de incidencia registrada por este el mismo motivo
        s_inci := 'R0310';
        pr_gador_malla_val_inci(id_factura,
                                p_pln,
                                s_campo,
                                s_inci,
                                r_fact
                                );
      END IF;
      RETURN s_inci;
   EXCEPTION
   WHEN OTHERS THEN
     s_oraError := SQLERRM;
     pr_graba_error_plano(p_pln,
                         s_oraError,
                         'valida_datos.fn_gador_malla_vali_cdpresta',
                         r_fact);
     RETURN s_inci;
   END;

   FUNCTION FN_GADOR_MALLA_VAL_PRESTA (id_factura      NUMBER,
                                       p_prestador     VARCHAR2,
                                       r_meds          VARCHAR2,
                                       p_pln           VARCHAR2,
                                       r_fact          VARCHAR2,
                                       r_cias          VARCHAR2,
                                       c_sw_control    VARCHAR2)
      RETURN VARCHAR2
   IS
   BEGIN
     s_inci :='OK';
     s_campoVal:='CODIGO PRESTADOR';
     s_campo:='CODIGO_PRESTADOR';
     s_objeto:='pck_gador_malla_valida_datos.fn_gador_malla_val_presta';
     -- validacion campo 3 y 17 sean iguales
     IF r_meds <> p_prestador
     THEN
        s_inci := 'R0311';
        s_error:='Prestador del plano diferente al ingresado por pantalla';
        w_inci:= 1;
        pr_gador_malla_grab_inci(id_factura,
                                  w_inci,
                                  p_pln,
                                  s_campo,
                                  s_inci,
                                  p_prestador,
                                  r_fact,
                                  c_sw_control,
                                  s_error,
                                  s_objeto);
     ELSE
        -->Cambiar estado de incidencia registrada por este el mismo motivo
        s_inci := 'R0311';
        pr_gador_malla_val_inci(id_factura,
                              p_pln,
                              s_campo,
                              s_inci,
                              r_fact
                              );
     END IF;
     RETURN s_inci;
   EXCEPTION
   WHEN OTHERS THEN
     s_oraError := SQLERRM;
     pr_graba_error_plano(p_pln,
                         s_oraError,
                         'valida_datos.fn_gador_malla_val_presta',
                         r_fact);
     RETURN s_inci;
   END;

   FUNCTION FN_GADOR_MALLA_NFACT (id_factura      NUMBER,
                                  s_soci          VARCHAR2,
                                  r_meds          VARCHAR2,
                                  p_pln           VARCHAR2,
                                  r_fact          VARCHAR2,
                                  r_cias          VARCHAR2,
                                  c_sw_control    VARCHAR2)
      RETURN VARCHAR2
   IS
      -- VALIDAR CAMPO 5  numero de factura

      w_noj        VARCHAR2 (1);
      n_fact       NUMBER (20);
      s_nfact      NUMBER (1);
      w_lon_nfac   NUMBER (2);
      w_lon_suf    NUMBER (3);
      w_nfac       NUMBER (1);
      v_fact       VARCHAR (20);
      g_pscn       NUMBER (2) := 0;
      sw_hay       NUMBER (2) := 0;

      pt_pref      VARCHAR2 (5);
      pt_nmro      VARCHAR2 (20);

      lg_tot       NUMBER (2) := 0;
      lg_num       NUMBER (2) := 0;
      sw_num       NUMBER (1) := 0;

      fact_def     NUMBER (20) := 0;
      d_fact       NUMBER (20) := 0;
      hcta         NUMBER (1) := 0;
      n_factura    VARCHAR2 (20);
      W_BLANCOS    NUMBER (1);
      prfij_sin    VARCHAR2 (20);
  BEGIN
    s_inci :='OK';
    s_campoVal:='NUMERO FACTURA';
    s_campo:='NUMERO_FACTURA';
    s_objeto:='pck_gador_malla_valida_datos.fn_gador_malla_nfact';
    -->Rev
    Frecep_Ga.Ver_Norj (r_meds, s_noj);
    IF s_noj = 1
    THEN
      w_noj := 'N';
    ELSIF s_noj = 2
    THEN
      w_noj := 'S';
    END IF;

    IF (r_fact IS NULL OR length(r_fact)=0) AND w_noj = 'S'
    THEN
      s_inci := 'R0501';
      s_error:='Prestador jurídico debe presentar número de factura';
      w_inci:= 1;
      pr_gador_malla_grab_inci(id_factura,
                                w_inci,
                                p_pln,
                                s_campo,
                                s_inci,
                                r_fact,
                                r_fact,
                                c_sw_control,
                                s_error,
                                s_objeto);
      --valida el numero fct con numeros y caracteres
    ELSE
      -->Cambiar estado de incidencia registrada por este el mismo motivo
      s_inci := 'R0501';
      pr_gador_malla_val_inci(id_factura,
                            p_pln,
                            s_campo,
                            s_inci,
                            r_fact
                            );
    END IF;
    v_fact := LTRIM (RTRIM (r_fact, ' '));
    g_pscn := INSTR (v_fact, '-', 1);
    SELECT LENGTH (r_fact) INTO w_lon_nfac FROM DUAL;
    -->Rev
    IF g_pscn = 0
    THEN
       frecep_ga.cta_nmro (v_fact, n_fact, sw_num);



       IF sw_num = 1 OR N_FACT = 0 OR W_LON_NFAC < 15
       THEN                         --- EL dato no es un numero valido
          s_inci := 'R0502';
          s_error:='Formato (#), no válido para factura';
          w_inci:= 1;
          pr_gador_malla_grab_inci(id_factura,
                                    w_inci,
                                    p_pln,
                                    s_campo,
                                    s_inci,
                                    r_fact,
                                    r_fact,
                                    c_sw_control,
                                    s_error,
                                    s_objeto);
       ELSE
         -->Cambiar estado de incidencia registrada por este el mismo motivo
         s_inci := 'R0502';
         pr_gador_malla_val_inci(id_factura,
                                p_pln,
                                s_campo,
                                s_inci,
                                r_fact
                                );
       END IF;
    END IF;
    -->Rev
    IF g_pscn = 1
    THEN
       s_inci := 'R0503';
       s_error:='Formato (-), no válido para factura';
       w_inci:= 1;
       pr_gador_malla_grab_inci(id_factura,
                                w_inci,
                                p_pln,
                                s_campo,
                                s_inci,
                                r_fact,
                                r_fact,
                                c_sw_control,
                                s_error,
                                s_objeto);
    ELSE
       -->Cambiar estado de incidencia registrada por este el mismo motivo
       s_inci := 'R0503';
       pr_gador_malla_val_inci(id_factura,
                              p_pln,
                              s_campo,
                              s_inci,
                              r_fact
                              );
    END IF;
    -->Rev
    IF g_pscn > 4
    THEN
       s_inci := 'R0504';
       s_error:='Prefijo excede número de caracteres permitido';
       w_inci:= 1;
       pr_gador_malla_grab_inci(id_factura,
                                w_inci,
                                p_pln,
                                s_campo,
                                s_inci,
                                r_fact,
                                r_fact,
                                c_sw_control,
                                s_error,
                                s_objeto);
    ELSE
      -->Cambiar estado de incidencia registrada por este el mismo motivo
       s_inci := 'R0504';
       pr_gador_malla_val_inci(id_factura,
                              p_pln,
                              s_campo,
                              s_inci,
                              r_fact
                              );
    END IF;

    IF g_pscn = w_lon_nfac
    THEN                    --- VALIDA SI - ESTA EN LA ULTIMA POSICION
       s_inci := 'R0505';
       s_error:='Formato no válido para factura (-)';
       w_inci:= 1;
       pr_gador_malla_grab_inci(id_factura,
                                w_inci,
                                p_pln,
                                s_campo,
                                s_inci,
                                r_fact,
                                r_fact,
                                c_sw_control,
                                s_error,
                                s_objeto);

    ELSE
       -->Cambiar estado de incidencia registrada por este el mismo motivo
       s_inci := 'R0505';
       pr_gador_malla_val_inci(id_factura,
                              p_pln,
                              s_campo,
                              s_inci,
                              r_fact
                              );
    END IF;
    -->Rev
    -- validacion del numero de factura con caracteres
    frecep_ga.con_raya (v_fact, g_pscn, sw_hay);
    IF sw_hay = 1
    THEN
       --pt_pref := SUBSTR (v_fact, 1, g_pscn);               -- PREFIJO
       --lg_num := w_lon_nfac - g_pscn;
       --IF lg_num = 0
       --THEN
          s_inci := 'R0506';
          s_error:='Prefijo de factura no es correcto';
          w_inci:= 1;
          pr_gador_malla_grab_inci(id_factura,
                                    w_inci,
                                    p_pln,
                                    s_campo,
                                    s_inci,
                                    r_fact,
                                    r_fact,
                                    c_sw_control,
                                    s_error,
                                    s_objeto);


       ELSE
         -->Cambiar estado de incidencia registrada por este el mismo motivo
         s_inci := 'R0506';
         pr_gador_malla_val_inci(id_factura,
                                p_pln,
                                s_campo,
                                s_inci,
                                r_fact
                                );
       --END IF;
    END IF;
    --Rev
    pt_nmro := SUBSTR (v_fact, g_pscn + 1, lg_num);   --- sufijo
    frecep_ga.cta_nmro (pt_nmro, n_fact, sw_num);
    SELECT LENGTH (pt_nmro) INTO w_lon_suf FROM DUAL;

    IF sw_num = 1 OR n_fact = 0 OR w_lon_suf > 15
    THEN
      s_inci := 'R0507';
      s_error:='Sufijo de factura NO es correcto';
      w_inci:= 1;
      pr_gador_malla_grab_inci(id_factura,
                                w_inci,
                                p_pln,
                                s_campo,
                                s_inci,
                                r_fact,
                                r_fact,
                                c_sw_control,
                                s_error,
                                s_objeto);
    ELSE
      -->Cambiar estado de incidencia registrada por este el mismo motivo
       s_inci := 'R0507';
       pr_gador_malla_val_inci(id_factura,
                              p_pln,
                              s_campo,
                              s_inci,
                              r_fact
                              );
    END IF;

    -- VALIDA ESPACIOS EN BLANCO ENTRE PREFIJO Y SUFIJO
    -->Rev
    n_factura := pt_pref || pt_nmro;
    w_blancos := INSTR (n_factura, ' ', g_pscn);
    IF W_BLANCOS > 0
    THEN
       s_inci := 'R0508';
       s_error:='Número de factura contiene espacios';
       w_inci:= 1;
       pr_gador_malla_grab_inci(id_factura,
                                w_inci,
                                p_pln,
                                s_campo,
                                s_inci,
                                r_fact,
                                r_fact,
                                c_sw_control,
                                s_error,
                                s_objeto);

    ELSE
       -->Cambiar estado de incidencia registrada por este el mismo motivo
       s_inci := 'R0508';
       pr_gador_malla_val_inci(id_factura,
                              p_pln,
                              s_campo,
                              s_inci,
                              r_fact
                              );
    END IF;

    -- VALIDA SI LA FACTURA YA EXISTE
    -->Rev
    frecep_ga.ver_mfac (r_cias,
                        r_meds,
                        r_fact,
                        hcta);
    IF hcta >= 1
    THEN
       s_inci := 'R0509';
       s_error:='Factura ya grabada';
       w_inci:= 1;
       pr_gador_malla_grab_inci(id_factura,
                                w_inci,
                                p_pln,
                                s_campo,
                                s_inci,
                                r_fact,
                                r_fact,
                                c_sw_control,
                                s_error,
                                s_objeto);
    ELSE
      -->Cambiar estado de incidencia registrada por este el mismo motivo
      s_inci := 'R0509';
      pr_gador_malla_val_inci(id_factura,
                            p_pln,
                            s_campo,
                            s_inci,
                            r_fact
                            );
    END IF;

    -- valida si la factura ya existe sin caracter (-)
    -->Rev
    prfij_sin := SUBSTR (pt_pref, 1, g_pscn - 1);
    fact_def := prfij_sin || pt_nmro;
    frecep_ga.ver_mfac (r_cias,
                      r_meds,
                      fact_def,
                      hcta);
    IF hcta >= 1
    THEN
       s_inci := 'R0510';
       s_error:='Factura ya grabada sin guión';
       w_inci:= 1;
       pr_gador_malla_grab_inci(id_factura,
                                w_inci,
                                p_pln,
                                s_campo,
                                s_inci,
                                r_fact,
                                r_fact,
                                c_sw_control,
                                s_error,
                                s_objeto);
    ELSE
      -->Cambiar estado de incidencia registrada por este el mismo motivo
      s_inci := 'R0510';
      pr_gador_malla_val_inci(id_factura,
                            p_pln,
                            s_campo,
                            s_inci,
                            r_fact
                            );
    END IF;
    RETURN s_inci;                              -- CIERRA EL IF DE W_CONTROL = 0
  EXCEPTION
  WHEN OTHERS THEN
     s_oraError := SQLERRM;
     pr_graba_error_plano(p_pln,
                         s_oraError,
                         'valida_datos.fn_gador_malla_nfact',
                         r_fact);
     RETURN s_inci;
  END;

   FUNCTION FN_GADOR_MALLA_VAL_VALORFAC (id_factura      NUMBER,
                                         r_vlor          NUMBER,
                                         s_soci          VARCHAR2,
                                         r_meds          VARCHAR2,
                                         p_pln           VARCHAR2,
                                         r_fact          VARCHAR2,
                                         r_cias          VARCHAR2,
                                         c_sw_control    VARCHAR2)
      RETURN VARCHAR2
   IS
   BEGIN
     s_inci :='OK';
     s_campoVal:='VALOR TOTAL FACTURA';
     s_campo:='VALOR_TOTAL_FACTURA';
     s_objeto:='pck_gador_malla_valida_datos.fn_gador_malla_val_valorfac';
     IF r_vlor <= 0
     THEN
        s_inci := 'R0601';
        s_error:='Valor factura debe ser mayor que cero';
        w_inci:= 1;
        pr_gador_malla_grab_inci(id_factura,
                                w_inci,
                                p_pln,
                                s_campo,
                                s_inci,
                                r_vlor,
                                r_fact,
                                c_sw_control,
                                s_error,
                                s_objeto);
     ELSE
        -->Cambiar estado de incidencia registrada por este el mismo motivo
        s_inci := 'R0601';
        pr_gador_malla_val_inci(id_factura,
                              p_pln,
                              s_campo,
                              s_inci,
                              r_fact
                              );
     END IF;
     RETURN s_inci;
   EXCEPTION
   WHEN OTHERS THEN
     s_oraError := SQLERRM;
     pr_graba_error_plano(p_pln,
                         s_oraError,
                         'valida_datos.FN_GADOR_MALLA_VAL_VALORFAC',
                         r_fact);
     RETURN s_inci;
   END;

   FUNCTION FN_GADOR_MALLA_CTA_MODER (id_factura      NUMBER,
                                      r_VlrCuoMod     NUMBER,
                                      s_soci          VARCHAR2,
                                      r_meds          VARCHAR2,
                                      p_pln           VARCHAR2,
                                      r_fact          VARCHAR2,
                                      r_cias          VARCHAR2,
                                      c_sw_control    VARCHAR2) --,sw_control number)
      RETURN VARCHAR2
   IS
   BEGIN
     s_inci :='OK';
     s_campoVal:='VAL_RECAU_CUOTA_MODERA';
     s_campo:='VAL_RECAU_CUOTA_MODERA';
     s_objeto:='pck_gador_malla_valida_datos.fn_gador_malla_cta_moder';
     IF r_VlrCuoMod < 0
     THEN
        s_inci := 'R0701';
        s_error:='Valor de la cuota moderadora es incorrecto';
        w_inci:= 1;
        pr_gador_malla_grab_inci(id_factura,
                                w_inci,
                                p_pln,
                                s_campo,
                                s_inci,
                                r_VlrCuoMod,
                                r_fact,
                                c_sw_control,
                                s_error,
                                s_objeto);
     ELSE
        -->Cambiar estado de incidencia registrada por este el mismo motivo
        s_inci := 'R0701';
        pr_gador_malla_val_inci(id_factura,
                              p_pln,
                              s_campo,
                              s_inci,
                              r_fact
                              );
     END IF;
     RETURN s_inci;
   EXCEPTION
   WHEN OTHERS THEN
     s_oraError := SQLERRM;
     pr_graba_error_plano(p_pln,
                         s_oraError,
                         'valida_datos.FN_GADOR_MALLA_CTA_MODER',
                         r_fact);
     RETURN s_inci;
   END;

   FUNCTION FN_GADOR_MALLA_VLR_REC_CO (id_factura      NUMBER,
                                       r_VlrCopag      NUMBER,
                                       s_soci          VARCHAR2,
                                       r_meds          VARCHAR2,
                                       p_pln           VARCHAR2,
                                       r_fact          VARCHAR2,
                                       r_cias          VARCHAR2,
                                       C_SW_CONTROL    VARCHAR2) --,sw_control number)
      RETURN VARCHAR2
   IS
   BEGIN
     s_inci :='OK';
     s_campoVal:='VAL_RECAU_COPAGO';
     s_campo:='VAL_RECAU_COPAGO';
     s_objeto:='pck_gador_malla_valida_datos.fn_gador_malla_vlr_rec_co';
     IF r_VlrCopag < 0
     THEN
        s_inci := 'R0801';
        s_error:='Valor de copago es incorrecto';
        w_inci:= 1;
        pr_gador_malla_grab_inci(id_factura,
                                w_inci,
                                p_pln,
                                s_campo,
                                s_inci,
                                r_VlrCopag,
                                r_fact,
                                c_sw_control,
                                s_error,
                                s_objeto);
     ELSE
        -->Cambiar estado de incidencia registrada por este el mismo motivo
        s_inci := 'R0801';
        pr_gador_malla_val_inci(id_factura,
                              p_pln,
                              s_campo,
                              s_inci,
                              r_fact
                              );
     END IF;
     RETURN s_inci;
   EXCEPTION
   WHEN OTHERS THEN
     s_oraError := SQLERRM;
     pr_graba_error_plano(p_pln,
                         s_oraError,
                         'valida_datos.fn_gador_malla_vlr_rec_co',
                          r_fact);
     RETURN s_inci;
   END;

   FUNCTION FN_GADOR_MALLA_VLR_REC_PMC (id_factura      NUMBER,
                                        r_VlrPerMin     NUMBER,
                                        s_soci          VARCHAR2,
                                        r_meds          VARCHAR2,
                                        p_pln           VARCHAR2,
                                        r_fact          VARCHAR2,
                                        r_cias          VARCHAR2,
                                        C_SW_CONTROL    VARCHAR2) --,sw_control number)
      RETURN VARCHAR2
   IS
   BEGIN
     s_inci :='OK';
     s_campoVal:='VALOR_RECAUDO_PMC';
     s_campo:='VALOR_RECAUDO_PMC';
     s_objeto:='pck_gador_malla_valida_datos.fn_gador_malla_vlr_rec_pmc';
     IF r_VlrPerMin < 0
     THEN
        s_inci := 'R0901';
        s_error:='Valor de PMC es incorrecto';
        w_inci:= 1;
        pr_gador_malla_grab_inci(id_factura,
                                w_inci,
                                p_pln,
                                s_campo,
                                s_inci,
                                r_VlrPerMin,
                                r_fact,
                                c_sw_control,
                                s_error,
                                s_objeto);

     ELSE
        -->Cambiar estado de incidencia registrada por este el mismo motivo
        s_inci := 'R0901';
        pr_gador_malla_val_inci(id_factura,
                              p_pln,
                              s_campo,
                              s_inci,
                              r_fact
                              );
     END IF;
     RETURN s_inci;
   EXCEPTION
   WHEN OTHERS THEN
     s_oraError := SQLERRM;
     pr_graba_error_plano(p_pln,
                         s_oraError,
                         'valida_datos.FN_GADOR_MALLA_VLR_REC_PMC',
                         r_fact);
     RETURN s_inci;
   END;

   FUNCTION FN_GADOR_MALLA_FEC_ING (id_factura      NUMBER,
                                    r_fing          VARCHAR2,
                                    s_soci          VARCHAR2,
                                    r_meds          VARCHAR2,
                                    p_pln           VARCHAR2,
                                    r_fact          VARCHAR2,
                                    r_cias          VARCHAR2,
                                    C_SW_CONTROL    VARCHAR2) --,sw_control number)
      RETURN VARCHAR2
   IS
      n_fing   NUMBER (1) := 0;
   BEGIN
     s_inci :='OK';
     s_campoVal:='FECHA_INGRESO';
     s_campo:='FECHA_INGRESO';
     s_objeto:='pck_gador_malla_valida_datos.fn_gador_malla_fec_ing';

      SELECT NVL (COUNT (1), 0)
        INTO n_fing
        FROM DUAL
       WHERE to_date(r_fing, 'dd/mm/yyyy') BETWEEN ADD_MONTHS (SYSDATE, -12) AND SYSDATE;

     -->Rev
     IF n_fing = 0
     THEN
        s_inci := 'R1001';
        s_error:='Fecha de ingreso es incorrecta';
        w_inci:= 1;
        pr_gador_malla_grab_inci(id_factura,
                                w_inci,
                                p_pln,
                                s_campo,
                                s_inci,
                                r_fing,
                                r_fact,
                                c_sw_control,
                                s_error,
                                s_objeto);
     ELSE
        -->Cambiar estado de incidencia registrada por este el mismo motivo
        s_inci := 'R1001';
        pr_gador_malla_val_inci(id_factura,
                              p_pln,
                              s_campo,
                              s_inci,
                              r_fact
                              );
     END IF;
     RETURN s_inci;
   EXCEPTION
   WHEN OTHERS THEN
     s_oraError := SQLERRM;
     pr_graba_error_plano(p_pln,
                         s_oraError,
                         'valida_datos.FN_GADOR_MALLA_FEC_ING',
                         r_fact);
      RETURN s_inci;
   END;


   FUNCTION FN_GADOR_MALLA_FEC_SAL (id_factura      NUMBER,
                                    r_fing          VARCHAR2,
                                    r_fsal          VARCHAR2,
                                    r_meds          VARCHAR2,
                                    p_pln           VARCHAR2,
                                    r_fact          VARCHAR2,
                                    C_SW_CONTROL    VARCHAR2)
      RETURN VARCHAR2
   IS
      n_fsal   NUMBER (1) := 0;
   BEGIN
     s_inci :='OK';
     s_campoVal:='FECHA_SALIDA';
     s_campo:='FECHA_SALIDA';
     s_objeto:='pck_gador_malla_valida_datos.fn_gador_malla_fec_sal';
     -->Rev
     IF TO_DATE(r_fsal, 'DD/MM/YYYY') < TO_DATE(r_fing, 'DD/MM/YYYY')
     THEN
        s_inci := 'R1101';
        s_error:='Fecha de salida es superior A fecha de ingreso';
        w_inci:= 1;
        pr_gador_malla_grab_inci(id_factura,
                                w_inci,
                                p_pln,
                                s_campo,
                                s_inci,
                                r_fsal,
                                r_fact,
                                c_sw_control,
                                s_error,
                                s_objeto);
     ELSE
        -->Cambiar estado de incidencia registrada por este el mismo motivo
        s_inci := 'R1101';
        pr_gador_malla_val_inci(id_factura,
                              p_pln,
                              s_campo,
                              s_inci,
                              r_fact
                              );
     END IF;


     IF r_fsal >= SYSDATE
     THEN
        s_inci := 'R1102';
        s_error:='Fecha de salida es incorrecta';
        w_inci:= 1;
        pr_gador_malla_grab_inci(id_factura,
                                w_inci,
                                p_pln,
                                s_campo,
                                s_inci,
                                r_fsal,
                                r_fact,
                                c_sw_control,
                                s_error,
                                s_objeto);
     ELSE
        -->Cambiar estado de incidencia registrada por este el mismo motivo
        s_inci := 'R1102';
        pr_gador_malla_val_inci(id_factura,
                              p_pln,
                              s_campo,
                              s_inci,
                              r_fact
                              );
     END IF;

     RETURN s_inci;
   EXCEPTION
   WHEN OTHERS THEN
     s_oraError := SQLERRM;
     pr_graba_error_plano(p_pln,
                         s_oraError,
                         'valida_datos.FN_GADOR_MALLA_FEC_SAL',
                         r_fact);
     RETURN s_inci;
   END;

   FUNCTION FN_GADOR_MALLA_NRO_SOL (id_factura      NUMBER,
                                    r_nsol          VARCHAR2,
                                    r_meds          VARCHAR2,
                                    p_pln           VARCHAR2,
                                    r_fact          VARCHAR2,
                                    C_SW_CONTROL    VARCHAR2,
									p_fechaprestserv Varchar2 --23/05/2014 JaFarias
									)
      RETURN VARCHAR2
   IS
      N_SOL        NUMBER (1) := 0;
      N_NMFACT     VARCHAR2 (20);
      F_FAC        DATE;
      W_CDPERSPR   NUMBER (9);
      v_estvol     mvolanca.cdestvol%TYPE;
      v_noj        number(1);

	  --Inicio Declaracion JaFarias
      v_vol         mvolanca.nmautori%TYPE;
      v_fcta        mgrabcue.nmfactur%TYPE;
      v_estd        number(1);
      v_diasaut     mvolanca.nmdiaest%TYPE;
      --Fin Declaracion JaFarias

   BEGIN
    IF TO_NUMBER(r_nsol) <> 0 THEN
     s_inci :='OK';
     s_campoVal:='NUM_SOL_VOLANTE';
     s_campo:='NUM_SOL_VOLANTE';
     s_objeto:='pck_gador_malla_valida_datos.fn_gador_malla_nro_sol';

     --Pck_Epsga_Grb.Vol_Nsol

     Frecep_Ga.Ver_Norj (r_meds, s_noj);

	 --Inicio Inclusion Validacion Numero Solicitud Volante Encabezado JaFarias
	 IF p_fechaprestserv IS NOT NULL AND To_Number(r_nsol) <> 0 THEN

   	     Pck_Epsga_Grb.Vol_Nsol(To_Number(r_nsol),
                                s_noj,
                                to_char(To_Date(p_fechaprestserv, 'DD/MM/YYYY'), 'YYYYMMDD'),
                                v_vol,
                                v_fcta,
                                v_estd,
                                v_diasaut);

     END IF;
	 --Fin Inclusion Validacion Numero Solicitud Volante Encabezado JaFarias

     BEGIN
       SELECT nmfactur,
              feusofac,
              cdperspr,
              --COUNT (1)
              cdestvol
         INTO n_nmfact,
              f_fac,
              w_cdperspr,
              --N_SOL
              v_estvol
         FROM mvolanca
        WHERE nmsolvol = r_nsol
        AND nmsecaut = s_noj;
        N_SOL := 1;
     EXCEPTION
     WHEN NO_DATA_FOUND THEN
        N_SOL := 0;
     END;
      --AND CDESTVOL IS NULL
      --GROUP BY NMFACTUR, FEUSOFAC, CDPERSPR;
     -->Rev
     IF N_SOL = 0 OR v_estd = 4 THEN --Inclusion Validacion Numero Solicitud Volante Encabezado JaFarias
        s_inci := 'R1201';
        s_error:='Volante de encabezado NO existe';
        w_inci:= 1;
        pr_gador_malla_grab_inci(id_factura,
                                w_inci,
                                p_pln,
                                s_campo,
                                s_inci,
                                r_nsol,
                                r_fact,
                                c_sw_control,
                                s_error,
                                s_objeto);
     ELSE
       -->Cambiar estado de incidencia registrada por este el mismo motivo
       s_inci := 'R1201';
       pr_gador_malla_val_inci(id_factura,
                              p_pln,
                              s_campo,
                              s_inci,
                              r_fact
                              );
     END IF;
     -->Rev
     IF v_estvol IS NOT NULL OR v_estd = 1 OR v_estd = 2 OR v_estd = 3  OR v_estd = 5 THEN --Inclusion Validacion Numero Solicitud Volante Encabezado JaFarias
        s_inci := 'R1202';
        s_error:='Volante de Encabezado Utilizado, Vencido, Anulado o con Configuración (N / J) diferente a la del volante.';
        w_inci:= 1;
        pr_gador_malla_grab_inci(id_factura,
                                w_inci,
                                p_pln,
                                s_campo,
                                s_inci,
                                r_nsol,
                                r_fact,
                                c_sw_control,
                                s_error,
                                s_objeto);

     ELSE
       -->Cambiar estado de incidencia registrada por este el mismo motivo
       s_inci := 'R1202';
       pr_gador_malla_val_inci(id_factura,
                              p_pln,
                              s_campo,
                              s_inci,
                              r_fact
                              );
     END IF;
     --Rev
     IF W_CDPERSPR IS NOT NULL
     THEN
        SELECT cdperson -- Guarda el valor del codigo de la persona para luego  -- ser comparado con la persona q pasa el cobro
        INTO w_cdperson
        FROM mprestad M
        WHERE M.CDPRESTA = trim(r_meds);

        IF w_cdperson <> W_CDPERSPR
        THEN
           s_inci := 'R1203';
           s_error:='Volante de otro prestador';
           w_inci:= 1;
           pr_gador_malla_grab_inci(id_factura,
                                  w_inci,
                                  p_pln,
                                  s_campo,
                                  s_inci,
                                  r_nsol,
                                  r_fact,
                                  c_sw_control,
                                  s_error,
                                  s_objeto);
        ELSE
           -->Cambiar estado de incidencia registrada por este el mismo motivo
           s_inci := 'R1203';
           pr_gador_malla_val_inci(id_factura,
                                  p_pln,
                                  s_campo,
                                  s_inci,
                                  r_fact
                                  );
        END IF;
     END IF;
     -->Rev
     IF N_NMFACT IS NOT NULL --AND F_FAC NOT NULL
     THEN
         IF N_NMFACT != r_fact
         THEN
            s_inci := 'R1204';
            s_error:='Volante grabado en otra factura';
            w_inci:= 1;
            pr_gador_malla_grab_inci(id_factura,
                                    w_inci,
                                    p_pln,
                                    s_campo,
                                    s_inci,
                                    r_nsol,
                                    r_fact,
                                    c_sw_control,
                                    s_error,
                                    s_objeto);
         ELSE
             -->Cambiar estado de incidencia registrada por este el mismo motivo
             s_inci := 'R1204';
             pr_gador_malla_val_inci(id_factura,
                                    p_pln,
                                    s_campo,
                                    s_inci,
                                    r_fact
                                    );
          END IF;
      END IF;
   END IF;
      RETURN s_inci;
   EXCEPTION
   WHEN OTHERS THEN
     s_oraError := SQLERRM;
     pr_graba_error_plano(p_pln,
                         s_oraError,
                         'valida_datos.fn_gador_malla_nro_sol',
                         r_fact);
      RETURN s_inci;
   END;

   FUNCTION FN_GADOR_MALLA_FEC_FACT (id_factura      NUMBER,
                                     r_ffac          VARCHAR2,
                                     r_nsol          VARCHAR2,
                                     r_meds          VARCHAR2,
                                     p_pln           VARCHAR2,
                                     r_fact          VARCHAR2,
                                     C_SW_CONTROL    VARCHAR2)
      RETURN VARCHAR2
   IS
   BEGIN
      s_inci :='OK';
      s_campoVal:='FECHA_ELABORA_FACTURA';
      s_campo:='FECHA_ELABORA_FACTURA';
      s_objeto:='pck_gador_malla_valida_datos.fn_gador_malla_fec_fact';
      -->Rev
       IF TO_DATE(r_ffac, 'DD/MM/YY') < ADD_MONTHS (SYSDATE, -12)
       THEN
          s_inci := 'R1301';
          s_error:='Fecha de elaboración de la factura es incorrecta';
          w_inci:= 1;
          pr_gador_malla_grab_inci(id_factura,
                                  w_inci,
                                  p_pln,
                                  s_campo,
                                  s_inci,
                                  r_ffac,
                                  r_fact,
                                  c_sw_control,
                                  s_error,
                                  s_objeto);
       ELSE
          -->Cambiar estado de incidencia registrada por este el mismo motivo
           s_inci := 'R1301';
           pr_gador_malla_val_inci(id_factura,
                                  p_pln,
                                  s_campo,
                                  s_inci,
                                  r_fact
                                  );
       END IF;

      RETURN s_inci;
   EXCEPTION
   WHEN OTHERS THEN
     s_oraError := SQLERRM;
     pr_graba_error_plano(p_pln,
                         s_oraError,
                         'valida_datos.FN_GADOR_MALLA_FEC_FACT',
                         r_fact);
     RETURN s_inci;
   END;

   -- Versión  Autor          Fecha       Comentario
   -- 1.0.000  jlrodriguez    16/10/2013  Creación - Procedimiento que gestiona la grabación de una incidencia.
   PROCEDURE pr_gador_malla_grab_inci(p_id_factura      IN NUMBER,
                                      p_id_incidencia   IN NUMBER,
                                      p_nom_archivo     IN VARCHAR2,
                                      p_campo           IN VARCHAR2,
                                      p_cod_error       IN VARCHAR2,
                                      p_contenido_campo IN VARCHAR2,
                                      p_nro_factura     IN VARCHAR2,
                                      p_ctrl_cambio     IN VARCHAR2,
                                      p_desc_error      IN VARCHAR2,
                                      p_objeto          IN VARCHAR2)
   IS
   w_incia       NUMBER (10);
  BEGIN
      -->Validar si la incidencia ya se regitró en un proceso anterior
      SELECT G.id_incidencia
        INTO w_incia
        FROM geps_tb_incidencia_malla G
        WHERE     G.cd_error = p_cod_error
        AND G.nom_archivo = p_nom_archivo
        AND G.nro_factura = p_nro_factura
        AND G.campo = p_campo
        AND G.id_factura = p_id_factura;

      -->Elimina la incidencia anterior
      DELETE geps_tb_incidencia_malla G
      WHERE     G.nom_archivo = p_nom_archivo
      AND G.id_factura = p_id_factura -->consecutivo unico enviado por malla
      AND G.nro_factura = p_nro_factura
      AND G.id_incidencia = w_incia
      AND G.cd_error = p_cod_error
      AND G.campo = p_campo;


      -->Registra nuevamente la incidencia en estado R: Revisada
      Pck_epsga_ins.ins_incid_malla (
      p_id_factura,
      (p_id_incidencia+1),
      p_nom_archivo,
      p_campo,
      p_cod_error,
      p_contenido_campo,
      p_nro_factura,
      'E',            -->Identifica que ya fue revisado el error.
      p_desc_error,
      p_objeto);
  EXCEPTION
  WHEN NO_DATA_FOUND THEN
    -->Primera vez
    pck_epsga_ins.ins_incid_malla (
    p_id_factura,
    p_id_incidencia,
    p_nom_archivo,
    p_campo,
    p_cod_error,
    p_contenido_campo,
    p_nro_factura,
    'E',
    p_desc_error,
    p_objeto);
  END;

  -- Versión  Autor          Fecha       Comentario
  -- 1.0.000  jlrodriguez    16/10/2013  Creación - Procedimiento que gestiona la eliminación de una incidencia cuando ha sido corregida
  PROCEDURE pr_gador_malla_val_inci(p_id_factura      IN NUMBER,
                                    p_nom_archivo     IN VARCHAR2,
                                    p_campo           IN VARCHAR2,
                                    p_cod_error       IN VARCHAR2,
                                    p_nro_factura     IN VARCHAR2
                                    )
   IS
  BEGIN
      UPDATE geps_tb_incidencia_malla
      SET sw_ctl_cambio = 'C'
      WHERE id_factura = p_id_factura
      AND cd_error = p_cod_error
      AND nom_archivo = p_nom_archivo
      AND nro_factura = CASE WHEN nro_factura <> p_nro_factura THEN nro_factura ELSE p_nro_factura END
      AND campo = p_campo;
      COMMIT;
  EXCEPTION
  WHEN others THEN
    NULL;
  END;
  /*
  CU 8
  VALIDACIONES REGISTRO TIPO IMPUESTOS
  */
  -- Versión  Autor          Fecha       Comentario
  -- 1.0.000  Deissy Coral   16/10/2013  Creación - Procedimiento encargado de realizar las validaciones del campo 2 (Código de concepto).
 PROCEDURE pr_gador_malla_val_conc (p_porc         IN OUT NUMBER,
                                    p_tipoCon     IN OUT VARCHAR2,
                                    id_factura    IN NUMBER,    --id factura
                                    p_pln          IN VARCHAR2,  --nombre archivo
                                    r_fact        IN VARCHAR2,  --Numero de Factura
                                    p_cia          IN VARCHAR2,  --compañia
                                    i_impu        IN VARCHAR2,  --codigo concepto
                                    c_sw_control  IN VARCHAR2)
IS
  v_impu       NUMBER (3) := 0;
  w_impu       NUMBER (3) := 0;
  v_cia        NUMBER (3) := 0;
  w_cia        NUMBER (3) := 0;
  v_por        NUMBER(5,2);
  v_tip         VARCHAR2(1);

  BEGIN
  -->Inicializar las variables segun el tipo de dato, para cada validacion
  s_inci :='OK';
  p_porc:=NULL;
  p_tipoCon:=NULL;
  v_impu := TO_NUMBER (i_impu);
  v_cia := TO_NUMBER (p_cia);
  s_campoVal:='CODIGO CONCEPTO';
  s_campo:='CODIGO_CONCEPTO';
  s_objeto:='pck_gador_malla_valida_datos.fn_gador_malla_val_conc';

  -- valida el campo v_impu-->i_impu
  -->El campo 2 (Código de concepto), debe existir en TMANTENI para el concepto TCONCIMP
  SELECT COUNT (1)
    INTO w_impu
    FROM TMANTENI
    WHERE cdtabla='TCONCIMP'
      AND codigo=v_impu;
  -->Codigo concepto no existe
  IF w_impu = 0
  THEN
    s_inci := 'I0201';
    s_error:='Código de concepto NO parametrizado';
    w_inci:= 1;
    pr_gador_malla_grab_inci(id_factura,
                              w_inci,
                              p_pln,
                              s_campo,
                              s_inci,
                              i_impu,
                              r_fact,
                              c_sw_control,
                              s_error,
                              s_objeto);
  ELSE
     -->Cambiar estado de incidencia registrada por este el mismo motivo
     s_inci := 'I0201';
     pr_gador_malla_val_inci(id_factura,
                            p_pln,
                            s_campo,
                            s_inci,
                            r_fact
                            );
  END IF;

  -->El campo 2 (Código de concepto), debe tener un registro para el dato de entrada 4 (Compañía), en la tabla MCONCUNI
  Frecep_Ga.Ver_Porc(v_cia,v_impu,v_por,v_tip);
  -->Compañia no existe para Codigo concepto
  IF v_por = 0 AND v_tip = 'X'
  THEN

    s_inci := 'I0202';
    s_error:='NO existe tipo de concepto asociado';
    pr_gador_malla_grab_inci(id_factura,
                              w_inci,
                              p_pln,
                              s_campo,
                              s_inci,
                              i_impu,
                              r_fact,
                              c_sw_control,
                              s_error,
                              s_objeto);
  ELSE
     -->Cambiar estado de incidencia registrada por este el mismo motivo
     s_inci := 'I0202';
     pr_gador_malla_val_inci(id_factura,
                            p_pln,
                            s_campo,
                            s_inci,
                            r_fact
                            );
  END IF;

  BEGIN

    SELECT nmporcen,swtipcon
      INTO p_porc,p_tipocon
      FROM mconcuni
      WHERE cdconcep=v_impu AND cdunieco=v_cia;

  EXCEPTION
  WHEN NO_DATA_FOUND THEN
    p_porc := 0;
    p_tipocon := '-';
  END;
EXCEPTION
WHEN OTHERS THEN
  s_oraError := SQLERRM;
  pr_graba_error_plano(p_pln,
                     s_oraError,
                     'valida_datos.fn_gador_malla_val_conc',
                     r_fact);
END;

-- Versión    Autor            Fecha       Comentario
-- 1.0.000  Deissy Coral   17/10/2013   Creación - Funcion encargada de realizar las validaciones del campo 3 (Valor base retención) del archivo, Impuestos
FUNCTION fn_gador_malla_val_valb (  id_factura    NUMBER,    --id factura
                  p_pln      VARCHAR2,  --nombre archivo
                  r_fact      VARCHAR2,  --Numero de Factura
                  i_vlor      VARCHAR2,  --Valor base retención
                  p_tipoCon    VARCHAR2,  --concepto (retorno campo 2)
                  c_sw_control  VARCHAR2) RETURN VARCHAR2
IS
  v_vlor       NUMBER (14,2) := 0;
  w_vlor       NUMBER (3) := 0;
BEGIN
  -- inicializo las variables segun el tipo de dato, para cada validacion
  s_inci :='OK';
  v_vlor := TO_NUMBER (i_vlor);
  s_campoVal:='VALOR BASE RETENCION';
  s_campo:='VALOR_BASE_RETENCION';
  s_objeto:='pck_gador_malla_valida_datos.fn_gador_malla_val_valb';
  -- valida el campo v_vlor-->i_vlor
  -->El campo 3 (Valor base retención), no debe ser menor a cero
  IF v_vlor< 0
  THEN
    s_inci:='I0301';
    s_error:='Valor del concepto debe ser mayor o igual A cero';

    pr_gador_malla_grab_inci(id_factura,
                              w_inci,
                              p_pln,
                              s_campo,
                              s_inci,
                              i_vlor,
                              r_fact,
                              c_sw_control,
                              s_error,
                              s_objeto);
  ELSE
     -->Cambiar estado de incidencia registrada por este el mismo motivo
     s_inci := 'I0301';
     pr_gador_malla_val_inci(id_factura,
                            p_pln,
                            s_campo,
                            s_inci,
                            r_fact
                            );
  END IF;
  -->El campo 3 (Valor base retención), si el retorno concepto del campo 2 es 'D' y el valor base es mayor a cero
  IF v_vlor> 0 AND p_tipoCon='D'
  THEN
    s_inci:='I0302';
    s_error:='Valor del concepto para descuentos debe ser cero';

    pr_gador_malla_grab_inci(id_factura,
                              w_inci,
                              p_pln,
                              s_campo,
                              s_inci,
                              i_vlor,
                              r_fact,
                              c_sw_control,
                              s_error,
                              s_objeto);
  ELSE
     -->Cambiar estado de incidencia registrada por este el mismo motivo
     s_inci := 'I0302';
     pr_gador_malla_val_inci(id_factura,
                            p_pln,
                            s_campo,
                            s_inci,
                            r_fact
                            );
  END IF;
  -->El campo 3 (Valor base retención), si el retorno concepto del campo 2 es 'I' y el valor base es cero

  IF v_vlor= 0 AND p_tipoCon='I'
  THEN
    s_inci:='I0303';
    s_error:='Valor del concepto para impuestos debe tener base';

    pr_gador_malla_grab_inci(id_factura,
                              w_inci,
                              p_pln,
                              s_campo,
                              s_inci,
                              i_vlor,
                              r_fact,
                              c_sw_control,
                              s_error,
                              s_objeto);
  ELSE
     -->Cambiar estado de incidencia registrada por este el mismo motivo
     s_inci := 'I0303';
     pr_gador_malla_val_inci(id_factura,
                             p_pln,
                             s_campo,
                             s_inci,
                             r_fact
                             );
  END IF;
  -->El campo 3 (Valor base retención), si el retorno concepto del campo 2 es diferente a 'D' o 'I'
  IF p_tipoCon<>'I' AND p_tipoCon <>'D'
  THEN
    s_inci:='I0304';
    s_error:='Tipo concepto indefinido';

    pr_gador_malla_grab_inci(id_factura,
                              w_inci,
                              p_pln,
                              s_campo,
                              s_inci,
                              i_vlor,
                              r_fact,
                              c_sw_control,
                              s_error,
                              s_objeto);
  ELSE
     -->Cambiar estado de incidencia registrada por este el mismo motivo
     s_inci := 'I0304';
     pr_gador_malla_val_inci(id_factura,
                             p_pln,
                             s_campo,
                             s_inci,
                             r_fact
                             );
  END IF;
  RETURN(s_inci);
EXCEPTION
WHEN OTHERS THEN
  s_oraError := SQLERRM;
  pr_graba_error_plano(p_pln,
                     s_oraError,
                     'valida_datos.fn_gador_malla_val_valb',
                      r_fact);
  RETURN(s_inci);
END;

  -- CU 9 - VALIDACIONES REGISTRO TIPO SOCIEDADES

  -- Versión  Autor          Fecha       Comentario
  -- 1.0.000  Deissy Coral   17/10/2013  Creación - Funcion encargada de realizar las validaciones del campo 2 (Codigo Prestador) del archivo, Sociedades
FUNCTION fn_gador_malla_val_prests (id_factura    NUMBER,    --id factura
                  p_pln          VARCHAR2,  --nombre archivo
                  r_fact        VARCHAR2,  --Numero de Factura
                  s_soci        VARCHAR2,  --Código de prestador socio
                  p_cia          VARCHAR2,  --Compania
                  r_meds        VARCHAR2,  --Codigo Prestador
                  p_frad        VARCHAR2, --Fecha Radicacion (Fecha Ingreso?)
                  p_cuam        VARCHAR2, --cuadro medico
                  r_fing        VARCHAR2, --Fecha Ingreso
                  c_sw_control  VARCHAR2) RETURN VARCHAR2
IS
  w_soci       NUMBER (3) := 0;
  --variables generales
  w_inci       NUMBER (10) := 1;
  w_inciA       NUMBER (10);
BEGIN
  -- inicializo las variables segun el tipo de dato, para cada validacion
  s_inci :='OK';
  s_campoVal:='CODIGO PRESTADOR SOCIO';
  s_campo:='CODIGO_PRESTADOR_SOCIO';
  s_objeto:='pck_gador_malla_valida_datos.fn_gador_malla_val_prests';
  -- valida el campo s_soci-->s_soci


  -->Rev
  IF r_meds<>s_soci -->Ajuste CU 9
  THEN
    -->El campo 2 (Código prestador socio), compañia, prestador debe estar activo en MINTESOC
    Frecep_Ga.ver_soci(r_meds,s_soci,w_soci);
    IF w_soci=0
    THEN
      s_inci:='S0201';
      s_error:='Prestador NO está en sociedad';

      pr_gador_malla_grab_inci(id_factura,
                                w_inci,
                                p_pln,
                                s_campo,
                                s_inci,
                                s_soci,
                                r_fact,
                                c_sw_control,
                                s_error,
                                s_objeto);

    ELSE
      -->Cambiar estado de incidencia registrada por este el mismo motivo
      s_inci := 'S0201';
      pr_gador_malla_val_inci(id_factura,
                             p_pln,
                             s_campo,
                             s_inci,
                             r_fact
                             );
    END IF;
  END IF;
  -->El campo 2 (Código prestador socio), Código prestador socio y Prestador son diferentes
  -->Rev
  /*
  IF r_meds<>s_soci
  THEN
    -->Realizar todas las validaciones qu se realizaron a Codigo Prestador
    s_inci := pck_gador_malla_valida_datos.FN_GADOR_MALLA_VALI_CDPRESTA (
                                                                        id_factura,
                                                                        p_pln,
                                                                        r_fact,
                                                                        p_cia,
                                                                        s_soci,
                                                                        r_fing,
                                                                        p_cuam,
                                                                        p_cia,
                                                                        p_frad,
                                                                        s_soci,
                                                                        C_SW_CONTROL);
  END IF;*/
  RETURN(s_inci);
EXCEPTION
WHEN OTHERS THEN
  s_oraError := SQLERRM;
  pr_graba_error_plano(p_pln,
                     s_oraError,
                     'valida_datos.fn_gador_malla_val_prests',
                     r_fact);
  RETURN(s_inci);
END;
-- Versión    Autor            Fecha       Comentario
-- 1.0.000  Deissy Coral   17/10/2013   Creación - Funcion encargada de realizar las validaciones del campo 3 (Tipo de honorario) del archivo, Sociedades
FUNCTION fn_gador_malla_val_thonor(  id_factura    NUMBER,    --id factura
                  p_pln      VARCHAR2,  --nombre archivo
                  r_fact      VARCHAR2,  --Numero de Factura
                  s_hono      VARCHAR2,  --Tipo de honorario
                  r_meds      VARCHAR2,  --Codigo Prestador
                  s_soci      VARCHAR2,  --Código de prestador socio
                  c_sw_control  VARCHAR2) RETURN VARCHAR2
IS
  w_hono       NUMBER (3) := 0;
  --variables generales
  w_inci       NUMBER (10) := 1;
  w_inciA       NUMBER (10);
BEGIN
  -- inicializo las variables segun el tipo de dato, para cada validacion
  s_inci :='OK';
  s_campoVal:='TIPO DE HONORARIO';
  s_campo:='TIPO_HONORARIO';
  s_objeto:='pck_gador_malla_valida_datos.fn_gador_malla_val_thonor';
  -- valida el campo s_hono
  -->El campo 2 (Tipo de honorario), debe existir en la tabla TTAPTABL, con descripción TTAPVAAT y tipos de honorario MTIPHONO
  Frecep_Ga.Ver_Vaat(s_hono, w_hono);
  IF w_hono=0
  THEN
    s_inci:='S0301';
    s_error:='Tipo de honorario NO parametrizado';

    pr_gador_malla_grab_inci(id_factura,
                              w_inci,
                              p_pln,
                              s_campo,
                              s_inci,
                              s_hono,
                              r_fact,
                              c_sw_control,
                              s_error,
                              s_objeto);

  ELSE
    -->Cambiar estado de incidencia registrada por este el mismo motivo
    s_inci := 'S0301';
    pr_gador_malla_val_inci(id_factura,
                           p_pln,
                           s_campo,
                           s_inci,
                           r_fact
                           );
  END IF;
  -->El campo 2 (Tipo de honorario), debe existir en la tabla TTAPTABL, con descripción TTAPVAAT y tipos de honorario TGRABHON
  -->
  Frecep_Ga.ver_ehon(r_meds,s_soci,s_hono,w_hono);
  /*SELECT count (1)
    INTO w_hono
    FROM ttaptabl tb, ttapvaat tv
   WHERE tb.nmtabla=tv.nmtabla
     AND tb.cdtabla='TGRABHON'
     AND tv.otclave1=s_hono;*/
  IF w_hono=0
  THEN
    s_inci:='S0302';
    s_error:='Tipo de honorario NO aplica para prestador';

    pr_gador_malla_grab_inci(id_factura,
                              w_inci,
                              p_pln,
                              s_campo,
                              s_inci,
                              s_hono,
                              r_fact,
                              c_sw_control,
                              s_error,
                              s_objeto);
  ELSE
    -->Cambiar estado de incidencia registrada por este el mismo motivo
    s_inci := 'S0302';
    pr_gador_malla_val_inci(id_factura,
                           p_pln,
                           s_campo,
                           s_inci,
                           r_fact
                           );
  END IF;

  -->El campo 2 (Tipo de honorario), Debe existir entrada 7 (Prestador), el campo 2 (Código prestador socio) y campo 3 (Tipo de honorario), en la tabla THONPRES
  BEGIN
    SELECT COUNT (1)
      INTO w_hono
      FROM THONPRES
     WHERE cdpresta=r_meds
       AND cdsocio=s_soci
       AND cdtiphon=s_hono;
  EXCEPTION
  WHEN others THEN
    s_oraError := SQLERRM;
    pr_graba_error_plano(p_pln,
                     s_oraError,
                     'valida_datos.fn_gador_malla_val_thonor',
                     r_fact);
  END;

  IF w_hono=0
  THEN
    s_inci:='S0303';
    s_error:='Prestador NO tiene asociado tipo de honorario';

    pr_gador_malla_grab_inci(id_factura,
                              w_inci,
                              p_pln,
                              s_campo,
                              s_inci,
                              s_hono,
                              r_fact,
                              c_sw_control,
                              s_error,
                              s_objeto);
  ELSE
    -->Cambiar estado de incidencia registrada por este el mismo motivo
    s_inci := 'S0303';
    pr_gador_malla_val_inci(id_factura,
                           p_pln,
                           s_campo,
                           s_inci,
                           r_fact
                           );
  END IF;
  RETURN(s_inci);
EXCEPTION
WHEN OTHERS THEN
  s_oraError := SQLERRM;
  pr_graba_error_plano(p_pln,
                     s_oraError,
                     'valida_datos.fn_gador_malla_val_thonor',
                     r_fact);
  RETURN(s_inci);
END;
-- Versión    Autor            Fecha       Comentario
-- 1.0.000  Deissy Coral   17/10/2013   Creación - Funcion encargada de realizar las validaciones del campo 4 (Valor facturado socio) del archivo, Sociedades
FUNCTION fn_gador_malla_val_vfacso(id_factura    NUMBER,    --id factura
                                p_pln      VARCHAR2,  --nombre archivo
                                r_fact      VARCHAR2,  --Numero de Factura
                                s_vlor      VARCHAR2,  --Valor facturado socio
                                c_sw_control  VARCHAR2) RETURN VARCHAR2
IS
  w_vlor       NUMBER (3) := 0;
  v_vlor       NUMBER (14,2) := 0;
  --variables generales
  w_inci       NUMBER (10) := 1;
  w_inciA       NUMBER (10);
BEGIN
  -- inicializo las variables segun el tipo de dato, para cada validacion
  s_inci :='OK';
  s_campoVal:='VALOR FACTURADO SOCIO';
  s_campo:='VALOR_FACTURADO_SOCIO';
  s_objeto:='pck_gador_malla_valida_datos.fn_gador_malla_val_vfacso';
  -- valida el campo s_vlor
  -->El campo 4 (Valor facturado socio), debe ser  mayor de cero
  IF to_number(s_vlor)<=0
  THEN
    s_inci:='S0401';
    s_error:='Valor factura socio debe ser mayor que cero';

    pr_gador_malla_grab_inci(id_factura,
                              w_inci,
                              p_pln,
                              s_campo,
                              s_inci,
                              s_vlor,
                              r_fact,
                              c_sw_control,
                              s_error,
                              s_objeto);
  ELSE
    -->Cambiar estado de incidencia registrada por este el mismo motivo
    s_inci := 'S0401';
    pr_gador_malla_val_inci(id_factura,
                           p_pln,
                           s_campo,
                           s_inci,
                           r_fact
                           );
  END IF;
  RETURN(s_inci);
EXCEPTION
WHEN OTHERS THEN
  s_oraError := SQLERRM;
  pr_graba_error_plano(p_pln,
                     s_oraError,
                     'valida_datos.fn_gador_malla_val_vfacso',
                     r_fact);
  RETURN(s_inci);
END;
  /*
  CU 10
  VALIDACIONES DE TIPO DE REGISTRO DETALLE
  */
  -- Versión   Autor                       Fecha        Comentario
  -- 1.0.000   jlrodriguez-SoftManagement  18/09/2013   Creación - Funcion encargada de realizar las validaciones del campo 2 (fecha documento soporte)
  --                                                    de tipo detalle

   FUNCTION fn_gador_malla_fec_doc_sop (id_factura       NUMBER     --id_factura
                                        ,d_fec_doc_sop    VARCHAR2  --fecha documento soporte
                                        ,r_fing           VARCHAR2  --fecha ingreso
                                        ,r_fsal           VARCHAR2  --fecha salida
                                        ,p_pln            VARCHAR2  --nombre archivo
                                        ,r_fact           VARCHAR2  --numero de factura
                                        ,c_sw_control     VARCHAR2)
      RETURN VARCHAR2
   IS
  valFecha NUMBER(1):=0;
  --variables generales
  w_inci       NUMBER (10) := 1;
  w_inciA       NUMBER (10);
BEGIN
  -->Implementar validaciones de CU-10.0 Validar registros de tipo detalle - Flujo Normal de Trabajo - Paso 2
  -->Utilizar procedimientos [Pck_Epsga_Grb.Fec_Insa] fdoc=d_fec_doc_sop, fing=r_fing, fsal=r_fsal
  -->                        [Pck_Epsga_Grb.Fec_Vale] fdoc=d_fec_doc_sop

  s_inci :='OK';
  s_campoVal:='FECHA DOCUMENTO SOPORTE';
  s_campo:='FECHA_DOCUMENTO_SOPORTE';
  s_objeto:='pck_gador_malla_valida_datos.fn_gador_malla_fec_doc_sop';
  -->El campo 2 (fecha documento soporte) validar formato 'yyyymmdd', la fecha debe ser mayor al dia menos 2 años y menor o igual al dia
  valFecha := VALFE(p_pln, r_fact, d_fec_doc_sop,'0',1);
  IF valFecha=0
  THEN
    s_inci:='D0201';
    s_error:='Fecha documento soporte es incorrecta';

    pr_gador_malla_grab_inci(id_factura,
                              w_inci,
                              p_pln,
                              s_campo,
                              s_inci,
                              d_fec_doc_sop,
                              r_fact,
                              c_sw_control,
                              s_error,
                              s_objeto);
  ELSE
    -->Cambiar estado de incidencia registrada por este el mismo motivo
    s_inci := 'D0201';
    pr_gador_malla_val_inci(id_factura,
                           p_pln,
                           s_campo,
                           s_inci,
                           r_fact
                           );
  END IF;
  --El campo 2 (fecha documento soporte) validar que la fecha de documento sea mayor o igual a la fecha de ingreso
  -->Rev
  valFecha := VALFE(p_pln, r_fact, d_fec_doc_sop,r_fing,2);
  IF valFecha=0
  THEN
    s_inci:='D0202';
    s_error:='Fecha documento soporte es menor A fecha de ingreso';

    pr_gador_malla_grab_inci(id_factura,
                              w_inci,
                              p_pln,
                              s_campo,
                              s_inci,
                              d_fec_doc_sop,
                              r_fact,
                              c_sw_control,
                              s_error,
                              s_objeto);
  ELSE
    -->Cambiar estado de incidencia registrada por este el mismo motivo
    s_inci := 'D0202';
    pr_gador_malla_val_inci(id_factura,
                           p_pln,
                           s_campo,
                           s_inci,
                           r_fact
                           );
  END IF;
  --El campo 2 (fecha documento soporte) validar que la fecha de documento sea menor o igual a la fecha de salida
  -->Rev
  valFecha := VALFE(p_pln, r_fact, d_fec_doc_sop,r_fsal,3);
  IF valFecha=0
  THEN
    s_inci:='D0203';
    s_error:='Fecha documento soporte es mayor A fecha de salida';

    pr_gador_malla_grab_inci(id_factura,
                              w_inci,
                              p_pln,
                              s_campo,
                              s_inci,
                              d_fec_doc_sop,
                              r_fact,
                              c_sw_control,
                              s_error,
                              s_objeto);
  ELSE
    -->Cambiar estado de incidencia registrada por este el mismo motivo
    s_inci := 'D0203';
    pr_gador_malla_val_inci(id_factura,
                           p_pln,
                           s_campo,
                           s_inci,
                           r_fact
                           );
  END IF;
    RETURN (s_inci);
EXCEPTION
WHEN OTHERS THEN
  s_oraError := SQLERRM;
  pr_graba_error_plano(p_pln,
                     s_oraError,
                     'valida_datos.fn_gador_malla_fec_doc_sop',
                     r_fact);
  RETURN(s_inci);
END fn_gador_malla_fec_doc_sop;
   -- Versión   Autor           Fecha        Comentario
  -- 1.0.000   Deissy Coral  18/09/2013   Creación - Funcion encargada de validar el CU 10, campo 2
  FUNCTION VALFE(p_pln            VARCHAR2  --nombre archivo
                 ,r_fact          VARCHAR2  --numero de factura
                 ,fecha          VARCHAR2
                 ,fechV           VARCHAR2
                 ,validar         NUMBER)
  RETURN NUMBER
  IS
    v_fecha DATE;
    val NUMBER(1):=0;
  BEGIN
    --validar formato de fecha tipo yyyymmdd y la fecha debe ser mayor al dia menos 2 años y menor o igual al dia
    IF validar=1
    THEN
      v_fecha := to_date(fecha,'dd/mm/yy');
      SELECT count(*)
        INTO val
        FROM dual
       WHERE to_date(fecha,'dd/mm/yy')>to_date(to_char(add_months(sysdate,-24),'dd/mm/yy'),'dd/mm/yy')
         AND to_date(fecha,'dd/mm/yy')<=to_date(to_char(sysdate,'dd/mm/yy'),'dd/mm/yy');
    END IF;

    IF validar=2
    THEN
      IF to_date(fecha,'dd/mm/yy') >=  to_date(fechV,'dd/mm/yy')
      THEN
        val:=1;
      END IF;
    END IF;
    IF validar=3
    THEN
      IF to_date(fecha,'dd/mm/yy') <=  to_date(fechV,'dd/mm/yy')
      THEN
        val:=1;
      END IF;
    END IF;
    RETURN (val);
  EXCEPTION
    WHEN others THEN
    s_oraError := SQLERRM;
    pr_graba_error_plano(p_pln,
                       s_oraError,
                       'valida_datos.valfe',
                       r_fact);
    RETURN (val);
  END VALFE;
  -- Versión  Autor                       Fecha        Comentario
  -- 1.0.000  jlrodriguez-SoftManagement  18/09/2013   Creación - Procedimiento encargado de realizar las validaciones del campo 3 (tipo documento soporte)
  --                                                   de tipo detalle

   PROCEDURE pr_gador_malla_tip_doc_sop (id_factura    IN       NUMBER       --id_factura
                                        ,d_tip_doc_sop  IN OUT   VARCHAR2     --tipo documento_soporte
                                        ,p_pln          IN       VARCHAR2     --nombre archivo
                                        ,r_fact         IN       VARCHAR2     --numero de factura
                                        ,p_cdramo       OUT      VARCHAR2     --Retorna CDRAMO
                                        ,p_nmpoliza     OUT      VARCHAR2     --Retorna NMPOLIZA
                                        ,r_meds      IN    VARCHAR2    --Codigo Prestador
                                        ,s_inci      OUT    VARCHAR2  --incidencia
                                        ,c_sw_control   IN       VARCHAR2
                                        ,p_cuam        IN      Varchar2 --(JaFarias) Nueva validación Honorario-Tipo Servicio y Clase 22/05/2014
                                        ,p_nsolvol     IN      Number--(JaFarias) Nueva validación Honorario-Tipo Servicio y Clase 22/05/2014
                                        ,p_cia         IN      Varchar2--(JaFarias) Nueva validación Honorario-Tipo Servicio y Clase 22/05/2014
                                        ,s_hono IN Varchar2 --(JaFarias) Nueva validación Honorario-Tipo Servicio y Clase 22/05/2014
                                        )
   IS
  w_tip_doc_sop NUMBER (3) := 0;
  v_otv1      VARCHAR2 (15);
  v_otv2      VARCHAR2 (15);
  noj       NUMBER(1):=0;
   --variables generales
  w_inci       NUMBER (10) := 1;
  w_inciA       NUMBER (10);

  --Inicio Declaracion de Variables Nueva Validacion de Tipo honorario, Clase y tipo Servicio JaFarias 22/05/2014
  dd_norj Number;
  vramo   Number;
  vcto    Number;
  vfmus   Number;
  vtip    Varchar2(500);
  vcla    Varchar2(500);
  vdia    Number;
  vccos   Varchar2(500);
  nmpra   Number;
  nmord   Number;
  cdord   Varchar2(500);
  p_seq   Number;
  p_est   Number;
  q_est   Number;
  --Fin Declaracion

   BEGIN
      -->Implementar validaciones de CU-10.0 Validar registros de tipo detalle - Flujo Normal de Trabajo - Paso 3
      -->Utilizar procedimientos [Pck_Epsga_Grb.Val_Tdoc] tdoc=d_tip_doc_sop
      -->                        [Pck_Epsga_Grb.Noj_Tdoc] tdoc=d_tip_doc_sop
      -->                        [Frecep_Ga.Ver_Norj] <-- Para obtener atributo 10  v_med=r_meds ***
    -- inicializo las variables segun el tipo de dato, para cada validacion
  s_inci :='OK';
  s_campoVal:='TIPO DOCUMENTO SOPORTE';
  s_campo:='TIPO_DOCUMENTO_SOPORTE';
  s_objeto:='pck_gador_malla_valida_datos.pr_gador_malla_tip_doc_sop';
  ---->El campo 3 (Tipo documento soporte),debe tener un registro en la tabla de tipos de documento soporte (TTDOCSOP)
  Pck_Epsga_Grb.Val_Tdoc(d_tip_doc_sop,w_tip_doc_sop);
  -->Tipo no existe para tipo de documento
  -->Rev
  IF w_tip_doc_sop=0  THEN
    s_inci:='D0301';
    s_error:='Tipo documento soporte NO existe';

    pr_gador_malla_grab_inci(id_factura,
                              w_inci,
                              p_pln,
                              s_campo,
                              s_inci,
                              d_tip_doc_sop,
                              r_fact,
                              c_sw_control,
                              s_error,
                              s_objeto);
  ELSE
    -->Cambiar estado de incidencia registrada por este el mismo motivo
    s_inci := 'D0301';
    pr_gador_malla_val_inci(id_factura,
                           p_pln,
                           s_campo,
                           s_inci,
                           r_fact
                           );
  END IF;
  ---->El campo 3 (Tipo documento soporte),debe tener un registro TTAPTABL, que tenga una descripción TTAPVAAT, para los tipos TDOCPRES
  -->Rev
  Pck_Epsga_Grb.noj_tdoc(d_tip_doc_sop,v_otv1,v_otv2);
  Frecep_Ga.Ver_Norj(r_meds,noj);
  -- si es N-> 1, S->2
  IF (noj=1 AND v_otv1<>'S') OR (noj=2 AND v_otv2<>'S') OR v_otv1='0'
  THEN
    s_inci:='D0302';
    s_error:='Tipo de documento NO aplica para prestador';

    pr_gador_malla_grab_inci(id_factura,
                              w_inci,
                              p_pln,
                              s_campo,
                              s_inci,
                              d_tip_doc_sop,
                              r_fact,
                              c_sw_control,
                              s_error,
                              s_objeto);
  ELSE
    -->Cambiar estado de incidencia registrada por este el mismo motivo
    s_inci := 'D0302';
    pr_gador_malla_val_inci(id_factura,
                           p_pln,
                           s_campo,
                           s_inci,
                           r_fact
                           );
  END IF;
  ---->El campo 3 (Tipo documento soporte),no debe ser X para grabacion automatica
  -->Rev
  IF d_tip_doc_sop='X'
  THEN
    s_inci:='D0303';
    s_error:='Tipo de documento X NO válido para grabación automática';

    pr_gador_malla_grab_inci(id_factura,
                              w_inci,
                              p_pln,
                              s_campo,
                              s_inci,
                              d_tip_doc_sop,
                              r_fact,
                              c_sw_control,
                              s_error,
                              s_objeto);
  ELSE
    -->Cambiar estado de incidencia registrada por este el mismo motivo
    s_inci := 'D0303';
    pr_gador_malla_val_inci(id_factura,
                           p_pln,
                           s_campo,
                           s_inci,
                           r_fact
                           );
  END IF;
  ---->El campo 3 (Tipo documento soporte),no debe ser diferente a V, O, S y X
  -->Rev
  IF d_tip_doc_sop<>'V' AND d_tip_doc_sop<>'O' AND d_tip_doc_sop<>'S' AND d_tip_doc_sop<>'X'
  THEN
    s_inci:='D0304';
    s_error:='Documento soporte inválido';

    pr_gador_malla_grab_inci(id_factura,
                              w_inci,
                              p_pln,
                              s_campo,
                              s_inci,
                              d_tip_doc_sop,
                              r_fact,
                              c_sw_control,
                              s_error,
                              s_objeto);
  ELSE
    -->Cambiar estado de incidencia registrada por este el mismo motivo
    s_inci := 'D0304';
    pr_gador_malla_val_inci(id_factura,
                           p_pln,
                           s_campo,
                           s_inci,
                           r_fact
                           );
  END IF;


  --Inicio JaFarias (Se incluye validación de honorario, clase y tipo de servicio) 22/05/2014
  IF p_nsolvol > 0 THEN

   Pck_EpsGa_Grb.Dat_Vlte(p_nsolvol,noj,vramo,vcto,vfmus,vtip,vcla,vdia,vccos,nmpra,nmord,cdord);--Consulta datos del volante

   IF vramo IS NOT NULL AND s_hono IS NOT NULL AND vtip IS NOT NULL AND vcla IS NOT NULL THEN --JaFarias 12/06/2014

      Pck_EpsGa_Grb.Valida_Hono_Pes(To_Number(p_cia),vramo,vcto,s_hono,vtip,vcla,p_cuam,p_seq,p_est);--Valida relacion entre honorario, clase y tipo de servicio

      IF p_est = 0 THEN

      Pck_EpsGa_Grb.Tipo_Documento(d_tip_doc_sop,p_seq,q_est);

      IF q_est <> 0 THEN

        IF p_est = -2 THEN

           s_inci:='D0305';
           s_error:='No existe tipo de documento';

           pr_gador_malla_grab_inci(id_factura,
                                    w_inci,
                                    p_pln,
                                    s_campo,
                                    s_inci,
                                    NULL,
                                    r_fact,
                                    c_sw_control,
                                    s_error,
                                    s_objeto);
        ELSIF p_est = -1 THEN

           s_inci:='D0305';
           s_error:='Tipo documento no parametrizado para el honorario, tipo servicio, clase y contrato digitado.';

           pr_gador_malla_grab_inci(id_factura,
                                    w_inci,
                                    p_pln,
                                    s_campo,
                                    s_inci,
                                    NULL,
                                    r_fact,
                                    c_sw_control,
                                    s_error,
                                    s_objeto);



        ELSE
           -->Cambiar estado de incidencia registrada por este el mismo motivo
            s_inci := 'D0305';
            pr_gador_malla_val_inci(id_factura,
                                 p_pln,
                                 s_campo,
                                 s_inci,
                                 r_fact
                                 );
        END IF;

      ELSE

       s_inci := 'D0305';
       pr_gador_malla_val_inci(id_factura,
                               p_pln,
                               s_campo,
                               s_inci,
                               r_fact
                               );

      END IF;

     ELSE

      s_inci:='D0305';
      s_error:='Combinación de honorario, tipo servicio, clase y contrato no válida.';

           pr_gador_malla_grab_inci(id_factura,
                                    w_inci,
                                    p_pln,
                                    s_campo,
                                    s_inci,
                                    NULL,
                                    r_fact,
                                    c_sw_control,
                                    s_error,
                                    s_objeto);
  END IF;
  END IF;
 END IF;
  --Fin Modificacion JaFarias


EXCEPTION
WHEN OTHERS THEN
  s_oraError := SQLERRM;
  pr_graba_error_plano(p_pln,
                     s_oraError,
                     'valida_datos.pr_gador_malla_tip_doc_sop',
                     r_fact);
END pr_gador_malla_tip_doc_sop;

   -- Versión  Autor                       Fecha        Comentario
   -- 1.0.000  jlrodriguez-SoftManagement  18/09/2013   Creación - Funcion encargada de realizar las validaciones del campo 4 (Número documento soporte)
   --                                                   de tipo detalle

   PROCEDURE fn_gador_malla_nro_doc_sop (  id_factura       IN NUMBER    --id factura
                              ,d_nro_doc_sop   IN VARCHAR2  --número documento de soporte
                              ,d_tip_doc_sop   IN VARCHAR2  --tipo documento de soporte
                              ,r_cias          IN VARCHAR2  --unidad económica
                              ,d_plan          IN VARCHAR2    --plan
                              ,d_contrato      IN VARCHAR2    --contrato
                              ,d_familia       IN VARCHAR2   --familia
                              ,p_pln           IN VARCHAR2  --nombre archivo
                              ,r_fact          IN VARCHAR2  --número factura
                              ,s_inci       OUT VARCHAR2
                              ,v_pln       OUT NUMBER
                              ,v_cto       OUT NUMBER
                              ,c_sw_control    IN VARCHAR2)

   IS
   -->variables para campos de trabajo
   v_ct1_cob_bar   NUMBER(14);
   v_ct2_num_vale  VARCHAR2(10);
   w_nro_doc_sop   NUMBER(1):=0;
   v_fam      NUMBER(4);
   v_est       VARCHAR2(1);
   v_rad      NUMBER(10);
   w_mgrab      NUMBER(3):=0;
   --variables generales
  w_inci       NUMBER (10) := 1;
  w_inciA       NUMBER (10);
  v_cias       NUMBER(3);

   BEGIN
      -->Implementar validaciones de CU-10.0 Validar registros de tipo detalle - Flujo Normal de Trabajo - Paso 4
      -->Utilizar procedimientos [Pck_Epsga_Grb.Cod_Barr] v_bar=v_ct1_cob_bar, t_doc=d_nro_doc_sop, v_cia=r_cias
      -->                        [Pck_Epsga_Grb.Val_Barr] v_cia=r_cias, ndoc=v_ct2_num_vale
  s_inci :='OK';
  s_campoVal:='NRO_DOCUMENTO_SOPORTE';
  s_campo:='NRO_DOCUMENTO_SOPORTE';
  s_objeto:='pck_gador_malla_valida_datos.fn_gador_malla_nro_doc_sop';
  v_cias := to_number(nvl(r_cias,'0'));
  ---->El campo 4 (Numero documento soporte), para Tipo documento soporte=V
  IF d_tip_doc_sop='V'
  THEN
    --extraer los 14 caracteres
    SELECT to_number(SUBSTR(d_nro_doc_sop, 4, 13)) INTO v_ct1_cob_bar
    FROM DUAL;
    --El campo 4 (Número documento soporte), el codigo de barras no debe ser igual a cero
    IF v_ct1_cob_bar=0
    THEN
      s_inci:='D0401';
      s_error:='Falta vale de asistencia médica';
      pr_gador_malla_grab_inci(id_factura,
                              w_inci,
                              p_pln,
                              s_campo,
                              s_inci,
                              d_nro_doc_sop,
                              r_fact,
                              c_sw_control,
                              s_error,
                              s_objeto);

    ELSE
    -->Cambiar estado de incidencia registrada por este el mismo motivo
    s_inci := 'D0401';
    pr_gador_malla_val_inci(id_factura,
                           p_pln,
                           s_campo,
                           s_inci,
                           r_fact
                           );
    END IF;

    --cuando el codigo de barras es mayor a cero
    IF v_ct1_cob_bar>0
    THEN

      --debe tener un registro para el dato de entrada 21 (Compañía) y el campo 3 (Tipo documento soporte), en la tabla CODSERBARRAS
      Pck_Epsga_Grb.Cod_Barr(v_ct1_cob_bar,d_tip_doc_sop,v_cias,w_nro_doc_sop);
      IF w_nro_doc_sop=0
      THEN
        s_inci:='D0402';
        s_error:='Código de barras NO es correcto';
        pr_gador_malla_grab_inci(id_factura,
                              w_inci,
                              p_pln,
                              s_campo,
                              s_inci,
                              d_nro_doc_sop,
                              r_fact,
                              c_sw_control,
                              s_error,
                              s_objeto);
      ELSE
        -->Cambiar estado de incidencia registrada por este el mismo motivo
        s_inci := 'D0402';
        pr_gador_malla_val_inci(id_factura,
                               p_pln,
                               s_campo,
                               s_inci,
                               r_fact
                               );
      END IF;

      IF w_nro_doc_sop <> 0
      THEN
        --extraer los 10 últimos caracteres
        SELECT to_number(SUBSTR(d_nro_doc_sop, 19, 10)) INTO v_ct2_num_vale
        FROM DUAL;
        --El campo de trabajo 2 (Número de Vale) debe tener un registro para el dato de entrada 21 (Compañía), en la tabla de vales por compañía (MVALESOP)

        Pck_Epsga_Grb.Val_Barr(r_cias,v_ct2_num_vale,v_pln,v_cto,v_fam,v_est);

        IF v_est = 'X'
        THEN
          s_inci:='D0403';
          s_error:='Vale de asistencia NO existe';

          pr_gador_malla_grab_inci(id_factura,
                              w_inci,
                              p_pln,
                              s_campo,
                              s_inci,
                              d_nro_doc_sop,
                              r_fact,
                              c_sw_control,
                              s_error,
                              s_objeto);
        ELSE
          -->Cambiar estado de incidencia registrada por este el mismo motivo
          s_inci := 'D0403';
          pr_gador_malla_val_inci(id_factura,
                                 p_pln,
                                 s_campo,
                                 s_inci,
                                 r_fact
                                 );
        END IF;

        --si existe el registro en mvalesop, el estado debe ser cero
        IF v_est <> 'X' AND v_est <> '0'
        THEN
          s_inci:='D0404';
          s_error:='Vale anulado desde cajas';

          pr_gador_malla_grab_inci(id_factura,
                            w_inci,
                            p_pln,
                            s_campo,
                            s_inci,
                            d_nro_doc_sop,
                            r_fact,
                            c_sw_control,
                            s_error,
                            s_objeto);
        ELSE
          -->Cambiar estado de incidencia registrada por este el mismo motivo
          s_inci := 'D0404';
          pr_gador_malla_val_inci(id_factura,
                                 p_pln,
                                 s_campo,
                                 s_inci,
                                 r_fact
                                 );
        END IF;
      END IF;
    END IF;
  END IF;


  /*
    --si existe el registro en mvalesop, NMRADICA  debe ser nulo

    SELECT NMRADICA
      INTO   v_rad
      FROM   mvalesop
      WHERE  cdunieco = r_cias
        AND    nmvalein = v_ct2_num_vale
      AND    ROWNUM < 2;
    IF v_rad IS NOT NULL
    THEN
      s_inci:='D0405';
      s_error:='Vale utilizado en factura:'|| v_rad;

      pr_gador_malla_grab_inci(id_factura,
                        w_inci,
                        p_pln,
                        s_campo,
                        s_inci,
                        d_nro_doc_sop,
                        r_fact,
                        c_sw_control,
                        s_error,
                        s_objeto);
    ELSE
      -->Cambiar estado de incidencia registrada por este el mismo motivo
      s_inci := 'D0405';
      pr_gador_malla_val_inci(id_factura,
                             p_pln,
                             s_campo,
                             s_inci,
                             r_fact
                             );
    END IF;*/
    --si existe el registro en mvalesop, no debe tener registros en MGRABCUE con compañia y CDDOCSOP = ¿V¿
    
    BEGIN
      SELECT NMRADICA
        INTO   v_rad
        FROM   MGRABCUE
        WHERE  CDDOCSOP = 'V'
        AND    cdunieco = r_cias
        AND    cdramo   = d_plan
        AND    nmpoliza = d_contrato
        AND    nmsituac > 0
        AND    nmdocsop = SUBSTR(d_nro_doc_sop, 19, 10)
        AND    ROWNUM = 1;
    EXCEPTION
     WHEN no_data_found THEN
       v_rad := 0;
    END;
    
    IF v_rad <> 0
    THEN
      S_Inci:='D0405';
      s_error:='Vale utilizado en otra factura:'|| v_rad;

      pr_gador_malla_grab_inci(id_factura,
                        w_inci,
                        p_pln,
                        s_campo,
                        s_inci,
                        d_nro_doc_sop,
                        r_fact,
                        c_sw_control,
                        s_error,
                        s_objeto);
    ELSE
      -->Cambiar estado de incidencia registrada por este el mismo motivo
      s_inci := 'D0405';
      pr_gador_malla_val_inci(id_factura,
                             p_pln,
                             s_campo,
                             s_inci,
                             r_fact
                             );
    END IF;
  --END IF;

  -->El campo 4 (Numero documento soporte), para Tipo documento soporte=S
  IF d_tip_doc_sop='S'
  THEN
    --extraer los 10 caracteres
    SELECT to_number(substr(d_nro_doc_sop, 19, 10))
      INTO v_ct2_num_vale
      FROM dual;
    IF v_ct2_num_vale<=0
    THEN
      s_inci:='D0407';
      s_error:='Documento soporte (S) debe ser mayor A cero';

      pr_gador_malla_grab_inci(id_factura,
                              w_inci,
                              p_pln,
                              s_campo,
                              s_inci,
                              d_nro_doc_sop,
                              r_fact,
                              c_sw_control,
                              s_error,
                              s_objeto);
    ELSE
      -->Cambiar estado de incidencia registrada por este el mismo motivo
      s_inci := 'D0407';
      pr_gador_malla_val_inci(id_factura,
                             p_pln,
                             s_campo,
                             s_inci,
                             r_fact
                             );
    END IF;
  END IF;
  ---->El campo 4 (Numero documento soporte), para Tipo documento soporte=O
  IF d_tip_doc_sop='O'
  THEN
    --extraer los 10 caracteres
    SELECT to_number(SUBSTR(d_nro_doc_sop, 1, 10)) INTO v_ct2_num_vale
    FROM DUAL;
    IF v_ct2_num_vale<>0
    THEN
      s_inci:='D0408';
      s_error:='Documento soporte (O) debe ser igual A cero';

      pr_gador_malla_grab_inci(id_factura,
                              w_inci,
                              p_pln,
                              s_campo,
                              s_inci,
                              d_nro_doc_sop,
                              r_fact,
                              c_sw_control,
                              s_error,
                              s_objeto);
    ELSE
     -->Cambiar estado de incidencia registrada por este el mismo motivo
      s_inci := 'D0408';
      pr_gador_malla_val_inci(id_factura,
                             p_pln,
                             s_campo,
                             s_inci,
                             r_fact
                             );
    END IF;
  END IF;
EXCEPTION
WHEN OTHERS THEN
  s_oraError := SQLERRM;
  pr_graba_error_plano(p_pln,
                     s_oraError,
                     'valida_datos.fn_gador_malla_nro_doc_sop',
                     r_fact);
END fn_gador_malla_nro_doc_sop;

   -- Versión  Autor                       Fecha        Comentario
   -- 1.0.000  jlrodriguez-SoftManagement  18/09/2013   Creación - Funcion encargada de realizar las validaciones del campo 5 (Secuencia documento soporte)
   --                                                   de tipo detalle

   FUNCTION fn_gador_malla_sec_doc_sop (id_factura       NUMBER    --id factura
                                        ,d_sec_doc_sop    VARCHAR2    --secuencia documento soporte
                                        ,p_pln            VARCHAR2  --nombre archivo
                                        ,r_fact           VARCHAR2  --numero factura
                                        ,c_sw_control     VARCHAR2)
      RETURN VARCHAR2
   IS
   --variables generales
  w_inci       NUMBER (10) := 1;
  w_inciA       NUMBER (10);
   BEGIN
      -->Implementar validaciones de CU-10.0 Validar registros de tipo detalle - Flujo Normal de Trabajo - Paso 5
    -- inicializo las variables segun el tipo de dato, para cada validacion
    s_inci :='OK';
    s_campoVal:='SECUENCIA DOCUMENTO SOPORTE';
    s_campo:='SECUENCIA_DOC_SOPORT';
    s_objeto:='pck_gador_malla_valida_datos.fn_gador_malla_sec_doc_sop';
    -- valida el campo d_sec_doc_sop
    -- NO HAY CODIGO DE INCIDENCIA NI DESCRICPION DEL ERROR
    IF TO_NUMBER(d_sec_doc_sop)<>0
    THEN
      s_inci:='';
      s_error:='';
      pr_gador_malla_grab_inci(id_factura,
                              w_inci,
                              p_pln,
                              s_campo,
                              s_inci,
                              d_sec_doc_sop,
                              r_fact,
                              c_sw_control,
                              s_error,
                              s_objeto);
    ELSE
      -->Cambiar estado de incidencia registrada por este el mismo motivo
      s_inci := '';
      pr_gador_malla_val_inci(id_factura,
                             p_pln,
                             s_campo,
                             s_inci,
                             r_fact
                             );
    END IF;
    RETURN s_inci;
EXCEPTION
WHEN OTHERS THEN
  s_oraError := SQLERRM;
  pr_graba_error_plano(p_pln,
                     s_oraError,
                     'valida_datos.fn_gador_malla_sec_doc_sop',
                     r_fact);
  RETURN(s_inci);
END fn_gador_malla_sec_doc_sop;

   -- Versión  Autor                       Fecha        Comentario
   -- 1.0.000  jlrodriguez-SoftManagement  18/09/2013   Creación - Funcion encargada de realizar las validaciones del campo 6 (plan)
   --                                                   de tipo detalle

FUNCTION fn_gador_malla_plan (id_factura      NUMBER    --id factura
               ,d_plan          VARCHAR2    --plan
               ,p_cia           VARCHAR2  --compañia
               ,d_contrato      VARCHAR2  --contrato
               ,d_familia       VARCHAR2  --familia
               ,d_usuario       VARCHAR2  --usuario
               ,p_pln           VARCHAR2  --nombre archivo
               ,r_fact          VARCHAR2  --numero factura
               ,c_sw_control    VARCHAR2)
    RETURN VARCHAR2
IS
  w_plan     NUMBER(5):=0;
   --variables generales
  w_inci       NUMBER (10) := 1;
  w_inciA       NUMBER (10);
BEGIN
    -->Implementar validaciones de CU-10.0 Validar registros de tipo detalle - Flujo Normal de Trabajo - Paso 6
    -->Utilizar procedimientos [Vramos_Ga] ramo=d_plan, dcias=p_cia, vcont=d_contrato, vflia=d_familia, vusur=d_usuario ***
  -- inicializo las variables segun el tipo de dato, para cada validacion
  s_inci :='OK';
  s_campoVal:='PLAN';
  s_campo:='PLAN';
  s_objeto:='pck_gador_malla_valida_datos.fn_gador_malla_plan';
  -- valida el campo d_plan
  -->El campo 6 (Plan), debe existir en TRAMOS
  SELECT COUNT(1)
    INTO w_plan
    FROM TRAMOS
    WHERE cdramo=d_plan;
  IF w_plan=0
  THEN
    s_inci:='D0601';
    s_error:='Código de PLAN NO parametrizado';
    pr_gador_malla_grab_inci(id_factura,
                              w_inci,
                              p_pln,
                              s_campo,
                              s_inci,
                              d_plan,
                              r_fact,
                              c_sw_control,
                              s_error,
                              s_objeto);
  ELSE
    -->Cambiar estado de incidencia registrada por este el mismo motivo
    s_inci := 'D0601';
    pr_gador_malla_val_inci(id_factura,
                           p_pln,
                           s_campo,
                           s_inci,
                           r_fact
                           );
  END IF;
  -->El campo 6 (Plan) debe tener un registro para el dato de entrada 21 (Compañía), en la tabla MUNIDRAM
  --NO SE USO EL PROCEDIMIENTO INDICADO PORQUE NO HACE CONSULTA EN LA TABLA MUNIDRAM - Vramos_Ga
  -->Rev
  SELECT COUNT(1)
    INTO w_plan
    FROM MUNIDRAM
    WHERE cdramo=d_plan
    AND cdunieco=p_cia;
  IF w_plan=0
  THEN
    s_inci:='D0602';
    s_error:='PLAN NO asociado A compañía';

    pr_gador_malla_grab_inci(id_factura,
                              w_inci,
                              p_pln,
                              s_campo,
                              s_inci,
                              d_plan,
                              r_fact,
                              c_sw_control,
                              s_error,
                              s_objeto);
  ELSE
    -->Cambiar estado de incidencia registrada por este el mismo motivo
    s_inci := 'D0602';
    pr_gador_malla_val_inci(id_factura,
                           p_pln,
                           s_campo,
                           s_inci,
                           r_fact
                           );
  END IF;
    RETURN s_inci;
EXCEPTION
WHEN OTHERS THEN
  s_oraError := SQLERRM;
  pr_graba_error_plano(p_pln,
                     s_oraError,
                     'valida_datos.fn_gador_malla_plan',
                     r_fact);

  RETURN(s_inci);
END fn_gador_malla_plan;

   -- Versión  Autor                       Fecha        Comentario
   -- 1.0.000  jlrodriguez-SoftManagement  18/09/2013   Creación - Función encargada de realizar las validaciones del campo 7 (Contrato)
   --                                                   de tipo detalle

FUNCTION fn_gador_malla_contrato (id_factura       NUMBER   --id factura
                 ,d_contrato       VARCHAR2   --contrato
                 ,d_plan           VARCHAR2   --plan
                 ,p_cia            VARCHAR2 --compañía
                 ,d_fec_doc_sop    VARCHAR2 --fecha documento soporte
                 ,d_tip_doc_sop    VARCHAR2 --tipo documento soporte
                 ,p_pln            VARCHAR2 --nombre archivo
                 ,r_fact           VARCHAR2 --número factura
                 ,p_cdramo         VARCHAR2 --cdramo de MVALESOP (Validación campo 3)
                 ,p_nmpoliza       VARCHAR2 --nmpoliza de MVALESOP  (Validación campo 3)
                 ,c_sw_control     VARCHAR2)
  RETURN VARCHAR2
IS
  w_contrato   NUMBER(3):=0;
  --variables generales
  w_inci       NUMBER (10) := 1;
  W_Incia       Number (10);
  W_count Number;

BEGIN
  -->Implementar validaciones de CU-10.0 Validar registros de tipo detalle - Flujo Normal de Trabajo - Paso 7
  -->Utilizar procedimientos [Pck_Epsga_Grb.Usr_Mpol] v_cia=p_cia, ramo=d_plan, cto=d_contrato, fdoc=d_fec_doc_sop ***
  -- inicializo las variables segun el tipo de dato, para cada validacion
  s_inci :='OK';
  s_campoVal:='CONTRATO';
  s_campo:='CONTRATO';
  s_objeto:='pck_gador_malla_valida_datos.fn_gador_malla_contrato';
  -- valida el campo d_plan
  -->El campo 7 (Contrato), debe existir en MPOLIZAS, estado 0 y cdmotanu null
  -- no existe el campo CDESTADO, se utiliza SWESTADO

  --anperez. cambio del orden de la consulta realizando por indice.
  SELECT COUNT(1)
  INTO   w_contrato
  FROM   mpolizas A
  WHERE  A.cdunieco = p_cia
  AND    A.cdramo = to_number(d_plan)
  AND    A.estado = 'M'
  AND    A.nmpoliza = d_contrato
  AND    A.cdmotanu IS NULL
  AND    A.swestado = '0'
  AND    A.nmsuplem =
         (SELECT MAX(b.nmsuplem)
           FROM   mpolizas b
           WHERE  b.cdunieco = A.cdunieco
           AND    b.cdramo = A.cdramo
           AND    b.estado = A.estado --anperez
           AND    b.nmpoliza = A.nmpoliza
         --  AND    b.cdmotanu IS NULL
           AND    b.nmsuplem <=
                  to_number(to_char(to_date(d_fec_doc_sop, 'dd/mm/yyyy'), 'j') ||
                             '0000' || '0000000'));

  IF w_contrato=0
  THEN
    s_inci:='D0701';
    s_error:='Contrato inactivo';

    pr_gador_malla_grab_inci(id_factura,
                              w_inci,
                              p_pln,
                              s_campo,
                              s_inci,
                              d_contrato,
                              r_fact,
                              c_sw_control,
                              s_error,
                              s_objeto);
  ELSE
    -->Cambiar estado de incidencia registrada por este el mismo motivo
    s_inci := 'D0701';
    pr_gador_malla_val_inci(id_factura,
                           p_pln,
                           s_campo,
                           s_inci,
                           r_fact
                           );
  END IF;
  -->El campo 7 (Contrato), no debe existir en MPOLIZAS con estado 2 y cdmotanu no null
  -- no existe el campo CDESTADO, se utiliza SWESTADO
  
  SELECT COUNT(1)
  INTO   w_contrato
  FROM   mpolizas A
  WHERE  A.cdunieco = p_cia
  AND    A.cdramo = d_plan
  AND    A.estado = 'M'
  AND    A.nmpoliza = d_contrato
  AND    A.cdmotanu IS NOT NULL
  AND    A.swestado = 2
  AND    A.nmsuplem =
         (SELECT MAX(b.nmsuplem)
           FROM   mpolizas b
           WHERE  b.cdunieco = A.cdunieco
           AND    b.cdramo = A.cdramo
           AND    b.estado = A.estado --anperez
           AND    B.Nmpoliza = A.Nmpoliza
           AND    B.Cdmotanu IS NOT NULL
           AND    B.swestado = A.swestado
           --AND    b.cdmotanu IS NOT NULL
           AND    b.nmsuplem <=
                  to_number(to_char(to_date(d_fec_doc_sop, 'dd/mm/yyyy'), 'j') ||
                             '0000' || '0000000'));
  IF W_Contrato>0
  THEN
    s_inci:='D0702';
    s_error:='Contrato Suspendido';

    pr_gador_malla_grab_inci(id_factura,
                              w_inci,
                              p_pln,
                              s_campo,
                              s_inci,
                              d_contrato,
                              r_fact,
                              c_sw_control,
                              s_error,
                              s_objeto);
  ELSE
    -->Cambiar estado de incidencia registrada por este el mismo motivo
    s_inci := 'D0702';
    pr_gador_malla_val_inci(id_factura,
                           p_pln,
                           s_campo,
                           s_inci,
                           r_fact
                           );
  END IF;
  -->El campo 7 (Contrato), no debe existir en MPOLIZAS cdmotanu no null y FEANULAC no null
  SELECT COUNT(1)
  INTO   w_contrato
  FROM   mpolizas A
  WHERE   A.cdunieco = p_cia
  AND    A.cdramo = d_plan
  AND    A.estado = 'M'
  AND    A.nmpoliza = d_contrato
  AND    A.cdmotanu IS NOT NULL
  AND    A.feanulac IS NOT NULL
  AND    A.nmsuplem =
         (SELECT MAX(b.nmsuplem)
           FROM   mpolizas b
           WHERE  b.cdunieco = A.cdunieco
           AND    b.cdramo = A.cdramo
           AND    b.estado = A.estado
           AND    b.nmpoliza = A.nmpoliza
           --AND    b.cdmotanu IS NOT NULL
         --  AND    b.feanulac IS NOT NULL
           AND    b.nmsuplem <=
                  to_number(to_char(to_date(d_fec_doc_sop, 'dd/mm/yyyy'), 'j') ||
                             '0000' || '0000000'));
  IF w_contrato>0
  THEN
    s_inci:='D0703';
    s_error:='Contrato Cancelado';

    pr_gador_malla_grab_inci(id_factura,
                              w_inci,
                              p_pln,
                              s_campo,
                              s_inci,
                              d_contrato,
                              r_fact,
                              c_sw_control,
                              s_error,
                              s_objeto);
  ELSE
    -->Cambiar estado de incidencia registrada por este el mismo motivo
    s_inci := 'D0703';
    pr_gador_malla_val_inci(id_factura,
                           p_pln,
                           s_campo,
                           s_inci,
                           r_fact
                           );
  END IF;
  -->El campo 7 (Contrato), debe existir en MPOLIZAS para cia, contrato y plan

  --Pck_Epsga_Grb.Usr_Mpol(p_cia,d_plan,d_contrato,to_char(to_date(d_fec_doc_sop,'DD/MM/YYYY'),'YYYYMMDD'),w_contrato);

  SELECT COUNT(1)
  INTO   w_contrato
  FROM   mpolizas A
  WHERE   A.cdunieco = p_cia
  AND    A.cdramo = d_plan
  AND    A.estado = 'M'
  AND    A.nmpoliza = d_contrato;

  IF w_contrato=0
  THEN
    s_inci:='D0704';
    s_error:='Contrato NO existe';

    pr_gador_malla_grab_inci(id_factura,
                              w_inci,
                              p_pln,
                              s_campo,
                              s_inci,
                              d_contrato,
                              r_fact,
                              c_sw_control,
                              s_error,
                              s_objeto);
  ELSE
    -->Cambiar estado de incidencia registrada por este el mismo motivo
    s_inci := 'D0704';
    pr_gador_malla_val_inci(id_factura,
                           p_pln,
                           s_campo,
                           s_inci,
                           r_fact
                           );
  END IF;
  -->El campo 7 (Contrato) plan y contrato deben ser iguales a los datos de la validacion del campo 3
  
  
  IF D_Tip_Doc_Sop = 'V' THEN
    IF p_cdramo <> nvl(d_plan, ' ') OR d_contrato <> nvl(p_nmpoliza, ' ')
    THEN
      s_inci:='D0705';
      s_error:='Contrato del Plano es diferente A contrato del vale';

      pr_gador_malla_grab_inci(id_factura,
                                w_inci,
                                p_pln,
                                s_campo,
                                s_inci,
                                d_contrato,
                                r_fact,
                                c_sw_control,
                                s_error,
                                s_objeto);

    ELSE

      -->Cambiar estado de incidencia registrada por este el mismo motivo
      s_inci := 'D0705';
      pr_gador_malla_val_inci(id_factura,
                             p_pln,
                             s_campo,
                             s_inci,
                             r_fact
                             );

    END IF;
  END IF;
  RETURN s_inci;
EXCEPTION
WHEN OTHERS THEN
  s_oraError := SQLERRM;
  pr_graba_error_plano(p_pln,
                     s_oraError,
                     'valida_datos.fn_gador_malla_contrato',
                     r_fact);
  RETURN(s_inci);
END fn_gador_malla_contrato;

   -- Versión  Autor                       Fecha        Comentario
   -- 1.0.000  jlrodriguez-SoftManagement  18/09/2013   Creación - Procedimiento encargado de realizar las validaciones del campo 9 (Usuario)
   --                                                   de tipo detalle

   PROCEDURE pr_gador_malla_usuario (id_factura       IN      NUMBER     --id factura
                                    ,d_usuario        IN       VARCHAR2   --usuario
                                    ,d_contrato       IN      VARCHAR2   --contrato
                                    ,d_plan           IN      VARCHAR2   --plan
                                    ,p_cia            IN      VARCHAR2   --compañía
                                    ,d_familia        IN      VARCHAR2   --familia
                                    ,d_fec_doc_sop    IN      VARCHAR2   --fecha documento de soporte
                                    ,p_cuam           IN      VARCHAR2   --cuadro médico
                                    ,p_pln            IN      VARCHAR2   --nombre archivo
                                    ,r_fact           IN      VARCHAR2   --número factura
                                    ,p_cua_ser        OUT     VARCHAR2   --retornar v_ct3_cua_ser (cuadro de servicios)
                                    ,s_inci             OUT      VARCHAR2   -- incidencia
                                    ,c_sw_control     IN      VARCHAR2)

   IS
   -->Variables para campos de trabajo
   v_ct3_cua_ser tvalosit.otvalor%TYPE;
   w_usuario  NUMBER(3):=0;
   w_maxSuplem  NUMBER(18):=0;
   --variables generales
  w_inci       NUMBER (10) := 1;
  w_inciA       NUMBER (10);
   BEGIN
      -->Implementar validaciones de CU-10.0 Validar registros de tipo detalle - Flujo Normal de Trabajo - Paso 9
      -->Utilizar procedimientos [Pck_Epsga_Grb.Usr_Susp] v_cia=p_cia, ramo=d_plan, cto=d_contrato, flia=d_familia, usur=d_usuario, fdoc=d_fec_doc_sop
      -->                        [Pck_Epsga_Grb.Ver_Atri] v_cia=p_cia, ramo=d_plan, cto=d_contrato, flia=d_familia, usur=d_usuario, atrb=según c.u., fdoc=d_fec_doc_sop
      -->                        [pck_epsga_grb.max_supl] v_cia=p_cia, ramo=d_plan, cto=d_contrato, flia=d_familia, usur=d_usuario, fdoc=d_fec_doc_sop
  -- inicializo las variables segun el tipo de dato, para cada validacion
  s_inci :='OK';
  s_campoVal:='USUARIO';
  s_campo:='USUARIO';
  s_objeto:='pck_gador_malla_valida_datos.pr_gador_malla_usuario';
  -- valida el campo d_usuario
  -->El campo 9 (Usuario), debe existir en MPOLISIT, para el dato de entrada 21 (Compañía), campo 6 (Plan), campo 7 (Contrato), campo 8 (Familia), campo 9 (Usuario), estado = `M¿
  SELECT COUNT(1)
  INTO   w_usuario
  FROM   mpolisit
  WHERE  cdunieco = p_cia
  AND    cdramo = d_plan
  AND    estado = 'M'
  AND    nmpoliza = d_contrato
  AND    nmfamili = d_familia
  AND    nmsituac = d_usuario;
  -- Si no existe el registro
  IF w_usuario=0
  THEN
    s_inci:='D0901';
    s_error:='Usuario NO existe';

    pr_gador_malla_grab_inci(id_factura,
                              w_inci,
                              p_pln,
                              s_campo,
                              s_inci,
                              d_usuario,
                              r_fact,
                              c_sw_control,
                              s_error,
                              s_objeto);
  ELSE
    -->Cambiar estado de incidencia registrada por este el mismo motivo
    s_inci := 'D0901';
    pr_gador_malla_val_inci(id_factura,
                           p_pln,
                           s_campo,
                           s_inci,
                           r_fact
                           );
  END IF;
  -->El campo 9 (Usuario), debe existir en MPOLISIT, para el dato de entrada 21 (Compañía), campo 6 (Plan),
  --  campo 7 (Contrato), campo 8 (Familia), campo 9 (Usuario), estado = `M¿ , y el rol en TROLRAMO
  --NO SE PUEDE RELACIONAR CON COMPAÑIA, TROLRAMO NO TIENE COMPAÑIA
  SELECT COUNT(1)
  INTO   w_usuario
  FROM   v_mpoliper M,
         trolramo T
  WHERE  M.cdunieco = p_cia
  AND    M.cdramo = d_plan
  AND    M.estado = 'M'
  AND    M.nmpoliza = d_contrato
  AND    M.nmfamili = d_familia
  AND    M.nmsituac = d_usuario
  AND    M.cdramo = T.cdramo
  AND    M.cdrol = T.cdrol;
  -- Si no existe el registro
  -->Rev
  IF w_usuario=0
  THEN
    s_inci:='D0902';
    s_error:='Usuario NO tiene rol asociado';

    pr_gador_malla_grab_inci(id_factura,
                              w_inci,
                              p_pln,
                              s_campo,
                              s_inci,
                              d_usuario,
                              r_fact,
                              c_sw_control,
                              s_error,
                              s_objeto);
  ELSE
    -->Cambiar estado de incidencia registrada por este el mismo motivo
    s_inci := 'D0902';
    pr_gador_malla_val_inci(id_factura,
                           p_pln,
                           s_campo,
                           s_inci,
                           r_fact
                           );
  END IF;
  -->El campo 9 (Usuario), debe existir en MPOLISIT, para el dato de entrada 21 (Compañía), campo 6 (Plan),
  --  campo 7 (Contrato), campo 8 (Familia), campo 9 (Usuario), estado = `M¿ , status='V',cdestado=0 Y FECHA DOC SOPORTE

  SELECT COUNT(1)
  INTO   w_usuario
  FROM   mpolisit A
  WHERE  A.cdunieco = to_number(p_cia)
  AND    A.cdramo = to_number(d_plan)
  AND    A.estado = 'M'
  AND    A.nmpoliza = to_number(d_contrato)
  AND    A.nmfamili = to_number(d_familia)
  AND    A.nmsituac = to_number(d_usuario)
  AND    A.status = 'V'
  AND    A.cdestado = 0
  AND    A.nmsuplem =
         (SELECT MAX(b.nmsuplem)
           FROM   mpolisit b
           WHERE  b.cdunieco = A.cdunieco
           AND    b.cdramo = A.cdramo
           AND    b.estado = A.estado
           AND    b.nmpoliza = A.nmpoliza
           AND    b.nmfamili = A.nmfamili
           AND    b.nmsituac = A.nmsituac
           AND    b.nmsuplem <=
                  to_number(to_char(to_date(d_fec_doc_sop, 'dd/mm/yyyy'), 'j') ||
                             '99999999999'));
  -- Si no existe el registro
  IF w_usuario=0
  THEN
    s_inci:='D0903';
    s_error:='Usuario inactivo';

    pr_gador_malla_grab_inci(id_factura,
                              w_inci,
                              p_pln,
                              s_campo,
                              s_inci,
                              d_usuario,
                              r_fact,
                              c_sw_control,
                              s_error,
                              s_objeto);
  ELSE
    -->Cambiar estado de incidencia registrada por este el mismo motivo
    s_inci := 'D0903';
    pr_gador_malla_val_inci(id_factura,
                           p_pln,
                           s_campo,
                           s_inci,
                           r_fact
                           );
  END IF;
  -->El campo 9 (Usuario), debe existir en MPOLISIT, para el dato de entrada 21 (Compañía), campo 6 (Plan),
--  campo 7 (Contrato), campo 8 (Familia), campo 9 (Usuario), estado = `M¿ , status='V',cdestado=1 Y FECHA DOC SOPORTE
--anperez se modifica el status de la consulta por 'M'
--Consulta de usuario cancelado
SELECT COUNT(1)
INTO   w_usuario
FROM   mpolisit A
WHERE  A.cdunieco = p_cia
AND    A.cdramo = d_plan
AND    A.estado = 'M'
AND    A.nmpoliza = d_contrato
AND    A.nmfamili = d_familia
AND    A.nmsituac = d_usuario
AND    A.status = 'M'
AND    A.cdestado = 1
AND    A.nmsuplem =
       (SELECT MAX(b.nmsuplem)
         FROM   mpolisit b
         WHERE  b.cdunieco = A.cdunieco
         AND    b.cdramo = A.cdramo
         AND    b.estado = A.estado
         AND    b.nmpoliza = A.nmpoliza
         AND    b.nmfamili = A.nmfamili
         AND    b.nmsituac = A.nmsituac
         AND    b.nmsuplem <=
                to_number(to_char(to_date(d_fec_doc_sop, 'DD/MM/YYYY'), 'j') ||
                           '99999999999'));
  -- Si no existe el registro
  IF w_usuario=1
  THEN
    s_inci:='D0905';
    s_error:='Usuario Cancelado';

    pr_gador_malla_grab_inci(id_factura,
                              w_inci,
                              p_pln,
                              s_campo,
                              s_inci,
                              d_usuario,
                              r_fact,
                              c_sw_control,
                              s_error,
                              s_objeto);

  ELSE
    -->Cambiar estado de incidencia registrada por este el mismo motivo
    s_inci := 'D0905';
    pr_gador_malla_val_inci(id_factura,
                           p_pln,
                           s_campo,
                           s_inci,
                           r_fact
                           );END IF;
  -->El campo 9 (Usuario), debe existir en MPOLISIT, para el dato de entrada 21 (Compañía), campo 6 (Plan),
  --  campo 7 (Contrato), campo 8 (Familia), campo 9 (Usuario), estado = `M¿ , status='M' Y FECHA DOC SOPORTE
  -- anperez se coloca en comentario y se hace el query . Pck_Epsga_Grb.usr_susp(p_cia,d_plan,d_contrato,d_familia,d_usuario,to_char(to_date(d_fec_doc_sop,'dd/mm/yyyy'),'yyyymmdd'),w_usuario);
  -- Si no existe el registro

  SELECT COUNT(1)
  INTO   w_usuario
  FROM   mpolisit A
  WHERE  A.cdunieco = p_cia
  AND    A.cdramo = d_plan
  AND    A.estado = 'M'
  AND    A.nmpoliza = d_contrato
  AND    A.nmfamili = d_familia
  AND    A.nmsituac = d_usuario
  AND    A.status = 'V'
  AND    A.cdestado = 2
  AND    A.cdmotanu IS NOT NULL
  AND    A.nmsuplem =
         (SELECT MAX(b.nmsuplem)
           FROM   mpolisit b
           WHERE  b.cdunieco = A.cdunieco
           AND    b.cdramo = A.cdramo
           AND    b.estado = A.estado
           AND    b.nmpoliza = A.nmpoliza
           AND    b.nmfamili = A.nmfamili
           AND    b.Nmsituac = A.Nmsituac
           AND    b.Cdestado = A.Cdestado
           AND    b.Cdmotanu IS NOT NULL
           AND    b.status =A.status
           AND    B.Nmsuplem <=
                  To_Number(To_Char(To_Date(D_Fec_Doc_Sop, 'DD/MM/YYYY'), 'j') ||'99999999999'));

  IF w_usuario=1
  THEN
    s_inci:='D0904';
    s_error:='Usuario Suspendido';
    pr_gador_malla_grab_inci(id_factura,
                              w_inci,
                              p_pln,
                              s_campo,
                              s_inci,
                              d_usuario,
                              r_fact,
                              c_sw_control,
                              s_error,
                              s_objeto);
  ELSE
    -->Cambiar estado de incidencia registrada por este el mismo motivo
    s_inci := 'D0904';
    pr_gador_malla_val_inci(id_factura,
                           p_pln,
                           s_campo,
                           s_inci,
                           r_fact
                           );
  END IF;
  -->El campo 9 (Usuario), debe existir en TVALOSIT, para el dato de entrada 21 (Compañía), campo 6 (Plan),
  --  campo 7 (Contrato), campo 8 (Familia), campo 9 (Usuario), estado = `M¿ , atributo =1 Y FECHA DOC SOPORT
  Pck_Epsga_Grb.ver_atri(p_cia,d_plan,d_contrato,d_familia,d_usuario,'1',to_char(to_date(d_fec_doc_sop,'dd/mm/yyyy'),'yyyymmdd'),v_ct3_cua_ser);
  -- Si no existe el registro
  -->Rev
  IF v_ct3_cua_ser = 'XX'
  THEN
    s_inci:='D0906';
    s_error:='Usuario sin cuadro médico';

    pr_gador_malla_grab_inci(id_factura,
                              w_inci,
                              p_pln,
                              s_campo,
                              s_inci,
                              d_usuario,
                              r_fact,
                              c_sw_control,
                              s_error,
                              s_objeto);
  ELSE
    -->Cambiar estado de incidencia registrada por este el mismo motivo
    s_inci := 'D0906';
    pr_gador_malla_val_inci(id_factura,
                           p_pln,
                           s_campo,
                           s_inci,
                           r_fact
                           );
  END IF;
  -->Rev
  IF v_ct3_cua_ser <> 'XX'
  THEN
    IF p_cuam<>v_ct3_cua_ser
    --SI EL REGISTRO EXISTE, NO DEBE SER DIFERENTE AL CUADRO MEDICO
    THEN
      s_inci:='D0907';
      s_error:='Cuadro medico de usuario y factura son diferentes';

      pr_gador_malla_grab_inci(id_factura,
                                w_inci,
                                p_pln,
                                s_campo,
                                s_inci,
                                d_usuario,
                                r_fact,
                                c_sw_control,
                                s_error,
                                s_objeto);
    ELSE
    -->Cambiar estado de incidencia registrada por este el mismo motivo
    s_inci := 'D0907';
    pr_gador_malla_val_inci(id_factura,
                           p_pln,
                           s_campo,
                           s_inci,
                           r_fact
                           );
    END IF;
  END IF;
  -->El campo 9 (Usuario), debe existir en TVALOSIT, para el dato de entrada 21 (Compañía), campo 6 (Plan),
  --  campo 7 (Contrato), campo 8 (Familia), campo 9 (Usuario), estado = `M¿ , atributo =2 Y FECHA DOC SOPORT
  Pck_Epsga_Grb.ver_atri(p_cia,d_plan,d_contrato,d_familia,d_usuario,'2',to_char(to_date(d_fec_doc_sop,'dd/mm/yyyy'),'yyyymmdd'),v_ct3_cua_ser);
  --SI EL REGISTRO EXISTE, guardar el valor del atributo en campo de trabajo 3
  p_cua_ser:=v_ct3_cua_ser;
  -->Rev
  IF v_ct3_cua_ser = 'XX'
  THEN
    s_inci:='D0908';
    s_error:='Usuario sin cuadro de servicios';

    pr_gador_malla_grab_inci(id_factura,
                              w_inci,
                              p_pln,
                              s_campo,
                              s_inci,
                              d_usuario,
                              r_fact,
                              c_sw_control,
                              s_error,
                              s_objeto);
  ELSE
    -->Cambiar estado de incidencia registrada por este el mismo motivo
    s_inci := 'D0908';
    pr_gador_malla_val_inci(id_factura,
                           p_pln,
                           s_campo,
                           s_inci,
                           r_fact
                           );

  END IF;
  -->El campo 9 (Usuario), guardar el nmsuplem MPOLISIT, para el dato de entrada 21 (Compañía), campo 6 (Plan),
  --  campo 7 (Contrato), campo 8 (Familia), campo 9 (Usuario) Y FECHA DOC SOPORT
  -- ESTA VARIABLE NO SE RETORNA, w_maxSuplem
    Pck_Epsga_Grb.max_supl(p_cia,d_plan,d_contrato,d_familia,d_usuario,to_char(to_date(d_fec_doc_sop,'dd/mm/yyyy'),'yyyymmdd'),w_maxSuplem);
  -->El campo 9 (Usuario), si hay registro en TTAPTABL TT,TTAPVAAT TV para TCUADROS
  SELECT COUNT(1)
    INTO w_usuario
    FROM TTAPTABL TT,TTAPVAAT TV
    WHERE TT.CDTABLA='TCUADROS'
    AND tt.nmtabla=tV.nmtabla
    AND OTCLAVE1=v_ct3_cua_ser;
  -- Si no existe el registro
  IF w_usuario=0
  THEN
    s_inci:='D0909';
    s_error:='Cuadro de servicios asociado al usuario NO existe';

    pr_gador_malla_grab_inci(id_factura,
                              w_inci,
                              p_pln,
                              s_campo,
                              s_inci,
                              d_usuario,
                              r_fact,
                              c_sw_control,
                              s_error,
                              s_objeto);
  ELSE
    -->Cambiar estado de incidencia registrada por este el mismo motivo
    s_inci := 'D0909';
    pr_gador_malla_val_inci(id_factura,
                           p_pln,
                           s_campo,
                           s_inci,
                           r_fact
                           );
  END IF;
EXCEPTION
WHEN OTHERS THEN
  s_oraError := SQLERRM;
  pr_graba_error_plano(p_pln,
                     s_oraError,
                     'valida_datos.pr_gador_malla_usuario',
                     r_fact);
END pr_gador_malla_usuario;

   -- Versión  Autor                       Fecha        Comentario
   -- 1.0.000  jlrodriguez-SoftManagement  18/09/2013   Creación - Función encargada de realizar las validaciones del campo 10 (Tipo identificación)
   --                                                   de tipo detalle
FUNCTION fn_gador_malla_tipo_id (id_factura      NUMBER     --id factura
                ,d_tipo_id       VARCHAR2     --tipo identificación
                ,p_pln           VARCHAR2   --nombre archivo
                ,r_fact          VARCHAR2   --número factura
                ,c_sw_control    VARCHAR2)
  RETURN VARCHAR2
IS
  w_tipo_id     NUMBER (3):=0;
     --variables generales
  w_inci       NUMBER (10) := 1;
  w_inciA       NUMBER (10);
BEGIN
  -->Implementar validaciones de CU-10.0 Validar registros de tipo detalle - Flujo Normal de Trabajo - Paso 10
  -- inicializo las variables segun el tipo de dato, para cada validacion
  s_inci :='OK';
  s_campoVal:='TIPO DE IDENTIFICACIÓN';
  s_campo:='TIPO_IDENTIFICACION_USR';
  s_objeto:='pck_gador_malla_valida_datos.fn_gador_malla_tipo_id';
  -- valida el campo d_tipo_id
  -->El campo 10 (Tipo identificación), debe existir en TMANTENI para TTIPOIDE
  SELECT COUNT(*)
    INTO w_tipo_id
    FROM TMANTENI
    WHERE cdtabla='TTIPOIDE'
    AND CODIGO=d_tipo_id;
  --Si registro no existe
  IF w_tipo_id=0
  THEN
    s_inci:='D1001';
    s_error:='Tipo de identificación NO existe';

    pr_gador_malla_grab_inci(id_factura,
                              w_inci,
                              p_pln,
                              s_campo,
                              s_inci,
                              d_tipo_id,
                              r_fact,
                              c_sw_control,
                              s_error,
                              s_objeto);
  ELSE
    -->Cambiar estado de incidencia registrada por este el mismo motivo
    s_inci := 'D1001';
    pr_gador_malla_val_inci(id_factura,
                           p_pln,
                           s_campo,
                           s_inci,
                           r_fact
                           );
  END IF;
  RETURN s_inci;
EXCEPTION
WHEN OTHERS THEN
  s_oraError := SQLERRM;
  pr_graba_error_plano(p_pln,
                     s_oraError,
                     'valida_datos.fn_gador_malla_tipo_id',
                     r_fact);
  RETURN(s_inci);
END fn_gador_malla_tipo_id;

   -- Versión  Autor                       Fecha        Comentario
   -- 1.0.000  jlrodriguez-SoftManagement  18/09/2013   Creación - Función encargada de realizar las validaciones del campo 11 (Número identificación)
   --                                                   de tipo detalle

   FUNCTION fn_gador_malla_nro_id (id_factura      NUMBER      --id factura
                                   ,d_nro_id        VARCHAR2    --número identificación
                                   ,d_tipo_id       VARCHAR2        --tipo identificación
                                   ,d_contrato      VARCHAR2      --contrato
                                   ,d_plan          VARCHAR2      --plan
                                   ,p_cia           VARCHAR2    --compañía
                                   ,d_familia       VARCHAR2      --familia
                                   ,d_usuario       VARCHAR2      --usuario
                                   ,p_pln           VARCHAR2    --nombre archivo
                                   ,r_fact          VARCHAR2    --número factura
                                   ,c_sw_control    VARCHAR2)
      RETURN VARCHAR2
   IS

   -->Variables para campos de trabajo
   v_ct4_num_per_usu mpersona.cdperson%TYPE;
   w_identificacion  NUMBER(3):=0;
   --variables generales
  w_inci       NUMBER (10) := 1;
  w_inciA       NUMBER (10);
   BEGIN
      -->Implementar validaciones de CU-10.0 Validar registros de tipo detalle - Flujo Normal de Trabajo - Paso 11
  -- inicializo las variables segun el tipo de dato, para cada validacion
  s_inci :='OK';
  s_campoVal:='NUMERO IDENTIFICACION';
  s_campo:='NUM_IDENTIFICACION';
  s_objeto:='pck_gador_malla_valida_datos.fn_gador_malla_nro_id';
  -- valida el campo d_nro_id
  -->El campo 11 (Numero de identificacio), debe existir en MPERSONA con tipo_id
  SELECT COUNT(1)
    INTO w_identificacion
    FROM MPERSONA
    WHERE cdtipide=d_tipo_id
    AND CDIDEPER=d_nro_id;
  --Si registro no existe
  IF w_identificacion=0
  THEN
    s_inci:='D1101';
    s_error:='Tipo y número de documento NO existe';

    pr_gador_malla_grab_inci(id_factura,
                              w_inci,
                              p_pln,
                              s_campo,
                              s_inci,
                              d_nro_id,
                              r_fact,
                              c_sw_control,
                              s_error,
                              s_objeto);
  ELSE
    -->Cambiar estado de incidencia registrada por este el mismo motivo
    s_inci := 'D1101';
    pr_gador_malla_val_inci(id_factura,
                           p_pln,
                           s_campo,
                           s_inci,
                           r_fact
                           );
  END IF;

  IF w_identificacion<>0
  THEN
    -- la persona existe, guardar el codigo en v_ct4_num_per_usu
    SELECT CDPERSON
      INTO v_ct4_num_per_usu
      FROM MPERSONA
      WHERE cdtipide=d_tipo_id
      AND CDIDEPER=d_nro_id;
    -->El campo 11 (Numero de identificacio), debe existir en MPOLIPER por compañia,plan,contrato,familia,usuario y codigo
    SELECT COUNT(1)
      INTO w_identificacion
      FROM MPOLIPER
      WHERE cdunieco=p_cia
      AND CDRAMO=d_plan
      AND NMPOLIZA=d_contrato
      AND NMFAMILI =d_familia
      AND NMSITUAC =d_usuario
      AND CDPERSON=v_ct4_num_per_usu;
    IF w_identificacion=0
    THEN
      s_inci:='D1102';
      s_error:='Documento de identidad del usuario NO corresponde con contrato del plano';

      pr_gador_malla_grab_inci(id_factura,
                              w_inci,
                              p_pln,
                              s_campo,
                              s_inci,
                              d_nro_id,
                              r_fact,
                              c_sw_control,
                              s_error,
                              s_objeto);
    ELSE
      -->Cambiar estado de incidencia registrada por este el mismo motivo
      s_inci := 'D1102';
      pr_gador_malla_val_inci(id_factura,
                             p_pln,
                             s_campo,
                             s_inci,
                             r_fact
                             );
    END IF;
  END IF;
    RETURN s_inci;
EXCEPTION
WHEN OTHERS THEN
  s_oraError := SQLERRM;
  pr_graba_error_plano(p_pln,
                     s_oraError,
                     'valida_datos.fn_gador_malla_nro_id',
                     r_fact);
  RETURN(s_inci);
END fn_gador_malla_nro_id;

   -- Versión  Autor                       Fecha        Comentario
   -- 1.0.000  jlrodriguez-SoftManagement  18/09/2013   Creación - Funcion encargada de realizar las validaciones del campo 12 (Lugar Prestación)
   --                                                   de tipo detalle

   FUNCTION fn_gador_malla_lugar_prest (id_factura       NUMBER    --id factura
                                        ,d_lugar_prest    VARCHAR2      --lugar prestación/Retornar incidencia
                                        ,p_pln            VARCHAR2  --nombre archivo
                                        ,r_fact           VARCHAR2  --número factura
                                        ,r_meds           VARCHAR2  --código prestador
                                        ,c_sw_control     VARCHAR2)
      RETURN VARCHAR2
   IS
  w_lugar   NUMBER(3):=0;
  --variables generales
  w_inci       NUMBER (10) := 1;
  w_inciA       NUMBER (10);
   BEGIN
      -->Implementar validaciones de CU-10.0 Validar registros de tipo detalle - Flujo Normal de Trabajo - Paso 12
      -->Utilizar procedimientos [Pck_Epsga_Grb.Ver_Lugr] v_lgr=d_lugar_prest
      -->                        [Frecep_Ga.Ver_Norj] <-- Para obtener atributo 10  v_med=r_meds ***
  -- inicializo las variables segun el tipo de dato, para cada validacion
  s_inci :='OK';
  s_campoVal:='LUGAR PRESTACION';
  s_campo:='LUGAR_PRESTACION';
  s_objeto:='pck_gador_malla_valida_datos.fn_gador_malla_lugar_prest';
  -- valida el campo d_lugar_prest
  -->El campo 12 (Lugar prestacion), debe existir en tmanteni para TLUGPRES
  Pck_Epsga_Grb.Ver_Lugr(d_lugar_prest,w_lugar);
  --si no existe el registro
  IF w_lugar=0
  THEN
    s_inci:='D1201';
    s_error:='Lugar de prestación NO parametrizado';

    pr_gador_malla_grab_inci(id_factura,
                              w_inci,
                              p_pln,
                              s_campo,
                              s_inci,
                              d_lugar_prest,
                              r_fact,
                              c_sw_control,
                              s_error,
                              s_objeto);
  ELSE
    -->Cambiar estado de incidencia registrada por este el mismo motivo
    s_inci := 'D1201';
    pr_gador_malla_val_inci(id_factura,
                           p_pln,
                           s_campo,
                           s_inci,
                           r_fact
                           );
  END IF;
  -->El campo 12 (Lugar prestacion), no debe ser C y el atributo 10 S
  Frecep_Ga.Ver_Norj(r_meds,w_lugar);
  --'N'-->1,'S'-->2
  IF d_lugar_prest='C' AND w_lugar=2
  THEN
    s_inci:='D1202';
    s_error:='Lugar C NO aplica para Institución';

    pr_gador_malla_grab_inci(id_factura,
                              w_inci,
                              p_pln,
                              s_campo,
                              s_inci,
                              d_lugar_prest,
                              r_fact,
                              c_sw_control,
                              s_error,
                              s_objeto);
  ELSE
    -->Cambiar estado de incidencia registrada por este el mismo motivo
    s_inci := 'D1202';
    pr_gador_malla_val_inci(id_factura,
                           p_pln,
                           s_campo,
                           s_inci,
                           r_fact
                           );
  END IF;
  RETURN s_inci;
EXCEPTION
WHEN OTHERS THEN
  s_oraError := SQLERRM;
  pr_graba_error_plano(p_pln,
                     s_oraError,
                     'valida_datos.fn_gador_malla_lugar_prest',
                     r_fact);
  RETURN(s_inci);
END fn_gador_malla_lugar_prest;

   -- Versión  Autor                       Fecha        Comentario
   -- 1.0.000  jlrodriguez-SoftManagement  18/09/2013   Creación - Función encargada de realizar las validaciones del campo 13 (Código Manual Tarifario)
   --                                                   de tipo detalle

   PROCEDURE pr_gador_malla_cod_man_tar (id_factura       IN       NUMBER     --id factura
                                        ,d_cod_man_tarifa IN       VARCHAR2   --código manual tarifario ó catálogo de codificación
                                        ,p_cia            IN       VARCHAR2   --compañía
                                        ,r_meds           IN       VARCHAR2   --código prestador
                                        ,d_fec_doc_sop    IN       VARCHAR2   --fecha documento de soporte
                                        ,p_pln            IN       VARCHAR2   --nombre archivo
                                        ,r_fact           IN       VARCHAR2   --número factura
                                        ,p_cdalias        OUT      VARCHAR2   --retorna código alias
                                        ,s_inci            OUT       VARCHAR2   --incidencia
                                        ,d_lugar_prest    IN       VARCHAR2   --lugar prestación
                                        ,c_sw_control     IN       VARCHAR2)
   IS
  --variables generales
  w_inci       NUMBER (10) := 1;
  w_inciA       NUMBER (10);
  s_ali        VARCHAR2(10);
  sw_alia      NUMBER(1);
   BEGIN
      -->Implementar validaciones de CU-10.0 Validar registros de tipo detalle - Flujo Normal de Trabajo - Paso 13
      -->Utilizar procedimientos [pck_epsga_grb.ali_pres] v_cia=p_cia, v_med=r_meds, p_fdoc=d_fec_doc_sop ****
      -- inicializo las variables segun el tipo de dato, para cada validacion
      s_inci :='OK';
      s_campoVal:='CODIGO MANUAL TARIFARIO';
      s_campo:='COD_MANUAL_TARIFAR';
      s_objeto:='pck_gador_malla_valida_datos.pr_gador_malla_cod_man_tar';

      pck_epsga_grb.tar_alia(p_cia, d_cod_man_tarifa, sw_alia);
      --

      IF sw_alia = 0 THEN
        s_inci := 'D1301';
        s_error:='NO existe MANUAL de codificación';

        pr_gador_malla_grab_inci(id_factura,
                              w_inci,
                              p_pln,
                              s_campo,
                              s_inci,
                              d_cod_man_tarifa,
                              r_fact,
                              c_sw_control,
                              s_error,
                              s_objeto);
      ELSE
        -->Cambiar estado de incidencia registrada por este el mismo motivo
        s_inci := 'D1301';
        pr_gador_malla_val_inci(id_factura,
                               p_pln,
                               s_campo,
                               s_inci,
                               r_fact
                               );
      END IF;
      --p_cdalias := s_ali;
      -- valida el campo d_cod_man_tarifa
      -->El campo 13 (Codigo Manual Tarifario)

      pck_epsga_grb.ali_pres(p_cia, r_meds, s_ali, to_date(d_fec_doc_sop,'DD/MM/YY'));
      IF s_ali IS NULL
      THEN
        s_inci:='D1405';
        s_error := 'Prestador no tiene asociado codigo tarifario';
        pr_gador_malla_grab_inci(id_factura,
                                  w_inci,
                                  p_pln,
                                  s_campo,
                                  s_inci,
                                  d_cod_man_tarifa,
                                  r_fact,
                                  c_sw_control,
                                  s_error,
                                  s_objeto);
      ELSE
        -->Cambiar estado de incidencia registrada por este el mismo motivo
        s_inci := 'D1405';
        pr_gador_malla_val_inci(id_factura,
                               p_pln,
                               s_campo,
                               s_inci,
                               r_fact
                               );
      END IF;
      p_cdalias := s_ali;
   EXCEPTION
    WHEN OTHERS THEN
      s_oraError := SQLERRM;
      pr_graba_error_plano(p_pln,
                         s_oraError,
                         'valida_datos.pr_gador_malla_cod_man_tar',
                         r_fact);
   END pr_gador_malla_cod_man_tar;

   -- Versión  Autor                       Fecha        Comentario
   -- 1.0.000  jlrodriguez-SoftManagement  18/09/2013   Creación - Función encargada de realizar las validaciones del campo 14 (Código servicio)
   --                                                   de tipo detalle

   PROCEDURE pr_gador_malla_cod_ser_pres (id_factura          IN      NUMBER      --id factura
                                         ,d_cod_ser_prestado  IN OUT  VARCHAR2    --código servicio
                                         ,d_cod_man_tarifa    IN      VARCHAR2    --código manual tarifario
                                         ,p_cia               IN      VARCHAR2    --compañía
                                         ,r_meds              IN      VARCHAR2    --código prestador
                                         ,p_pln               IN      VARCHAR2    --nombre archivo
                                         ,r_fact              IN      VARCHAR2    --número factura
                                         ,p_cua_ser           IN      VARCHAR2    --cuadro de servicios (campo trabajo 3)
                                         ,d_lugar_prest       IN      VARCHAR2    --lugar de prestación del servicio
                                         ,r_nsol              IN      VARCHAR2    --Número de solicitud del volante
                                         ,p_cdalias           IN      VARCHAR2    --Código alias (Validación campo 13)
                                         ,p_cod_alea          OUT     VARCHAR2    --Retornar campo de trabajo 5 v_ct5_cod_alea
                                         ,p_niv_aut           OUT     VARCHAR2    --Retornar campo de trabajo 8 v_ct8_niv_aut
                                         ,s_inci              OUT     VARCHAR2   --incidencia
                                         ,c_sw_control        IN      VARCHAR2
                                         ,p_fdoc              IN      VARCHAR2)  -- Fecha de prestacion de servicio

   IS
   w_servicio  NUMBER(3):=0;
   --variables generales
  w_inci       NUMBER (10) := 1;
  w_inciA       NUMBER (10);
   -->Variables campos de trabajo
   v_ct5_cod_alea   taliaser.cdsermed%TYPE;
   v_ct6_tip_ser    tservmed.cdtipser%TYPE;
   v_ct7_cla_ser    tservmed.cdclaser%TYPE;
   v_ct8_niv_aut    mtipauts.nmnivaut%TYPE;
   V_Swplnsal       Mtipauts.Swplnsal%TYPE;
   V_Count      Number;
   V_Count_Alea Number;
    v_alia      VARCHAR(2);
   BEGIN
      -->Implementar validaciones de CU-10.0 Validar registros de tipo detalle - Flujo Normal de Trabajo - Paso 14
      -->Utilizar procedimientos [Pck_Epsga_Grb.Cod_Alia] v_ali=p_cdalias, cdgo=d_cod_ser_prestado, P_Cdpresta=r_meds
      -->                        [Pck_Epsga_Grb.Ver_Cdgo] cdgo=v_ct5_cod_alea
      -->                        [pck_epsga_grb.autoriza_serv2] p_cdunieco=p_cia, p_cdcuaser=p_cua_ser, p_cdsermed=d_cod_ser_prestado,
      -->                                                       p_nmsolvol=r_nsol, p_nmsecaut??, p_cdlupres=d_lugar_prest, p_cdclaser=v_ct7_cla_ser ****
  -- inicializo las variables segun el tipo de dato, para cada validacion
  s_inci :='OK';
  s_campoVal:='CODIGO SERVICIO';
  s_campo:='CODIGO_SERVICIO_PRESTADO';
  s_objeto:='pck_gador_malla_valida_datos.pr_gador_malla_cod_ser_pres';
  -- valida el campo d_cod_ser_prestado
  -->El campo 14 (Codigo servicio), debe existir en TALIASER, para catalogo y codigo

  v_alia := NULL;

  pck_epsga_grb.ali_pres(p_cia,r_meds,v_alia, to_date(p_fdoc,'DD/MM/YYYY'));  -- fecha de servicio

  IF v_alia IS NOT NULL THEN
     v_ct5_cod_alea := NULL;
     IF d_cod_man_tarifa = '01' THEN
       v_ct5_cod_alea := d_cod_ser_prestado;
     ELSE
       Pck_Epsga_Grb.Cod_Alia(v_alia,d_cod_ser_prestado,v_ct5_cod_alea,r_meds);
     END IF;
  END IF;
  
  --Inicio JaFarias 22/07/2014 Se agregan validaciones de variable codigo alias servicio  
  If v_ct5_cod_alea is null Then
    v_ct5_cod_alea := '999000009';
    s_inci:='D1401';
    s_error:='NO existe código Alea para el código ALIAS';

    pr_gador_malla_grab_inci(id_factura,
                              w_inci,
                              p_pln,
                              s_campo,
                              s_inci,
                              d_cod_ser_prestado,
                              r_fact,
                              c_sw_control,
                              s_error,
                              s_objeto);

  ELSE
    -->Cambiar estado de incidencia registrada por este el mismo motivo
    s_inci := 'D1401';
    pr_gador_malla_val_inci(id_factura,
                           p_pln,
                           s_campo,
                           s_inci,
                           r_fact
                           );


  END IF;
  
  If v_ct5_cod_alea = 'ZZZZZZZZZ' Then
    s_inci:='D1402';
    s_error:='Código ALIAS asociado A más de un Código Alea';

    pr_gador_malla_grab_inci(id_factura,
                              w_inci,
                              p_pln,
                              s_campo,
                              s_inci,
                              d_cod_ser_prestado,
                              r_fact,
                              c_sw_control,
                              s_error,
                              s_objeto);

  ELSE
    -->Cambiar estado de incidencia registrada por este el mismo motivo
    s_inci := 'D1402';
    pr_gador_malla_val_inci(id_factura,
                           p_pln,
                           s_campo,
                           s_inci,
                           r_fact
                           );
  
  
  End If;
  --Fin JaFarias 22/07/2014 
	
	
  --JaFarias 22/07/2014 Se comentarea bloque de codigo dado que la logica ya está incluida en código anterior al comentareado.
  /*
  Select Count(*) 
  Into V_Count_Alea
  From Taliaser
  Where Cdserali=D_Cod_Ser_Prestado 
  And Cdalias=v_alia;
  
  
  IF V_Count_Alea <1 THEN
    v_ct5_cod_alea := '999000009';
    s_inci:='D1401';
    s_error:='NO existe código Alea para el código ALIAS';

    pr_gador_malla_grab_inci(id_factura,
                              w_inci,
                              p_pln,
                              s_campo,
                              s_inci,
                              d_cod_ser_prestado,
                              r_fact,
                              c_sw_control,
                              s_error,
                              s_objeto);

  ELSE
    -->Cambiar estado de incidencia registrada por este el mismo motivo
    s_inci := 'D1401';
    pr_gador_malla_val_inci(id_factura,
                           p_pln,
                           s_campo,
                           s_inci,
                           r_fact
                           );


  END IF;
  
  SELECT Count(*)
  INTO V_Count
  FROM Taliaser 
  WHERE cdserali=D_Cod_Ser_Prestado 
  AND Cdalias=P_Cdalias;
  
  IF V_Count>1 THEN
    s_inci:='D1402';
    s_error:='Código ALIAS asociado A más de un Código Alea';

    pr_gador_malla_grab_inci(id_factura,
                              w_inci,
                              p_pln,
                              s_campo,
                              s_inci,
                              d_cod_ser_prestado,
                              r_fact,
                              c_sw_control,
                              s_error,
                              s_objeto);

  ELSE
    -->Cambiar estado de incidencia registrada por este el mismo motivo
    s_inci := 'D1402';
    pr_gador_malla_val_inci(id_factura,
                           p_pln,
                           s_campo,
                           s_inci,
                           r_fact
                           );
  END IF;
  
  */ --JaFarias 22/07/2014 Se comentarea bloque de codigo dado que la logica ya está incluida en código anterior al comentareado.
  
  w_servicio := 0;
  Pck_Epsga_Grb.Ver_Cdgo(v_ct5_cod_alea,w_servicio);

  IF w_servicio =0  THEN
      s_inci:='D1403';
      s_error:='Código Alea NO parametrizado';

      pr_gador_malla_grab_inci(id_factura,
                              w_inci,
                              p_pln,
                              s_campo,
                              s_inci,
                              d_cod_ser_prestado,
                              r_fact,
                              c_sw_control,
                              s_error,
                              s_objeto);
  ELSE
    -->Cambiar estado de incidencia registrada por este el mismo motivo
    s_inci := 'D1403';
    pr_gador_malla_val_inci(id_factura,
                         p_pln,
                         s_campo,
                         s_inci,
                         r_fact
                         );
    END IF;

  IF w_servicio <> 0
  THEN
  --si existe el registro
  SELECT CDTIPSER ,CDCLASER
    INTO   v_ct6_tip_ser,v_ct7_cla_ser
    FROM   tservmed
    WHERE  cdsermed = v_ct5_cod_alea
    AND    cddepend = 'PRO';
  END IF;


  -->El campo 14 (Codigo servicio), no deben existir varios registros en TALIASER para codigo de servicio, en el procedimiento anterior retorna 'ZZZZZZZZZ' pero usa catalogo (too many rows)

/*    SELECT count(1)
    INTO w_servicio
    FROM taliaser
    WHERE cdserali=d_cod_ser_prestado;*/


  --Si hay mas de un registro
  /*IF w_servicio >1
  THEN
    s_inci:='D1402';
    s_error:='Código ALIAS asociado A más de un Código Alea';

    pr_gador_malla_grab_inci(id_factura,
                              w_inci,
                              p_pln,
                              s_campo,
                              s_inci,
                              d_cod_ser_prestado,
                              r_fact,
                              c_sw_control,
                              s_error,
                              s_objeto);
  ELSE
    -->Cambiar estado de incidencia registrada por este el mismo motivo
    s_inci := 'D1402';
    pr_gador_malla_val_inci(id_factura,
                           p_pln,
                           s_campo,
                           s_inci,
                           r_fact
                           );
  END IF;*/
  -->El campo 14 (Codigo servicio), deben existir registro en TSERVMED para codigo ALEA y CDDEPEND=PRO
  --Pck_Epsga_Grb.Ver_Cdgo(v_ct5_cod_alea,w_servicio);
  --Si no hay registro
  /*IF w_servicio =0
  THEN
    s_inci:='D1403';
    s_error:='Código Alea NO parametrizado';

    pr_gador_malla_grab_inci(id_factura,
                              w_inci,
                              p_pln,
                              s_campo,
                              s_inci,
                              d_cod_ser_prestado,
                              r_fact,
                              c_sw_control,
                              s_error,
                              s_objeto);
  ELSE
    -->Cambiar estado de incidencia registrada por este el mismo motivo
    s_inci := 'D1403';
    pr_gador_malla_val_inci(id_factura,
                           p_pln,
                           s_campo,
                           s_inci,
                           r_fact
                           );
  END IF;

  IF w_servicio <> 0
  THEN
    --si existe el registro
    SELECT CDTIPSER ,CDCLASER
      INTO   v_ct6_tip_ser,v_ct7_cla_ser
      FROM   tservmed
      WHERE  cdsermed = v_ct5_cod_alea
      AND    cddepend = 'PRO';
  END IF;*/
  -->El campo 14 (Codigo servicio), deben existir registro en MTIPAUTS para codigo ALEA, cuadro de servicio y compañia
  SELECT count(1)
    INTO  w_servicio
    FROM   MTIPAUTS
    WHERE  cdunieco = p_cia
    AND    cdcuaser = p_cua_ser
    AND    cdsermed = v_ct5_cod_alea;

  --si no existe el registro
  IF w_servicio =0  THEN
    s_inci:='D1404';
    s_error:='Código NO existe en autorización de servicios';

    pr_gador_malla_grab_inci(id_factura,
                              w_inci,
                              p_pln,
                              s_campo,
                              s_inci,
                              d_cod_ser_prestado,
                              r_fact,
                              c_sw_control,
                              s_error,
                              s_objeto);
  ELSE
    -->Cambiar estado de incidencia registrada por este el mismo motivo
    s_inci := 'D1404';
    pr_gador_malla_val_inci(id_factura,
                           p_pln,
                           s_campo,
                           s_inci,
                           r_fact
                           );
  END IF;

  IF w_servicio <> 0
  THEN
    --SI EL REGISTRO EXISTE
    SELECT NMNIVAUT, SWPLNSAL
    INTO  p_niv_aut,v_swplnsal
      FROM   MTIPAUTS
      WHERE  cdunieco = p_cia
      AND    cdcuaser = p_cua_ser
      AND    cdsermed = v_ct5_cod_alea;
  END IF;
EXCEPTION
    WHEN OTHERS THEN
      s_oraError := SQLERRM;
      pr_graba_error_plano(p_pln,
                         s_oraError,
                         'valida_datos.pr_gador_malla_cod_ser_pres',
                         r_fact);
END pr_gador_malla_cod_ser_pres;

   -- Versión  Autor                       Fecha        Comentario
   -- 1.0.000  jlrodriguez-SoftManagement  18/09/2013   Creación - Funcion encargada de realizar las validaciones del campo 15 (Cantidad servicio)
   --                                                   de tipo detalle
   FUNCTION fn_gador_malla_cant_serv (id_factura          NUMBER    --id factura
                                      ,d_cant_servicio    IN OUT VARCHAR2    --cantidad servicio
                                      ,d_fec_doc_sop      VARCHAR2  --fecha documento soporte
                                      ,p_pln              VARCHAR2  --nombre archivo
                                      ,r_fact             VARCHAR2  --número factura
                                      ,c_sw_control       VARCHAR2)
      RETURN VARCHAR2
   IS
   BEGIN
      -->Implementar validaciones de CU-10.0 Validar registros de tipo detalle - Flujo Normal de Trabajo - Paso 15
    --NO TIENE INCIDENCIAS
  IF d_cant_servicio='00' OR d_cant_servicio='01' OR d_cant_servicio IS NULL
  THEN
    d_cant_servicio :='1';
  END IF;
    RETURN 'OK';
END fn_gador_malla_cant_serv;

   -- Versión    Autor                       Fecha        Comentario
   -- 1.0.000  jlrodriguez-SoftManagement   18/09/2013    Creación - Funcion encargada de realizar las validaciones del campo 16 (Recargo)
   --                                                     de tipo detalle

   FUNCTION fn_gador_malla_recargo (id_factura        NUMBER      --id factura
                                    ,d_recargo        VARCHAR2        --recargo
                                    ,d_fec_doc_sop    VARCHAR2    --fecha documento soporte
                                    ,p_pln            VARCHAR2    --nombre archivo
                                    ,r_fact           VARCHAR2    --número factura
                                    ,c_sw_control     VARCHAR2)
      RETURN VARCHAR2
   IS
   w_recargo   NUMBER(3):=0;
   --variables generales
  w_inci       NUMBER (10) := 1;
  w_inciA       NUMBER (10);
   -->Variables campos de trabajo
   v_ct9_ind_rec_des    ttipdere.swtidere %TYPE;
   -->Rev
   BEGIN
      -->Implementar validaciones de CU-10.0 Validar registros de tipo detalle - Flujo Normal de Trabajo - Paso 16
      -- inicializo las variables segun el tipo de dato, para cada validacion
      s_inci :='OK';
      s_campoVal:='RECARGO';
      s_campo:='TIPO_RECARGO';
      s_objeto:='pck_gador_malla_valida_datos.fn_gador_malla_recargo';
      -->El campo 16 (Recargo), debe existir en TTIPDERE para fecha de documento soporte
      SELECT COUNT(1)
        INTO w_recargo
        FROM TTIPDERE
        WHERE TO_CHAR(FEVIGENC,'YYYYMMDD')=d_fec_doc_sop;
      --Si no existe el registro
      IF w_recargo=0
      THEN
        s_inci:='D1601';
        s_error:='Tipo de recargo NO parametrizado';

        pr_gador_malla_grab_inci(id_factura,
                                  w_inci,
                                  p_pln,
                                  s_campo,
                                  s_inci,
                                  d_recargo,
                                  r_fact,
                                  c_sw_control,
                                  s_error,
                                  s_objeto);
      ELSE
        -->Cambiar estado de incidencia registrada por este el mismo motivo
        s_inci := 'D1601';
        pr_gador_malla_val_inci(id_factura,
                               p_pln,
                               s_campo,
                               s_inci,
                               r_fact
                               );
      END IF;

      IF w_recargo<>0
      THEN
        SELECT SWTIDERE
          INTO v_ct9_ind_rec_des
          FROM TTIPDERE
          WHERE TO_CHAR(FEVIGENC,'YYYYMMDD')=d_fec_doc_sop;
      END IF;
          RETURN s_inci;

   EXCEPTION
    WHEN OTHERS THEN
      s_oraError := SQLERRM;
      pr_graba_error_plano(p_pln,
                         s_oraError,
                         'valida_datos.fn_gador_malla_recargo',
                         r_fact);
    RETURN(s_inci);
   END fn_gador_malla_recargo;

   -- Versión  Autor                       Fecha        Comentario
   -- 1.0.000  jlrodriguez-SoftManagement  18/09/2013   Creación - Función encargada de realizar las validaciones del campo 17 (Prestador Ordena)
   --                                                   de tipo detalle
   FUNCTION fn_gador_malla_pres_ordena (id_factura             NUMBER     --id factura
                                        ,d_prestador_ordena    VARCHAR2   --prestador ordena
                                        ,p_cia                 VARCHAR2   --compañía
                                        ,p_cuam                VARCHAR2   --cuadro médico
                                        ,p_pln                 VARCHAR2   --nombre archivo
                                        ,r_fact                VARCHAR2   --número factura
                                        ,c_sw_control          VARCHAR2)
      RETURN VARCHAR2
   IS
  w_prestador    NUMBER(3):=0;
   -->Variables campos de trabajo
   v_ct10_num_per_ord   mprestad.cdperson%TYPE;
   --variables generales
  w_inci       NUMBER (10) := 1;
  w_inciA       NUMBER (10);
   BEGIN
      -->Implementar validaciones de CU-10.0 Validar registros de tipo detalle - Flujo Normal de Trabajo - Paso 17
      -->Utilizar procedimientos [Pck_Epsga_Grb.Ver_Pord] v_ord=d_prestador_ordena
  -- inicializo las variables segun el tipo de dato, para cada validacion
  s_inci :='OK';
  s_campoVal:='PRESTADOR ORDENA';
  s_campo:='PRESTADOR_ORDENA';
  s_objeto:='pck_gador_malla_valida_datos.fn_gador_malla_pres_ordena';
  -- valida el campo d_prestador_ordena
  -->El campo 17 (Prestador ordena), debe existir en MPRESTAD
  Pck_Epsga_Grb.Ver_Pord(d_prestador_ordena,w_prestador);
  IF w_prestador=0
  THEN
    s_inci:='D1701';
    s_error:='Prestador que ordena NO existe';

    pr_gador_malla_grab_inci(id_factura,
                              w_inci,
                              p_pln,
                              s_campo,
                              s_inci,
                              d_prestador_ordena,
                              r_fact,
                              c_sw_control,
                              s_error,
                              s_objeto);
  ELSE
    -->Cambiar estado de incidencia registrada por este el mismo motivo
    s_inci := 'D1701';
    pr_gador_malla_val_inci(id_factura,
                           p_pln,
                           s_campo,
                           s_inci,
                           r_fact
                           );
  END IF;

  IF w_prestador<>0
  THEN
    -->El campo 17 (Prestador ordena), debe existir en MPRESTAD Y FFINCONT debe ser null o mayor igual al dia
    SELECT COUNT(1)
      INTO w_prestador
      FROM MPRESTAD
      WHERE CDPRESTA=d_prestador_ordena
      AND (FFINCONT IS NULL
      OR TRUNC(FFINCONT)>=TRUNC(SYSDATE));
    IF w_prestador=0
    THEN
      s_inci:='D1702';
      s_error:='Prestador inactivo';

      pr_gador_malla_grab_inci(id_factura,
                              w_inci,
                              p_pln,
                              s_campo,
                              s_inci,
                              d_prestador_ordena,
                              r_fact,
                              c_sw_control,
                              s_error,
                              s_objeto);
    ELSE
      -->Cambiar estado de incidencia registrada por este el mismo motivo
      s_inci := 'D1702';
      pr_gador_malla_val_inci(id_factura,
                             p_pln,
                             s_campo,
                             s_inci,
                             r_fact
                             );
    END IF;
  END IF;
  -->El campo 17 (Prestador ordena), debe existir en MCUADPRE para compañia y cuadro medico
  SELECT COUNT(1)
    INTO w_prestador
    FROM MCUADPRE
    WHERE cdunieco=p_cia
    AND cdcuamed=p_cuam
    AND CDPRESTA=d_prestador_ordena
    AND CDESTADO='A';
  IF w_prestador=0
  THEN
    s_inci:='D1703';
    s_error:='Prestador que ordena inactivo para cuadro médico';

    pr_gador_malla_grab_inci(id_factura,
                              w_inci,
                              p_pln,
                              s_campo,
                              s_inci,
                              d_prestador_ordena,
                              r_fact,
                              c_sw_control,
                              s_error,
                              s_objeto);
  ELSE
    -->Cambiar estado de incidencia registrada por este el mismo motivo
    s_inci := 'D1703';
    pr_gador_malla_val_inci(id_factura,
                           p_pln,
                           s_campo,
                           s_inci,
                           r_fact
                           );
  END IF;

  IF s_inci='OK'
  THEN
    SELECT cdperson
      INTO v_ct10_num_per_ord
      FROM   mprestad
      WHERE  cdpresta = d_prestador_ordena;
  END IF;
  RETURN s_inci;
EXCEPTION
    WHEN OTHERS THEN
      s_oraError := SQLERRM;
      pr_graba_error_plano(p_pln,
                         s_oraError,
                         'valida_datos.fn_gador_malla_pres_ordena',
                         r_fact);
  RETURN(s_inci);
END fn_gador_malla_pres_ordena;

   -- Versión  Autor                       Fecha        Comentario
   -- 1.0.000  jlrodriguez-SoftManagement  18/09/2013   Creación - Función encargada de realizar las validaciones del campo 18 (Valor Servicio)
   --                                                   de tipo detalle
   FUNCTION fn_gador_malla_valor_servicio (id_factura           NUMBER    --id factura
                                           ,d_valor_servicio    VARCHAR2    --valor servicio
                                           ,p_cia               VARCHAR2  --compañía
                                           ,r_meds              VARCHAR2  --código prestador
                                           ,p_cuam              VARCHAR2  --cuadro medico
                                           ,d_cod_ser_prestado  VARCHAR2  --código del servicio
                                           ,d_lugar_prest       VARCHAR2      --lugar prestación
                                           ,d_fec_doc_sop       VARCHAR2  --fecha documento soporte
                                           ,d_cant_servicio     VARCHAR2 --cantida de servicio
                                           ,d_recargo           VARCHAR2      --recargo
                                           ,s_soci              VARCHAR2  --codigo prestador socio
                                           ,p_pln               VARCHAR2  --nombre archivo
                                           ,r_fact              VARCHAR2  --número factura
                                           ,p_cod_alea          VARCHAR2  --código alea (variable trabajo 5 - v_ct5_cod_alea)
                                           ,c_sw_control        VARCHAR2)
      RETURN VARCHAR2
   IS
   v_cd_tari    mespepre.cdtarifa%TYPE;
   v_po_dcto    mespepre.podescto%TYPE;
   v_sw_dcto    mespepre.swdesrec%TYPE;
   v_sw_uvrs    mespepre.swuvrs%TYPE;

   v_sw_tman    tariserv.swtarman%TYPE;
   v_pt_vlor    tariserv.ptimport%TYPE;
   v_ptitarif            NUMBER(14,2);
   v_nm_uvrs    tariserv.nmuvrs%TYPE;
   n_vlr_bruto  mfactser.ptisiste%TYPE;
   --variables generales
   w_inci       NUMBER (10) := 1;
   w_inciA      NUMBER (10);
   wcount       NUMBER (5);
   BEGIN
      -->Implementar validaciones de CU-10.0 Validar registros de tipo detalle - Flujo Normal de Trabajo - Paso 18
      -->Utilizar procedimientos [PL_TARISERV] wcdpresta=r_meds, wcdunieco=p_cia, wcdsermed=d_cod_ser_prestado
      -->                                      wfesermed, wnmuniser, wcdrepres, wcdlupres, wcdcuamed,
      -->                                     wcdtarifa, wptivalor, wptitarif,  wporepres,wptisiste, wswtarman *** Ver Anexo 1 CU 10
  v_pt_vlor := d_valor_servicio;
  -- inicializo las variables segun el tipo de dato, para cada validacion
  s_inci :='OK';
  s_campoVal:='VALOR SERVICIO';
  s_campo:='VALOR_SERVICIO';
  s_objeto:='pck_gador_malla_valida_datos.fn_gador_malla_valor_servicio';
  -- valida el campo d_valor_servicio
  -->El campo 18 (Valor servicio), debe ser  mayor a cero
  -->Rev
  BEGIN
		IF to_number(d_valor_servicio)<=0
			THEN
				s_inci:='D1801';
				s_error:='Valor de servicio debe ser mayor que cero';

			pr_gador_malla_grab_inci(id_factura,
                              w_inci,
                              p_pln,
                              s_campo,
                              s_inci,
                              d_valor_servicio,
                              r_fact,
                              c_sw_control,
                              s_error,
                              s_objeto);
		ELSE
			-->Cambiar estado de incidencia registrada por este el mismo motivo
			s_inci := 'D1801';
			pr_gador_malla_val_inci(id_factura,
                           p_pln,
                           s_campo,
                           s_inci,
                           r_fact
                           );
		END IF;
		EXCEPTION
		WHEN OTHERS THEN
			s_oraError := SQLERRM;
			pr_graba_error_plano(p_pln,
						S_Oraerror,
                         'fn_gador_malla_valor_servicio 1.1 val_ser:'||d_valor_servicio,
                         R_Fact);
	END;
  -->El campo 18 (Valor servicio), calcular valor de servicio
  -->Rev
  BEGIN
    /*
    --Para validar en desarrollo
    INSERT INTO P VALUES ('PL_TARISERV('||s_soci||','||
                p_cia || ',' ||
                d_cod_ser_prestado|| ',' ||
                'to_date('||d_fec_doc_sop||',DD/MM/YY)'|| ',' ||
                d_cant_servicio|| ',' ||
                d_recargo|| ',' ||
                d_lugar_prest|| ',' ||
                p_cuam|| ',' ||
                v_cd_tari|| ',' ||
                v_pt_vlor|| ',' ||
                v_ptitarif|| ',' ||
                v_po_dcto|| ',' ||
                n_vlr_bruto|| ',' ||
                v_sw_tman);*/

    PL_TARISERV(s_soci,
                p_cia,
                d_cod_ser_prestado,
                to_date(d_fec_doc_sop,'DD/MM/YY'),
                d_cant_servicio,
                d_recargo,
                d_lugar_prest,
                p_cuam,
                v_cd_tari,
                v_pt_vlor,
                v_ptitarif,
                v_po_dcto,
                n_vlr_bruto,
                v_sw_tman);

  EXCEPTION
  WHEN OTHERS THEN
    v_cd_tari := 0;
    v_pt_vlor := 0;
    v_ptitarif := 0;
    v_po_dcto := 0;
    n_vlr_bruto := 0;
	pr_graba_error_plano(p_pln,
                         S_Oraerror,
                         'valor_servicio 1.2 s_soci:'||S_Soci,
                         R_Fact);
        pr_graba_error_plano(p_pln,
                         S_Oraerror,
                         'valor_servicio 1.2 p_cia:'||P_Cia,
                         R_Fact);
        pr_graba_error_plano(p_pln,
                         S_Oraerror,
                         'valor_servicio 1.2 d_cod_ser_prestado:'||d_cod_ser_prestado,
                         R_Fact);
        pr_graba_error_plano(p_pln,
                         S_Oraerror,
                         'valor_servicio 1.2 d_fec_doc_sop:'||d_fec_doc_sop,
                         R_Fact);
        pr_graba_error_plano(p_pln,
                         S_Oraerror,
                         'valor_servicio 1.2 d_cant_servicio:'||d_cant_servicio,
                         R_Fact);
        pr_graba_error_plano(p_pln,
                         S_Oraerror,
                         'valor_servicio 1.2 d_recargo:'||d_recargo,
                         R_Fact);
        pr_graba_error_plano(p_pln,
                         S_Oraerror,
                         'valor_servicio 1.2 d_lugar_prest:'||D_Lugar_Prest,
                         R_Fact);
        pr_graba_error_plano(p_pln,
                         S_Oraerror,
                         'valor_servicio 1.2 p_cuam:'||p_cuam,
                         R_Fact);
        pr_graba_error_plano(p_pln,
                         S_Oraerror,
                         'valor_servicio 1.2 v_cd_tari:'||v_cd_tari,
                         R_Fact);
        pr_graba_error_plano(p_pln,
                         S_Oraerror,
                         'valor_servicio 1.2 v_pt_vlor:'||v_pt_vlor,
                         R_Fact); 
        pr_graba_error_plano(p_pln,
                         S_Oraerror,
                         'valor_servicio 1.2 v_ptitarif:'||v_ptitarif,
                         R_Fact); 
        pr_graba_error_plano(p_pln,
                         S_Oraerror,
                         'valor_servicio 1.2 v_po_dcto:'||v_po_dcto,
                         R_Fact); 
        pr_graba_error_plano(p_pln,
                         S_Oraerror,
                         'valor_servicio 1.2 n_vlr_bruto:'||n_vlr_bruto,
                         R_Fact); 
        pr_graba_error_plano(p_pln,
                         S_Oraerror,
                         'valor_servicio 1.2 v_sw_tman:'||v_sw_tman,
                         R_Fact); 
  END;
  -->El procedimiento PL_TARISERV no devuelve los datos de indicador de descuento (SWDESREC) e indicador de uvrs (SWUVRS)
  -->La validación se hace contra los campos que si devuelve cuadro de tarifas (CDTARIFA) y porcentaje de descuento (PODESCTO)
  BEGIN
  IF v_cd_tari = 0 OR v_cd_tari IS NULL THEN
    s_inci:='D1802';
    s_error:='No existe convenio para servicio';

    pr_gador_malla_grab_inci(id_factura,
                              w_inci,
                              p_pln,
                              s_campo,
                              s_inci,
                              d_valor_servicio,
                              r_fact,
                              c_sw_control,
                              s_error,
                              s_objeto);
  ELSE
    -->Cambiar estado de incidencia registrada por este el mismo motivo
    s_inci := 'D1802';
    pr_gador_malla_val_inci(id_factura,
                           p_pln,
                           s_campo,
                           s_inci,
                           r_fact
                           );
  END IF;
  Exception
    When Others Then
    pr_graba_error_plano(p_pln,
                         S_Oraerror,
                         'valor_servicio 1.3 id_factura:'||id_factura,
                         R_Fact); 
    pr_graba_error_plano(p_pln,
                         S_Oraerror,
                         'valor_servicio 1.3 w_inci:'||w_inci,
                         R_Fact); 
    pr_graba_error_plano(p_pln,
                         S_Oraerror,
                         'valor_servicio 1.3 p_pln:'||p_pln,
                         R_Fact); 
    pr_graba_error_plano(p_pln,
                         S_Oraerror,
                         'valor_servicio 1.3 s_campo:'||s_campo,
                         R_Fact);
    pr_graba_error_plano(p_pln,
                         S_Oraerror,
                         'valor_servicio 1.3 s_inci:'||s_inci,
                         R_Fact);
    pr_graba_error_plano(p_pln,
                         S_Oraerror,
                         'valor_servicio 1.3 d_valor_servicio:'||d_valor_servicio,
                         R_Fact);
    pr_graba_error_plano(p_pln,
                         S_Oraerror,
                         'valor_servicio 1.3 r_fact:'||r_fact,
                         R_Fact);
    pr_graba_error_plano(p_pln,
                         S_Oraerror,
                         'valor_servicio 1.3 c_sw_control:'||c_sw_control,
                         R_Fact);
    pr_graba_error_plano(p_pln,
                         S_Oraerror,
                         'valor_servicio 1.3 s_error:'||s_error,
                         R_Fact);
    pr_graba_error_plano(p_pln,
                         S_Oraerror,
                         'valor_servicio 1.3 s_objeto:'||s_objeto,
                         R_Fact);
  END;

  -->En el procedimiento PL_TARISERV se hace la consulta contra MEXCEPRE y en caso de existir registros deja
  -->los valores de wcdtarifa, wpodescto, wswind1 y wswuvrs en NULL
  -->El procedimiento solo devuelve los dos primeros, por tanto se hace la validación contra esos dos campos
  SELECT COUNT(*)
    INTO wcount
    FROM MEXCEPRE
   WHERE CDUNIECO = p_cia
     AND CDPRESTA = r_meds
     AND CDCUAMED = p_cuam
     AND (CDSERMED = d_cod_ser_prestado OR d_cod_ser_prestado BETWEEN CDSERVDE AND CDSERVHA)
     AND CDLUPRES = d_lugar_prest
     AND to_date(d_fec_doc_sop,'DD/MM/YY') BETWEEN FEINIEXC AND decode(FEFINEXC, NULL, to_date('24/12/4710', 'DD/MM/YYYY'),FEFINEXC);

  BEGIN
  IF wcount > 0 THEN
    s_inci:='D1803';
    s_error:='No hay convenio. Servicio por excepción';

    pr_gador_malla_grab_inci(id_factura,
                              w_inci,
                              p_pln,
                              s_campo,
                              s_inci,
                              d_valor_servicio,
                              r_fact,
                              c_sw_control,
                              s_error,
                              s_objeto);
  ELSE
    -->Cambiar estado de incidencia registrada por este el mismo motivo
    s_inci := 'D1803';
    pr_gador_malla_val_inci(id_factura,
                           p_pln,
                           s_campo,
                           s_inci,
                           r_fact
                           );
  END IF;
  Exception
    When Others Then
    pr_graba_error_plano(p_pln,
                         S_Oraerror,
                         'valor_servicio 1.4 id_factura:'||id_factura,
                         R_Fact); 
    pr_graba_error_plano(p_pln,
                         S_Oraerror,
                         'valor_servicio 1.4 w_inci:'||w_inci,
                         R_Fact); 
    pr_graba_error_plano(p_pln,
                         S_Oraerror,
                         'valor_servicio 1.4 p_pln:'||p_pln,
                         R_Fact); 
    pr_graba_error_plano(p_pln,
                         S_Oraerror,
                         'valor_servicio 1.4 s_campo:'||s_campo,
                         R_Fact);
    pr_graba_error_plano(p_pln,
                         S_Oraerror,
                         'valor_servicio 1.4 s_inci:'||s_inci,
                         R_Fact);
    pr_graba_error_plano(p_pln,
                         S_Oraerror,
                         'valor_servicio 1.4 d_valor_servicio:'||d_valor_servicio,
                         R_Fact);
    pr_graba_error_plano(p_pln,
                         S_Oraerror,
                         'valor_servicio 1.4 r_fact:'||r_fact,
                         R_Fact);
    pr_graba_error_plano(p_pln,
                         S_Oraerror,
                         'valor_servicio 1.4 c_sw_control:'||c_sw_control,
                         R_Fact);
    pr_graba_error_plano(p_pln,
                         S_Oraerror,
                         'valor_servicio 1.4 s_error:'||s_error,
                         R_Fact);
    pr_graba_error_plano(p_pln,
                         S_Oraerror,
                         'valor_servicio 1.4 s_objeto:'||S_Objeto,
                         R_Fact);
  END;

  -->Se realiza la validación contra los valores que devuelve PL_TARISERV cuando no encuentra la tarifa
  BEGIN
  IF v_pt_vlor < 1 OR v_pt_vlor IS NULL THEN
    s_inci:='D1804';
    s_error:='No se encontró tarifa para el servicio';

    pr_gador_malla_grab_inci(id_factura,
                              w_inci,
                              p_pln,
                              s_campo,
                              s_inci,
                              d_valor_servicio,
                              r_fact,
                              c_sw_control,
                              s_error,
                              s_objeto);
  ELSE
    -->Cambiar estado de incidencia registrada por este el mismo motivo
    s_inci := 'D1804';
    pr_gador_malla_val_inci(id_factura,
                           p_pln,
                           s_campo,
                           s_inci,
                           r_fact
                           );
  END IF;
  Exception
    When Others Then
    pr_graba_error_plano(p_pln,
                         S_Oraerror,
                         'valor_servicio 1.5 id_factura:'||id_factura,
                         R_Fact); 
    pr_graba_error_plano(p_pln,
                         S_Oraerror,
                         'valor_servicio 1.5 w_inci:'||w_inci,
                         R_Fact); 
    pr_graba_error_plano(p_pln,
                         S_Oraerror,
                         'valor_servicio 1.5 p_pln:'||p_pln,
                         R_Fact); 
    pr_graba_error_plano(p_pln,
                         S_Oraerror,
                         'valor_servicio 1.5 s_campo:'||s_campo,
                         R_Fact);
    pr_graba_error_plano(p_pln,
                         S_Oraerror,
                         'valor_servicio 1.5 s_inci:'||s_inci,
                         R_Fact);
    pr_graba_error_plano(p_pln,
                         S_Oraerror,
                         'valor_servicio 1.5 d_valor_servicio:'||d_valor_servicio,
                         R_Fact);
    pr_graba_error_plano(p_pln,
                         S_Oraerror,
                         'valor_servicio 1.5 r_fact:'||r_fact,
                         R_Fact);
    pr_graba_error_plano(p_pln,
                         S_Oraerror,
                         'valor_servicio 1.5 c_sw_control:'||c_sw_control,
                         R_Fact);
    pr_graba_error_plano(p_pln,
                         S_Oraerror,
                         'valor_servicio 1.5 s_error:'||s_error,
                         R_Fact);
    pr_graba_error_plano(p_pln,
                         S_Oraerror,
                         'valor_servicio 1.5 s_objeto:'||S_Objeto,
                         R_Fact);
  END;

  --Valor servicio debe ser igual al valor reportado
  BEGIN
  IF v_pt_vlor<>d_valor_servicio
  THEN
    s_inci:='D1805';
    s_error:='Valor de servicio diferente A Valor convenido';

    pr_gador_malla_grab_inci(id_factura,
                              w_inci,
                              p_pln,
                              s_campo,
                              s_inci,
                              d_valor_servicio,
                              r_fact,
                              c_sw_control,
                              s_error,
                              s_objeto);
  ELSE
    -->Cambiar estado de incidencia registrada por este el mismo motivo
    s_inci := 'D1805';
    pr_gador_malla_val_inci(id_factura,
                           p_pln,
                           s_campo,
                           s_inci,
                           r_fact
                           );
  END IF;
    Exception
    When Others Then
    pr_graba_error_plano(p_pln,
                         S_Oraerror,
                         'valor_servicio 1.6 id_factura:'||id_factura,
                         R_Fact); 
    pr_graba_error_plano(p_pln,
                         S_Oraerror,
                         'valor_servicio 1.6 w_inci:'||w_inci,
                         R_Fact); 
    pr_graba_error_plano(p_pln,
                         S_Oraerror,
                         'valor_servicio 1.6 p_pln:'||p_pln,
                         R_Fact); 
    pr_graba_error_plano(p_pln,
                         S_Oraerror,
                         'valor_servicio 1.6 s_campo:'||s_campo,
                         R_Fact);
    pr_graba_error_plano(p_pln,
                         S_Oraerror,
                         'valor_servicio 1.6 s_inci:'||s_inci,
                         R_Fact);
    pr_graba_error_plano(p_pln,
                         S_Oraerror,
                         'valor_servicio 1.6 d_valor_servicio:'||d_valor_servicio,
                         R_Fact);
    pr_graba_error_plano(p_pln,
                         S_Oraerror,
                         'valor_servicio 1.6 r_fact:'||r_fact,
                         R_Fact);
    pr_graba_error_plano(p_pln,
                         S_Oraerror,
                         'valor_servicio 1.6 c_sw_control:'||c_sw_control,
                         R_Fact);
    pr_graba_error_plano(p_pln,
                         S_Oraerror,
                         'valor_servicio 1.6 s_error:'||s_error,
                         R_Fact);
    pr_graba_error_plano(p_pln,
                         S_Oraerror,
                         'valor_servicio 1.6 s_objeto:'||S_Objeto,
                         R_Fact);
  END;
  RETURN s_inci;
EXCEPTION
    WHEN OTHERS THEN
      s_oraError := SQLERRM;
      pr_graba_error_plano(p_pln,
                         s_oraError,
                         'valid_dato.fn_gador_malla_val_serv f '||d_valor_servicio,
                         r_fact);
   RETURN(s_inci);
END fn_gador_malla_valor_servicio;

   -- Versión  Autor                       Fecha        Comentario
   -- 1.0.000  jlrodriguez-SoftManagement  18/09/2013   Creación - Funcion encargada de realizar las validaciones del campo 19 (Numero de solicitud)
   --                                                   de tipo detalle
   FUNCTION fn_gador_malla_nro_solicitud (id_factura          NUMBER    --id factura
                                          ,d_nro_solicitud    VARCHAR2    --número solicitud
                                          ,p_pln              VARCHAR2  --nombre archivo
                                          ,r_fact             VARCHAR2  --número factura
                                          ,p_niv_aut          VARCHAR2  --nivel autorización campo trabajo 8 v_ct8_niv_aut
                                          ,d_fec_doc_sop      VARCHAR2  --Fecha documento de soporte
                                          ,r_meds             VARCHAR2  --código del prestador
                                          ,c_sw_control       VARCHAR2
										  ,p_ramo             Number    --JaFarias 23/05/2014
                                          ,p_cto              Number    --JaFarias 23/05/2014
                                          ,p_fam              Number    --JaFarias 23/05/2014
                                          ,p_usu              Number    --JaFarias 23/05/2014

										  )
      RETURN VARCHAR2
   IS
   w_solicitud  NUMBER(3):=0;
   v_solicitud  NUMBER(9):=0;
   v_factura  VARCHAR2(20);
   w_cdperson  NUMBER(9);
   -->variables para campos que se deben guardar
   v_cdtipaut   mvolanca.cdtipaut%TYPE;
   v_cdcencos   mvolanca.cdcencos%TYPE;
   v_nmsecaut   mvolanca.nmsecaut%TYPE;
   --variables generales
  w_inci       NUMBER (10) := 1;
  w_inciA       NUMBER (10);
  v_noj         NUMBER(1);
  v_vol         mvolanca.nmautori%TYPE;
  v_fcta        mgrabcue.nmfactur%TYPE;
  v_estd        number(1);
  v_diasaut     mvolanca.nmdiaest%TYPE;


  --Inicio Declaracion de Variables Nueva Validacion de Tipo honorario, Clase y tipo Servicio JaFarias 22/05/2014
  vramo   Number;
  vcto    Number;
  vfmus   Number;
  vtip    Varchar2(500);
  vcla    Varchar2(500);
  vdia    Number;
  vccos   Varchar2(500);
  nmpra   Number;
  nmord   Number;
  cdord   Varchar2(500);
  --Fin Declaracion


BEGIN
      -->Implementar validaciones de CU-10.0 Validar registros de tipo detalle - Flujo Normal de Trabajo - Paso 19
      -->Utilizar procedimientos [Pck_Epsga_Grb.Vol_Nsol] ?? No es claro en el CU si se debe usar
      -->                        [Frecep_Ga.Ver_Norj] <-- Para obtener atributo 10  v_med=r_meds ***
      -->CDPERSON debe venir del paso 3 CU 7.0 ???? se puede utilizar el mismo query filtrando por r_meds?
  -- inicializo las variables segun el tipo de dato, para cada validacion
  s_inci :='OK';
  s_campoVal:='NUMERO DE SOLICITUD';
  s_campo:='NUMERO_SOLICITUD';
  s_objeto:='pck_gador_malla_valida_datos.fn_gador_malla_nro_solicitud';


  -->Rev
  IF TO_NUMBER(d_nro_solicitud)=0  THEN
    IF p_niv_aut='M'    THEN
      s_inci:='D1901';
      s_error:='Servicio requiere volante de autorización';

      pr_gador_malla_grab_inci(id_factura,
                              w_inci,
                              p_pln,
                              s_campo,
                              s_inci,
                              d_nro_solicitud,
                              r_fact,
                              c_sw_control,
                              s_error,
                              s_objeto);
    ELSE
      -->Cambiar estado de incidencia registrada por este el mismo motivo
      s_inci := 'D1901';
      pr_gador_malla_val_inci(id_factura,
                             p_pln,
                             s_campo,
                             s_inci,
                             r_fact
                             );
    END IF;
  END IF;
  -- El numero de solicitud debe ser igual a 0
  IF TO_NUMBER(d_nro_solicitud)<>0  THEN
    IF TO_NUMBER(d_nro_solicitud)>0    THEN
      --obtener atributo 10
      Frecep_Ga.Ver_Norj(r_meds,v_noj);

	  Pck_Epsga_Grb.Vol_Nsol(To_Number(d_nro_solicitud), --JaFarias: Se agrega TO_NUMBER, Dado que el procedimiento recibe numerico
                             v_noj,
                             to_char(to_date(d_fec_doc_sop, 'DD/MM/YYYY'), 'YYYYMMDD'),
                             v_vol,
                             v_fcta,
                             v_estd,
                             v_diasaut);
      --N-->1,S-->2
      --Debe existir en MVOLANCA para solicitud y secuencia
      /*SELECT COUNT(1)
        INTO w_solicitud
        FROM   MVOLANCA
        WHERE  NMSOLVOL=d_nro_solicitud
        AND NMSECAUT=w_solicitud;*/
      --Si no existe el registro
      IF v_estd IS NULL OR v_estd = 4  THEN
        s_inci:='D1902';
        s_error:='Volante NO existe';

        pr_gador_malla_grab_inci(id_factura,
                              w_inci,
                              p_pln,
                              s_campo,
                              s_inci,
                              d_nro_solicitud,
                              r_fact,
                              c_sw_control,
                              s_error,
                              s_objeto);
      ELSE
        -->Cambiar estado de incidencia registrada por este el mismo motivo
        s_inci := 'D1902';
        pr_gador_malla_val_inci(id_factura,
                               p_pln,
                               s_campo,
                               s_inci,
                               r_fact
                               );
      END IF;

      IF v_estd = 1  OR  v_estd = 2 OR v_estd = 3  OR v_estd = 5 THEN --JaFarias 22/05/2014    THEN
        --Si existe el registro debe estar activo, CDESTVOL is null
        /*SELECT COUNT(1)
          INTO w_solicitud
          FROM   MVOLANCA
          WHERE  NMSOLVOL=d_nro_solicitud
          AND NMSECAUT=w_solicitud
          AND CDESTVOL IS NULL;
        --si no esta activo
        IF w_solicitud=0
        THEN*/
        s_inci:='D1903';
        s_error:='Volante Utilizado, Vencido, Anulado o con Configuración (N / J) diferente a la del volante.';

        pr_gador_malla_grab_inci(id_factura,
                            w_inci,
                            p_pln,
                            s_campo,
                            s_inci,
                            d_nro_solicitud,
                            r_fact,
                            c_sw_control,
                            s_error,
                            s_objeto);
      ELSE
        -->Cambiar estado de incidencia registrada por este el mismo motivo
        s_inci := 'D1903';
        pr_gador_malla_val_inci(id_factura,
                               p_pln,
                               s_campo,
                               s_inci,
                               r_fact
                               );
      END IF;
      --Si existe el registro el CDPERSPR debe ser igual al CDPERSON de campo 3
      SELECT cdperson
         INTO w_cdperson
         FROM mprestad M
        WHERE M.CDPRESTA = r_meds;

      SELECT CDPERSPR
        INTO v_solicitud
        FROM   MVOLANCA
        WHERE  NMSOLVOL=d_nro_solicitud
        AND NMSECAUT=v_noj;
      --si no es igual
      IF v_solicitud<>w_cdperson      THEN
        s_inci:='D1904';
        s_error:='Volante de otro prestador';

        pr_gador_malla_grab_inci(id_factura,
                            w_inci,
                            p_pln,
                            s_campo,
                            s_inci,
                            d_nro_solicitud,
                            r_fact,
                            c_sw_control,
                            s_error,
                            s_objeto);
      ELSE
        -->Cambiar estado de incidencia registrada por este el mismo motivo
        s_inci := 'D1904';
        pr_gador_malla_val_inci(id_factura,
                               p_pln,
                               s_campo,
                               s_inci,
                               r_fact
                               );
      END IF;
      --Si existe el registro NMFACTUR y FEUSOFAC deben ser nulos
      /*SELECT count(1)
        INTO w_solicitud
        FROM   MVOLANCA
        WHERE  NMSOLVOL=d_nro_solicitud
        AND NMSECAUT=w_solicitud
        AND NMFACTUR IS NULL
        AND FEUSOFAC IS NULL;*/
      --si no existe ese registro
      IF v_estd=1 AND v_fcta <> r_fact      THEN
        /*--NMFACTUR debe ser igual al campo 5(número de factura)
        SELECT NMFACTUR
          INTO v_factura
          FROM   MVOLANCA
          WHERE  NMSOLVOL=d_nro_solicitud
          AND NMSECAUT=w_solicitud;
        --si son diferentes
        IF v_factura<>r_fact
        THEN*/
        s_inci:='D1905';
        s_error:='Volante grabado en otra factura';

        pr_gador_malla_grab_inci(id_factura,
                          w_inci,
                          p_pln,
                          s_campo,
                          s_inci,
                          d_nro_solicitud,
                          r_fact,
                          c_sw_control,
                          s_error,
                          s_objeto);
      ELSE
        -->Cambiar estado de incidencia registrada por este el mismo motivo
        s_inci := 'D1905';
        pr_gador_malla_val_inci(id_factura,
                               p_pln,
                               s_campo,
                               s_inci,
                               r_fact
                               );
      END IF;
    END IF;

	Pck_EpsGa_Grb.Dat_Vlte(To_Number(d_nro_solicitud),v_noj,vramo,vcto,vfmus,vtip,vcla,vdia,vccos,nmpra,nmord,cdord);--JaFarias

	IF vramo IS NOT NULL AND vcto IS NOT NULL AND vfmus IS NOT NULL THEN  --12/06/2014 JaFarias

	--Inicio Validacion Usuario Volante Diferente a Usuario Plano 23/05/2014 (JaFarias)
      IF vramo <> p_ramo OR vcto <> p_cto OR Floor(vfmus/100) <> p_fam OR Mod(vfmus,100) <> p_usu THEN

        s_inci:='D1906';
        s_error:='Usuario de plano diferente al del volante';

        pr_gador_malla_grab_inci( id_factura,
                                  w_inci,
                                  p_pln,
                                  s_campo,
                                  s_inci,
                                  d_nro_solicitud,
                                  r_fact,
                                  c_sw_control,
                                  s_error,
                                  s_objeto);


      ELSE

        -->Cambiar estado de incidencia registrada por este el mismo motivo
        s_inci := 'D1906';
        pr_gador_malla_val_inci(id_factura,
                               p_pln,
                               s_campo,
                               s_inci,
                               r_fact
                               );

      END IF;

	END IF;
    --Fin Validacion Usuario Volante Diferente a Usuario Plano 23/05/2014 (JaFarias)


    --SE DEBEN GUARDAR CDTIPAUT, CDCENCOS y NMSECAUT
    SELECT CDTIPAUT, CDCENCOS, NMSECAUT
      INTO v_cdtipaut,v_cdcencos,v_nmsecaut
      FROM   MVOLANCA
      WHERE  NMSOLVOL=d_nro_solicitud
      AND NMSECAUT=v_noj;
  END IF;

  RETURN s_inci;

EXCEPTION
    WHEN OTHERS THEN
      s_oraError := SQLERRM;
      pr_graba_error_plano(p_pln,
                         s_oraError,
                         'valida_datos.fn_gador_malla_nro_solicitud',
                         r_fact);
  RETURN(s_inci);
END fn_gador_malla_nro_solicitud;

   -- Versión  Autor                       Fecha        Comentario
   -- 1.0.000  jlrodriguez-SoftManagement  18/09/2013   Creación - Función encargada de realizar las validaciones del campo 20 (Número de sesiones)
   --                                                   de tipo detalle

   FUNCTION fn_gador_malla_nro_sesiones (id_factura          NUMBER   --id factura
                                         ,d_nro_sesiones     VARCHAR2   --número de sesiones
                                         ,d_nro_solicitud    VARCHAR2   --número de solicitud
                                         ,d_lugar_prest      VARCHAR2     --lugar prestación
                                         ,p_pln              VARCHAR2 --nombre archivo
                                         ,r_fact             VARCHAR2 --número fatura
                                         ,c_sw_control       VARCHAR2)
      RETURN VARCHAR2
   IS
  w_sesiones   NUMBER(3):=0;
   --variables generales
  w_inci       NUMBER (10) := 1;
  w_inciA       NUMBER (10);
   BEGIN
      -->Implementar validaciones de CU-10.0 Validar registros de tipo detalle - Flujo Normal de Trabajo - Paso 20
  -- inicializo las variables segun el tipo de dato, para cada validacion
  s_inci :='OK';
  s_campoVal:='NUMERO DE SESIONES';
  s_campo:='NUMERO_SESIONES';
  s_objeto:='pck_gador_malla_valida_datos.fn_gador_malla_nro_sesiones';
  -- valida el campo d_nro_sesiones
  -->El campo 20 (Numero de sesiones), si d_nro_sesiones>0 entonces d_nro_solicitud>0
  IF TO_NUMBER(d_nro_sesiones)>0
  THEN
    --si no es mayor a cero
    IF TO_NUMBER(d_nro_solicitud)<=0
    THEN
      s_inci:='D2001';
      s_error:='Sesiones requieren volante';

      pr_gador_malla_grab_inci(id_factura,
                              w_inci,
                              p_pln,
                              s_campo,
                              s_inci,
                              d_nro_sesiones,
                              r_fact,
                              c_sw_control,
                              s_error,
                              s_objeto);
    ELSE
        -->Cambiar estado de incidencia registrada por este el mismo motivo
        s_inci := 'D2001';
        pr_gador_malla_val_inci(id_factura,
                               p_pln,
                               s_campo,
                               s_inci,
                               r_fact
                               );
    END IF;
  END IF;
  -->Rev
  -->El campo 20 (Numero de sesiones), si d_nro_sesiones no debe ser mayor a NMSESION
  BEGIN
    SELECT NMSESION
      INTO w_sesiones
      FROM   MVOLANCA
      WHERE NMSOLVOL=d_nro_solicitud;
  EXCEPTION WHEN NO_DATA_FOUND THEN
     w_sesiones := 0;
  END;
  --Si es mayor
  IF d_nro_sesiones>w_sesiones
  THEN
    s_inci:='D2002';
    s_error:='Número de sesiones superan las autorizadas';

    pr_gador_malla_grab_inci(id_factura,
                              w_inci,
                              p_pln,
                              s_campo,
                              s_inci,
                              d_nro_sesiones,
                              r_fact,
                              c_sw_control,
                              s_error,
                              s_objeto);
  ELSE
    -->Cambiar estado de incidencia registrada por este el mismo motivo
    s_inci := 'D2002';
    pr_gador_malla_val_inci(id_factura,
                           p_pln,
                           s_campo,
                           s_inci,
                           r_fact
                           );
  END IF;
  -->El campo 20 (Numero de sesiones), si d_nro_sesiones >0 y lugar debe ser C, A
  -->Rev
  IF TO_NUMBER(d_nro_sesiones)>0
  THEN
    -- si lugar no es C ni A
    IF d_lugar_prest<>'C' AND d_lugar_prest<>'A'
    THEN
      s_inci:='D2003';
      s_error:='Sesiones en lugar diferente de C o A';

      pr_gador_malla_grab_inci(id_factura,
                              w_inci,
                              p_pln,
                              s_campo,
                              s_inci,
                              d_nro_sesiones,
                              r_fact,
                              c_sw_control,
                              s_error,
                              s_objeto);
    ELSE
      -->Cambiar estado de incidencia registrada por este el mismo motivo
      s_inci := 'D2003';
      pr_gador_malla_val_inci(id_factura,
                             p_pln,
                             s_campo,
                             s_inci,
                             r_fact
                             );
    END IF;
  END IF;
  RETURN s_inci;
EXCEPTION
    WHEN OTHERS THEN
      s_oraError := SQLERRM;
      pr_graba_error_plano(p_pln,
                         s_oraError,
                         'valida_datos.fn_gador_malla_nro_sesiones',
                         r_fact);
   RETURN(s_inci);
END fn_gador_malla_nro_sesiones;

   -- Versión  Autor                       Fecha        Comentario
   -- 1.0.000  jlrodriguez-SoftManagement  18/09/2013   Creación - Funcion encargada de realizar las validaciones días de estancia

  FUNCTION fn_gador_malla_dias_estancia (id_factura             NUMBER   --id factura
                                        ,d_cod_ser_prestado    VARCHAR2   --código servicio prestado
                                        ,d_nro_solicitud       VARCHAR2   --número de solicitud
                                        ,d_lugar_prest         VARCHAR2     --lugar prestación
                                        ,d_nro_sesiones        VARCHAR2   --NUmero de sesiones
                                        ,p_pln                 VARCHAR2 --nombre archivo
                                        ,r_fact                VARCHAR2 --número factura
                                        ,r_meds                VARCHAR2  --código del prestador
                                        ,c_sw_control          VARCHAR2)
    RETURN VARCHAR2
  IS
  v_nmsecaut            NUMBER(4);
  v_cdcencos            VARCHAR2(7);
  v_nmautori            VARCHAR2(10);
  vramo                 NUMBER(3);
  vcto                  NUMBER(10);
  vfmus                 NUMBER(6);
  vtip                  VARCHAR2(1);
  vcla                 VARCHAR2(2);
  vdia                  NUMBER(3) := 0;
  vccos                 VARCHAR2(7);
  nmord                 NUMBER(9);
  cdord                 VARCHAR2(15);
  v_noj                 NUMBER(1);
  --
  w_inci       NUMBER (10) := 1;
  BEGIN
    s_inci :='OK';
    s_campoVal:='NUMERO DE SESIONES';
    s_campo:='NUMERO_SESIONES';
    s_objeto:='pck_gador_malla_valida_datos.fn_gador_malla_dias_estancia';
    -->Implementar validaciones de CU-10.0 Validar registros de tipo detalle - Flujo Normal de Trabajo - Paso 21
    /*BEGIN
       SELECT cdcencos, nmautori, nmsecaut
         INTO v_cdcencos, v_nmautori, v_nmsecaut
       FROM   mvolanca
       WHERE  nmsolvol= d_nro_solicitud;
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
       v_cdcencos := NULL;
       v_nmautori := NULL;
       v_nmsecaut := NULL;
    END;*/
    Frecep_Ga.Ver_Norj(r_meds,v_noj);
    fgraba_ga.dat_vlte(d_nro_solicitud,v_noj,vramo,vcto,vfmus,vtip,vcla,vdia,vccos,nmord,cdord);
    IF vdia IS NULL THEN
      vdia := 0;
    END IF;
    -->Si el campo 14 (Código servicio) empieza por `602¿ o `604¿; el número de veces que se registre no puede ser mayor
    -->al número de días (NMDIAEST) autorizados en el volante (MVOLANCA)
    IF substr(d_cod_ser_prestado, 1, 3) = '602' OR substr(d_cod_ser_prestado, 1, 3) = '604'
    THEN
      IF d_nro_sesiones > vdia
      THEN
        s_inci:='D2004';
        s_error:='Número de días superan los autorizados';

        pr_gador_malla_grab_inci(id_factura,
                                w_inci,
                                p_pln,
                                s_campo,
                                s_inci,
                                d_nro_sesiones,
                                r_fact,
                                c_sw_control,
                                s_error,
                                s_objeto);
      ELSE
        -->Cambiar estado de incidencia registrada por este el mismo motivo
        s_inci := 'D2004';
        pr_gador_malla_val_inci(id_factura,
                               p_pln,
                               s_campo,
                               s_inci,
                               r_fact
                               );
      END IF;
    END IF;
    RETURN s_inci;
  END fn_gador_malla_dias_estancia;

   /*
   VALIDACION DE REGISTROS TIPO TOTALES
   */
   -- Versión  Autor                       Fecha        Comentario
   -- 1.0.000  jlrodriguez-SoftManagement  18/09/2013   Creación - Función encargada de realizar las validaciones del campo 2 (Numero de registros S)
   --                                                   de tipo totales
   FUNCTION fn_gador_malla_nro_reg_s (id_factura       NUMBER   --id factura
                                      ,t_nro_reg_s     NUMBER   --número de registros tipo S
                                      ,p_pln           VARCHAR2 --nombre archivo
                                      ,r_fact          VARCHAR2 --número factura
                                      ,c_sw_control    VARCHAR2)
      RETURN VARCHAR2
   IS
  --variables generales
  w_inci       NUMBER (10) := 1;
  w_inciA       NUMBER (10);
   BEGIN
      -->Implementar validaciones de CU-10.0 Validar registros de tipo totales - Flujo Normal de Trabajo - Paso 2
  -- inicializo las variables segun el tipo de dato, para cada validacion
  s_inci :='OK';
  s_campoVal:='NUMERO DE REGISTROS S';
  s_campo:='NUM_REGISTROS_S';
  s_objeto:='pck_gador_malla_valida_datos.fn_gador_malla_nro_reg_s';
  -- valida el campo t_nro_reg_s
  -->El campo 2 (Numero de registros S), debe ser  mayor de cero
  IF t_nro_reg_s<=0
  THEN
    s_inci:='T0201';
    s_error:='Número de registros tipo S incorrecto';

    pr_gador_malla_grab_inci(id_factura,
                              w_inci,
                              p_pln,
                              s_campo,
                              s_inci,
                              t_nro_reg_s,
                              r_fact,
                              c_sw_control,
                              s_error,
                              s_objeto);
  ELSE
      -->Cambiar estado de incidencia registrada por este el mismo motivo
      s_inci := 'T0201';
      pr_gador_malla_val_inci(id_factura,
                             p_pln,
                             s_campo,
                             s_inci,
                             r_fact
                             );
  END IF;
  -->El campo 2 (Numero de registros S), debe ser  igual al número de registros tipo `S¿ de la factura (1)
  IF t_nro_reg_s<>1
  THEN
    s_inci:='T0202';
    s_error:='Número de registros tipo S NO coincide';

    pr_gador_malla_grab_inci(id_factura,
                              w_inci,
                              p_pln,
                              s_campo,
                              s_inci,
                              t_nro_reg_s,
                              r_fact,
                              c_sw_control,
                              s_error,
                              s_objeto);
  ELSE
      -->Cambiar estado de incidencia registrada por este el mismo motivo
      s_inci := 'T0202';
      pr_gador_malla_val_inci(id_factura,
                             p_pln,
                             s_campo,
                             s_inci,
                             r_fact
                             );
  END IF;
    RETURN s_inci;
 EXCEPTION
    WHEN OTHERS THEN
      s_oraError := SQLERRM;
      pr_graba_error_plano(p_pln,
                         s_oraError,
                         'valida_datos.fn_gador_malla_nro_reg_s',
                         r_fact);
    RETURN(s_inci);
 END fn_gador_malla_nro_reg_s;

   -- Versión  Autor                       Fecha        Comentario
   -- 1.0.000  jlrodriguez-SoftManagement  18/09/2013   Creación - Función encargada de realizar las validaciones del campo 3 (Numero de registros D)
   --                                                   de tipo totales
   FUNCTION fn_gador_malla_nro_reg_d (id_factura       NUMBER   --id factura
                                      ,t_nro_reg_d     VARCHAR2   --numero de registros tipo D
                                      ,p_pln           VARCHAR2 --nombre archivo
                                      ,r_fact          VARCHAR2 --número factura
                    ,v_num_reg_det  NUMBER  --Numero de registros en la factura - D
                                      ,c_sw_control    VARCHAR2)
      RETURN VARCHAR2
   IS
   --variables generales
  w_inci       NUMBER (10) := 1;
  w_inciA       NUMBER (10);
   BEGIN
    -->Implementar validaciones de CU-10.0 Validar registros de tipo totales - Flujo Normal de Trabajo - Paso 3
  -- inicializo las variables segun el tipo de dato, para cada validacion
  s_inci :='OK';
  s_campoVal:='NUMERO DE REGISTROS D';
  s_campo:='NUM_REGISTROS_D';
  s_objeto:='pck_gador_malla_valida_datos.fn_gador_malla_nro_reg_d';
  -->El campo 3 (Numero de registros D),  debe ser  igual al número de registros tipo `D¿ de la factura
  IF t_nro_reg_d<>v_num_reg_det
  THEN
    s_inci:='T0301';
    s_error:='Número de registros tipo D NO coincide';

    pr_gador_malla_grab_inci(id_factura,
                              w_inci,
                              p_pln,
                              s_campo,
                              s_inci,
                              t_nro_reg_d,
                              r_fact,
                              c_sw_control,
                              s_error,
                              s_objeto);
  ELSE
      -->Cambiar estado de incidencia registrada por este el mismo motivo
      s_inci := 'T0301';
      pr_gador_malla_val_inci(id_factura,
                             p_pln,
                             s_campo,
                             s_inci,
                             r_fact
                             );
  END IF;
  RETURN s_inci;
EXCEPTION
    WHEN OTHERS THEN
      s_oraError := SQLERRM;
      pr_graba_error_plano(p_pln,
                         s_oraError,
                         'valida_datos.fn_gador_malla_nro_reg_d',
                         r_fact);
    RETURN(s_inci);
END fn_gador_malla_nro_reg_d;

   -- Versión  Autor                       Fecha        Comentario
   -- 1.0.000  jlrodriguez-SoftManagement  18/09/2013   Creación - Función encargada de realizar las validaciones del campo 4 (Suma de registros D)
   --                                                   de tipo totales
   FUNCTION fn_gador_malla_sum_reg_d (id_factura       NUMBER   --id factura
                                      ,t_sum_reg_d     VARCHAR2   --suma de registros tipo D
                                      ,r_vlor          VARCHAR2 --valor total factura
                                      ,p_pln           VARCHAR2 --nombre archivo
                                      ,r_fact          VARCHAR2 --nímero factura
                                      ,c_sw_control    VARCHAR2)
      RETURN VARCHAR2
   IS
   --variables generales
  w_inci       NUMBER (10) := 1;
  w_inciA       NUMBER (10);
   BEGIN
      -->Implementar validaciones de CU-10.0 Validar registros de tipo totales - Flujo Normal de Trabajo - Paso 4
  -- inicializo las variables segun el tipo de dato, para cada validacion
  s_inci :='OK';
  s_campoVal:='SUMA DE REGISTROS D';
  s_campo:='SUM_REG_TIP_D';
  s_objeto:='pck_gador_malla_valida_datos.fn_gador_malla_sum_reg_d';
  -- valida el campo t_sum_reg_d
  -->El campo 4 (Suma de registros D), debe ser  igual a r_vlor
  IF r_vlor<>t_sum_reg_d
  THEN
    s_inci:='T0401';
    s_error:='Suma de registros tipo D incorrecto';

    pr_gador_malla_grab_inci(id_factura,
                              w_inci,
                              p_pln,
                              s_campo,
                              s_inci,
                              t_sum_reg_d,
                              r_fact,
                              c_sw_control,
                              s_error,
                              s_objeto);
  ELSE
      -->Cambiar estado de incidencia registrada por este el mismo motivo
      s_inci := 'T0401';
      pr_gador_malla_val_inci(id_factura,
                             p_pln,
                             s_campo,
                             s_inci,
                             r_fact
                             );
  END IF;
  RETURN s_inci;
EXCEPTION
    WHEN OTHERS THEN
      s_oraError := SQLERRM;
      pr_graba_error_plano(p_pln,
                         s_oraError,
                         'valida_datos.fn_gador_malla_sum_reg_d',
                         r_fact);
  RETURN(s_inci);
END fn_gador_malla_sum_reg_d;

PROCEDURE pr_graba_error_plano(p_nom_archivo IN VARCHAR2,
                               p_ora_error      IN VARCHAR2,
                               p_error  IN VARCHAR2,
                               p_num_factura IN VARCHAR2)
  IS
  v_secError NUMBER(10);
  BEGIN
    BEGIN
       SELECT nvl(max(secuencia), 0)+1
        INTO v_secError
       FROM plano_ga_error
       WHERE nom_archivo = p_nom_archivo;
    EXCEPTION WHEN NO_DATA_FOUND THEN
       v_secError := 1;
    END;
     pck_epsga_ins.ins_perr(p_nom_archivo,
                         v_secError,
                         substr(p_ora_error,1,299),
                         substr(p_error, 1, 49),
                         p_num_factura);
  END pr_graba_error_plano;
END pck_gador_malla_valida_datos;
/

CREATE OR REPLACE PACKAGE &owner..PCK_GADOR_MALLA_GRABA_FACTURAS
AS
PROCEDURE pr_gador_malla_graba_fact (p_cia_p         IN     varchar2,
                                        p_cuamed_p      IN     varchar2,
                                        p_prestador_p   IN     varchar2,
                                        p_archivo_p     IN     varchar2,
                                        p_fecradic      IN     varchar2,
                                        p_user_p        IN     varchar2,
                                        p_id_archivo    IN     varchar2,
                                        p_id_factura    IN     varchar2,
                                        c_fact          IN     sys_refcursor,
                                        c_item          IN     sys_refcursor,
                                        msg                OUT varchar2);

   PROCEDURE pr_gador_malla_balanceo_fact (p_cia            number,
                                           p_cuamed_p       varchar2,
                                           p_prestador_p    varchar2,
                                           p_socio_p        varchar2,
                                           p_archivo_p      varchar2,
                                           p_nmfactur       varchar2,
                                           p_nmradica       number,
                                           p_cdtiphon       varchar2);
END PCK_GADOR_MALLA_GRABA_FACTURAS;
/

CREATE OR REPLACE PACKAGE BODY &owner..PCK_GADOR_MALLA_GRABA_FACTURAS
AS
   -- Versión  Autor                       Fecha        Comentario
   -- 1.0.000  jlrodriguez-SoftManagement  23/09/2013   Creación - Procedimiento encargado de realizar la grabación automática de facturas
   PROCEDURE pr_gador_malla_graba_fact (p_cia_p         IN     varchar2,
                                        p_cuamed_p      IN     varchar2,
                                        p_prestador_p   IN     varchar2,
                                        p_archivo_p     IN     varchar2,
                                        p_fecradic      IN     varchar2,
                                        p_user_p        IN     varchar2,
                                        p_id_archivo    IN     varchar2,
                                        p_id_factura    IN     varchar2,
                                        c_fact          IN     sys_refcursor,
                                        c_item          IN     sys_refcursor,
                                        msg                OUT varchar2)
   AS
      rad                   number (10);
      tipo_documento        varchar2 (1);
      numero_factura        varchar2 (20);
      atributo_10           NUMBER (3) := 0;
      valor_pagar           number (14, 2);
      fec_vencimiento       date;
      fec_captura           date;
      fec_ultmodificacion   date;
      atributo_7            varchar2 (40);
      func_modifica         varchar2 (12);
      cdoficin              varchar2 (7);
      estado_rec            varchar2 (1);
      indicador             varchar2 (1);
      benef_pago            number (9);
      fec_pago              date;
      num_cheque            number (15);
      fec_estado            date;
      motiv_anulac          varchar2 (2);
      tipo_grab             varchar2 (1);
      ind_proceso           varchar2 (1);
      tipo_cobro            varchar2 (1);
      v_plan                varchar2 (1);
      per_egreso            number (6);
      valor_total_fact      number (14, 2);
      valor_balanc          number (14, 2);
      valor_glpositivas     number (14, 2);
      valor_glnegativas     number (14, 2);
      tipo_registro         varchar2 (1);
      num_proceso           number (20);
      fecha                 date;
      hora_inicio           varchar2 (5);
      hora_fin              varchar (5);
      estado_ctrl           varchar2 (1);
      num_total_fact        number (4);
      num_fact_proces       number (4);
      estado_reg            varchar2 (1);
      ind_mala_util         varchar2 (1);
      clase_cuenta          varchar2 (1);
      ind_cierre            varchar2 (1);
      ind_per_proceso       varchar2 (1);
      catalog_codif         varchar2 (5 BYTE);
      prov_paquete          varchar2 (9);
      motiv_ajuste          varchar2 (3);
      vlor_ajuste           number (14, 2);
      ind_pl_salud          varchar2 (3 BYTE);
      obs                   varchar2 (100);
      cod_ajuste            varchar2 (3);
      -- Utilitarias
      cod_alea              varchar2 (9 BYTE);
      p_cdalias             varchar2 (5 BYTE);
      p_cua_ser             varchar2 (5 BYTE);
      w_inci                number (10);
      reg_cont              number (1);
      --
      p_cia                 varchar2 (3);
      p_cuamed              varchar2 (5);
      p_prestador           varchar2 (15);
      p_archivo             varchar2 (30);
      p_user                varchar2 (12);
      --
      v_tipo_autorizacion   varchar2(1);
      v_nmsecaut            number(4);
      v_cdcencos            varchar2(7);
      v_nmautori            varchar2(10);
      v_nmsituac            number(6);
      v_nmsuplem            number(18);
      v_cdalias             varchar2(10);
      v_cdsermed            varchar2(9);
      v_cdtipser            varchar2(1);
      v_cdclaser            varchar2(2);
      v_cdcuaser            varchar2(5);
      v_nmsecsop            number(10);
      v_nmordina            number(4);
      --
      v_cdtarifa            varchar2(14);
      v_ptitarifa            NUMBER(14,2);
      v_ptivalor            Number(14,2);
      v_ptitarif            Number(14,2);
      v_porepres            Number(5,2);
      v_ptisiste            Number(14,2);
      v_swtarman            Varchar2(1);
      --variables salida dias estancia
      vramo                 Number(3);
      vcto                  Number(10);
      vfmus                 Number(6);
      vtip                  Varchar2(1);
      vcla                 Varchar2(2);
      vdia                  Number(3) := 0;
      vccos                 Varchar2(7);
      nmord                 Number(9);
      cdord                 Varchar2(15);
      --
      v_secaju              number(6);
      v_secajudoc           number(10);
      --
      error_grabacion       EXCEPTION;
      msgError              VARCHAR2(2000);
      v_secError            number(10);
      v_cant_ser            number(3);
      centro_costo          TFUNCIOS.CDCENCOS%TYPE;
      v_usuario_eps         ATR_GRUPO_FUNCIONARIO.FUNC_CODIGO_EPS%TYPE;
      TYPE t_detalle IS RECORD
      (
         id_item               number (10),
         id_factura            number (10),
         fecha_doc_soporte     date,
         tipo_doc_soporte      varchar2 (1),
         nro_doc_soporte       varchar2 (28),
         sec_doc_soport        number (2, 2),
         PLAN                  number (3),
         contrato              number (10),
         familia               number (4),
         usuario               number (2),
         tipo_identificacion   varchar2 (1),
         nro_identificacion    varchar2 (20),
         lugar_prestacion      varchar2 (1),
         cod_manual_tarifa     varchar2 (2),
         cod_serv_prestado     number (9),
         cantidad_servicio     number (8),
         tipo_recargo          varchar2 (2),
         prestador_ordena      varchar2 (15),
         valor_servicio        number (14, 2),
         numero_solicitud      number (9),
         numero_sesiones       number (2)
      );
      r_detalle             t_detalle;

      TYPE t_tipo_factura IS RECORD
      (
         id_archivo               number (10),
         nombre_archivo           varchar2 (30),
         compania                 number (3),
         cuadro_medico            varchar2 (5),
         fecha_proceso            date,
         id_factura               number (10),
         unidad_economica         number (3),
         codigo_prestador         varchar2 (15),
         numero_factura           varchar2 (20),
         valor_total_factura      number (14, 2),
         fecha_ingreso            date,
         fecha_salida             date,
         num_sol_volante          number (16),
         fecha_elabora_factura    date,
         sw_control               varchar2 (1),
         val_recau_cuota_modera   number (14, 2),
         val_recau_copago         number (14, 2),
         valor_recaudo_pmc        number (14, 2),
         codigo_concepto          number (3),
         valor_base_retencion     number (14, 2),
         codigo_prestador_socio   varchar2 (15),
         tipo_honorario           varchar2 (2),
         valor_facturado_socio    number (14, 2),
         num_registros_s          number (10),
         num_registros_d          number (10),
         sum_reg_tip_d            number (14, 2),
     prestador                varchar2(15)
      );
      r_factura             t_tipo_factura;


	  --Inicio Declaraciones JaFarias
      d_ndoc    Varchar2(10);
      v_nnmdoc  Number;
      nmdoc     Varchar2(10);
      v_annosys Number(4);
	  --Fin Declaracion Variables JaFarias

   BEGIN
      -->Quitar espacios en blanco de variables string
      p_cia := trim (p_cia_p);
      p_cuamed := trim (p_cuamed_p);
      p_prestador := trim (p_prestador_p);
      p_archivo := trim (p_archivo_p);
      p_user := trim (UPPER(p_user_p));

      LOOP
         FETCH c_fact INTO r_factura;
         exit WHEN c_fact%NOTFOUND;

         -->ENCABEZADO RECEPCION
         --18. Compañia: p_cia
         --19. Prestador: p_prestador
         --20. Radicación
         SELECT to_number (
                      to_char (sysdate, 'yy')
                   || lpad (to_char (seqradica.NEXTVAL), 8, '0'))
           INTO rad
           FROM dual;

         --21,22. tipo de documento y numero de factura
         --atributo 10 de prestador, Retorna el dato así: 'N'-->1,'S'-->2
         frecep_ga.ver_norj (trim (p_prestador), atributo_10);

         IF r_factura.numero_factura IS NULL AND atributo_10 = 1         THEN
            tipo_documento := 'E';

            BEGIN
              SELECT nvl (max (nmsecuen), 0) + 1
                INTO numero_factura
                FROM tsecdequ
               WHERE cdunieco = p_cia;
            EXCEPTION
            WHEN no_data_found THEN
              numero_factura := 1;
              INSERT INTO tsecdequ VALUES (p_cia, numero_factura);
            END;

            UPDATE tsecdequ
               set nmsecuen = numero_factura
             WHERE cdunieco = p_cia;
         END IF;

         IF r_factura.numero_factura IS NOT NULL
         THEN
            tipo_documento := 'F';
            numero_factura := r_factura.numero_factura;
         END IF;

         --23. Valor de cobrado: r_factura.VALOR_TOTAL_FACTURA
         --24. valor a pagar (Inicialmente en NULL)
         valor_pagar := NULL;
         --25.Fecha de radicación: p_fecradic
         --26. fecha de vencimiento
         --atributo 7 del prestador
         frecep_ga.ver_dvto (trim (p_prestador), atributo_7);
         fec_vencimiento :=
            to_date (p_fecradic, 'dd/mm/yyyy') + to_number (atributo_7);
         --27. fecha de captura
         fec_captura := sysdate;
         --28. Funcionario genera: p_user
         
         -->Inicia jrodriguez 26/06/2014: Homologar a usuario de EPS
         BEGIN
           SELECT FUNC_CODIGO_EPS 
             INTO v_usuario_eps
             FROM ATR_GRUPO_FUNCIONARIO
            WHERE FUNC_CODIGO = p_user;
         EXCEPTION
         WHEN NO_DATA_FOUND THEN
           v_usuario_eps := p_user; 
         WHEN others THEN          
           v_usuario_eps := p_user;     
         END;   
         -->Finaliza jrodriguez 26/06/2014: Homologar a usuario de EPS
         
         --29. fecha ultima modificacion (Inicialmente Nulo)
         fec_ultmodificacion := NULL;
         --30. funcionario modifica (Inicialmente Nulo)
         func_modifica := NULL;
         --31. Centro de costo de adscripción
         frecep_ga.ver_cads (trim (p_prestador), cdoficin);
         --32. Centro de costo de radicacion.
         -->Cambio en CU por especificación de Johanna Carcamo
         BEGIN
             SELECT cdcencos
              INTO centro_costo
             FROM TFUNCIOS fun, ATR_GRUPO_FUNCIONARIO atr
             WHERE fun.cdusuari = atr.func_codigo_eps
             AND atr.func_codigo = Upper(p_user);
         EXCEPTION
         WHEN Others THEN
               
           msgError := SQLERRM;
               msg := 'GRABA_FACT Error insertando en MFACTPRE';
               RAISE error_grabacion;
            --JaFarias 19/06/2014 Esto se debe descomentarear cuando al p_user le llegue el usuario que se conecta a la aplicacion y no  CIODI.
            --centro_costo := cdoficin;  
         END;



         --33. Estado (inicialmente '0')
         estado_rec := '0';
         --34. Indicador (Inicialmente 'I')
         indicador := 'I';
         --35. Beneficiario de pago (Inicialmente nulo)
         benef_pago := NULL;
         --36. Fecha de pago (Inicialmente nulo)
         fec_pago := NULL;
         --37. Numero de cheque (Inicialmente nulo)
         num_cheque := NULL;
         --38. Fecha de estado
         fec_estado := sysdate;
         --39.  Motivo anulacion (Inicialmente nulo)
         motiv_anulac := NULL;
         --40. Tipo de grabación (Registrar en 'A')
         tipo_grab := 'A';
         --41. Indicador de proceso (Inicialmente nulo)
         ind_proceso := NULL;
         --42. Cuadro medico: P_Cuamed
         --43. Tipo de cobro (Registrar en 'E')
         tipo_cobro := 'E';
         --44. Plan (Registrar en 'E')
         v_plan := 'E';
         --45. Cuota moderadora: r_factura.VAL_RECAU_CUOTA_MODERA
         --46. Copago: r_factura.VAL_RECAU_COPAGO
         --47. Pago mínimo de cotización: r_factura.VALOR_RECAUDO_PMC
         --48. Periodo de egreso:
         per_egreso := to_number (to_char (r_factura.fecha_salida, 'yyyymm'));

         --49. Número de solicitud: r_factura.NUM_SOL_VOLANTE
         --50. Fecha de la factura: r_factura.FECHA_ELABORA_FACTURA
         BEGIN
           INSERT INTO mfactpre (cdunieco,
                                 cdpresta,
                                 nmradica,
                                 nmfactur,
                                 cdtipdoc,
                                 ptifactu,
                                 ptivalor,
                                 feradica,
                                 fevencto,
                                 fecaptur,
                                 cdfuncre,
                                 feultmod,
                                 cdfuncmo,
                                 cdccadsc,
                                 cdccradi,
                                 cdestado,
                                 swindfac,
                                 cdperson,
                                 fepago,
                                 nmcheque,
                                 feestado,
                                 cdmotanu,
                                 cdtipgra,
                                 swproceso,
                                 cdcuamed,
                                 tipocobr,
                                 swpospes,
                                 vlcuotam,
                                 vlcopago,
                                 vlpermin,
                                 per_egre,
                                 nmsolvol,
                                 fecfactu)
                VALUES (to_number (p_cia),
                        p_prestador,
                        rad,
                        numero_factura,
                        tipo_documento,
                        r_factura.valor_total_factura,
                        valor_pagar,
                        p_fecradic,
                        fec_vencimiento,
                        fec_captura,
                        v_usuario_eps,
                        fec_ultmodificacion,
                        func_modifica,
                        cdoficin,
                        centro_costo,
                        estado_rec,
                        indicador,
                        benef_pago,
                        fec_pago,
                        num_cheque,
                        fec_estado,
                        motiv_anulac,
                        tipo_grab,
                        ind_proceso,
                        p_cuamed,
                        tipo_cobro,
                        v_plan,
                        r_factura.val_recau_cuota_modera,
                        r_factura.val_recau_copago,
                        r_factura.valor_recaudo_pmc,
                        per_egreso,
                        r_factura.num_sol_volante,
                        r_factura.fecha_elabora_factura);
         EXCEPTION
         WHEN OTHERS THEN
           msgError := SQLERRM;
           msg := 'GRABA_FACT Error insertando en MFACTPRE';
           RAISE error_grabacion;
         END;
         --51. DETALLE DE RECEPCION
         --53. Compañia: p_cia
         --54. Prestador: p_prestador
         --55. Socio: r_factura.codigo_prestador_socio
         --56. Radicacion: rad
         --57. Tipo de honorario: r_factura.tipo_honorario
         --58. Tipo de documento: tipo_documento
         --59. Valor total factura (Inicialmente nulo)
         valor_total_fact := NULL;
         --60. Valor total factura socio: r_factura.Valor_Facturado_Socio
         --61. Valor balanceado (Inicialmente nulo)
         valor_balanc := NULL;
         --62. Valor glosas positivas (Inicialmente nulo)
         valor_glpositivas := NULL;
         --63. Valor glosas negativas (Inicialmente nulo)
         valor_glnegativas := NULL;

         BEGIN
           INSERT INTO mpresfac (cdunieco,
                                 cdpresta,
                                 cdsocio,
                                 nmradica,
                                 cdtiphon,
                                 cdtipdoc,
                                 ptivalor,
                                 ptifactu)
                VALUES (p_cia,
                        p_prestador,
                        r_factura.codigo_prestador_socio,
                        rad,
                        r_factura.tipo_honorario,
                        tipo_documento,
                        valor_total_fact,
                        r_factura.valor_facturado_socio);
         EXCEPTION
         WHEN OTHERS THEN
           msgError := SQLERRM;
           msg := 'GRABA_FACT Error insertando en MPRESFAC';
           RAISE error_grabacion;
         END;

         --64. REGISTRO DE IMPUESTO (MCONCUNI) - Flujo alternativo 2
         --2. Compañia: p_cia
         --3. Prestador: p_prestador
         --4. Radicacion: rad
         --5. Codigo del concepto: r_factura.codigo_concepto
         --6. Tipo de registro (Registrar 'N')
         tipo_registro := 'N';
         --7. Valor base: r_factura.valor_base_retencion
         -->Si existe registro tipo impuesto
         IF r_factura.codigo_concepto IS NOT NULL THEN
           BEGIN
             INSERT INTO mfactcon (cdunieco,
                                   cdpresta,
                                   nmradica,
                                   cdconcep,
                                   cdtiprec,
                                   ptivalor)
                  VALUES (p_cia,
                          p_prestador,
                          rad,
                          r_factura.codigo_concepto,
                          tipo_registro,
                          r_factura.valor_base_retencion);
           EXCEPTION
           WHEN OTHERS THEN
             msgError := SQLERRM;
             msg := 'GRABA_FACT Error insertando en MFACTCON';
             RAISE error_grabacion;
           END;
         END IF;

         --66. REGISTRO DE CONTROL (TGRABCTL)
         --68. Numero de proceso
         SELECT to_number (
                      to_char (sysdate, 'yy')
                   || lpad (to_char (seqerrgr.NEXTVAL), 5, '0'))
           INTO num_proceso
           FROM dual;

         --69. Prestador: p_prestador
         --70. Numero de factura: numero_factura
         --71. Radicacion: rad
         --72. Fecha: fec_captura
         --73. Funcionario que genera: p_user
         --74. Hora inicio
         hora_inicio := to_char (sysdate, 'hh24:mi');
         --75. Hora fin
         hora_fin := NULL;
         --76. Estado
         estado_ctrl := 'I';
         --77. Numero total facturas
         num_total_fact := 1;
         --78. Numero de facturas procesadas
         num_fact_proces := 0;

         BEGIN
           INSERT INTO tgrabctl (nmsecuen,
                                 cdpresta,
                                 nmfactur,
                                 nmradica,
                                 fesistem,
                                 cdfuncen,
                                 horainic,
                                 horafinc,
                                 cdestado,
                                 nmfactot,
                                 nmfacpro)
               -- VALUES (substr(num_proceso, 3, 7),
				VALUES	(num_proceso,
                        p_prestador,
                        numero_factura,
                        rad,
                        fec_captura,
                        v_usuario_eps,
                        hora_inicio,
                        hora_fin,
                        estado_ctrl,
                        num_total_fact,
                        num_fact_proces);
         EXCEPTION
         WHEN OTHERS THEN
           msgError := SQLERRM;
           msg := 'GRABA_FACT Error insertando en TGRABCTL';
           RAISE error_grabacion;
         END;

        --80. ENCABEZADO DE GRABACION
        -->jlrodriguez
        v_nmsecsop := 0;
        FOR r_enc IN (/*DISTINCT fecha_documento_soporte, tipo_documento_soporte, nro_documento_soporte,
                      PLAN, contrato, familia, usuario, codigo_servicio_prestado, prestador_ordena, lugar_prestacion, numero_solicitud*/ --19/06/2014 JaFarias
					  SELECT *
                      FROM geps_tb_detalle_malla
                      WHERE id_factura = r_factura.id_factura)
        LOOP
           --82. Compañia: p_cia
           --83. Prestador: p_prestador
           --84. Socio: r_factura.codigo_prestador_socio
           --85. Radicacion: rad
           --86. Tipo de honorario: r_factura.tipo_honorario
           --87. Numero de factura: numero_factura
           --88. Fecha de documento de soporte  r_enc.fecha_documento_soporte
           --89. Tipo de documento soporte: r_enc.tipo_documento_soporte
           --90. Numero de documento soporte: r_enc.nro_documento_soporte
           --91. Secuencia de documento soporte
           -->Se debe calcular una secuencia que inicie en uno, por cada  código de compañía, prestador, socio, radicación,
           -->honorario, tipo de documento y número de documento en la factura: v_nmsecsop
           BEGIN
              SELECT nvl(max(nmsecsop),0)+1
              INTO   v_nmsecsop
              FROM   mgrabcue
              WHERE  cdunieco = to_number(p_cia)
              AND    cdpresta = p_prestador
              AND    cdsocio  = r_factura.codigo_prestador_socio
              AND    nmradica = rad
              AND    cdtiphon = r_factura.tipo_honorario
              AND    cddocsop = r_enc.tipo_documento_soporte
              AND    nmdocsop = substr(r_enc.nro_documento_soporte, 19, 10);
           EXCEPTION
           WHEN no_data_found THEN
             v_nmsecsop := 1;
           END;

           --92. Tipo de autorizacion
           IF r_enc.numero_solicitud > 0 THEN
             v_tipo_autorizacion := 'V';
			 pck_epsga_upd.act_nsol(numero_factura,r_enc.numero_solicitud,atributo_10);--JaFarias 25/05/2014 Marcacion utilizacion Volante
           ELSE
             v_tipo_autorizacion := NULL;
           END IF;
           --93. Ciudad de autorizacion
           --94. Numero de volante
           --95. Numero de secuencia de autorizacion
           BEGIN
             SELECT cdcencos, nmautori, nmsecaut
               INTO v_cdcencos, v_nmautori, v_nmsecaut
             FROM   mvolanca
             WHERE  nmsolvol= r_enc.numero_solicitud
             AND nmsecaut = atributo_10;
           EXCEPTION
           WHEN NO_DATA_FOUND THEN
             v_cdcencos := NULL;
             v_nmautori := NULL;
             v_nmsecaut := NULL;
           END;
           --96. Ramo: r_enc.plan
           --97. Numero de contrato: r_enc.contrato
           --98. Familia+usuario: r_enc.familia||r_enc.usuario
           -->26-May-2014_jrodriguez Completar variable usuario con un cero '0' a la izquierda
           v_nmsituac := to_number(r_enc.familia||LPAD(r_enc.usuario, 2, '0'));
           --99. Número de suplemento físico --Igual que en el CU 10 Paso 9
           Pck_Epsga_Grb.max_supl(to_number(p_cia),
                                  r_enc.PLAN,
                                  r_enc.contrato,
                                  r_enc.familia,
                                  r_enc.usuario,
                                  to_char(r_enc.fecha_documento_soporte,'yyyymmdd'),
                                  v_nmsuplem);
           --100. Prestador que ordena --r_enc.prestador_ordena
           --101. Tipo de servicio: v_cdtipser del paso siguiente
           --102. Clase de servicio: Igual que en el CU 10 Paso 14
           -->Obtener cdalias CU 10 Paso 13
           pck_epsga_grb.ali_pres(to_number(p_cia),
                                  p_prestador,
                                  v_cdalias,
                                  r_enc.fecha_documento_soporte);

           -->Obtener cdsermed CU 10 Paso 14
           Pck_Epsga_Grb.Cod_Alia(v_cdalias,
                                  r_enc.codigo_servicio_prestado,
                                  v_cdsermed,
                                  p_prestador);

           -->Obtener cdclaser CU 10 Paso 14
           BEGIN
             SELECT cdtipser ,cdclaser
             INTO   v_cdtipser, v_cdclaser
             FROM   tservmed
             WHERE  cdsermed = r_enc.codigo_servicio_prestado
             AND    cddepend = 'PRO';
           EXCEPTION
           WHEN NO_DATA_FOUND THEN
             v_cdtipser := ' ';
             v_cdclaser := ' ';
           END;
           --103. Lugar de prestación del servicio: r_enc.lugar_prestacion
           --104. Fecha de captura: Paso 27 fec_captura
           --105. Funcionario que recepciona: p_user
           --106. Fecha de ultima modificacion: Paso 29 fec_ultmodificacion Inicialmente nulo
           --107. Funcionario que modifica --paso 30 func_modifica Inicialmente nulo
           --108. Estado del registro. Inicialmente se registra nulo
           estado_reg := NULL;
           --109. Indicador de mala utilización. Inicialmente se registra nulo
           ind_mala_util := NULL;
           --110. Clase de cuenta
           --atributo 10 de prestador, 'N'-->1,'S'-->2
           IF atributo_10 = 1
           THEN
              clase_cuenta := 'M';
           ELSIF atributo_10 = 2
           THEN
              clase_cuenta := 'C';
           END IF;
           --111. Indicador de cierre. Inicialmente se registra nulo
           ind_cierre := NULL;
           --112. Fecha inicio de estancia: r_factura.FECHA_INGRESO
           --113. Fecha fin de estancia: r_factura.FECHA_SALIDA
           --114. Indicador periodo proceso. Inicialmente se registra nulo
           ind_per_proceso := NULL;
           --115. Cuadro de servicio del usuario. Igual que en el CU 10 Paso 9
           Pck_Epsga_Grb.ver_atri(to_number(p_cia),
                                  r_enc.PLAN,
                                  r_enc.contrato,
                                  r_enc.familia,
                                  r_enc.usuario,
                                  '2',
                                  to_char(r_enc.fecha_documento_soporte,'yyyymmdd'),
                                  v_cdcuaser);
           --116. Número de Solicitud de volante: r_enc.numero_solicitud
           --117. Catálogo de codificación: v_cdalias

		   --Inicio Modificaciones 23/05/2014 (JaFarias): Calculo Numero Secuencia de Documento
           d_ndoc := substr(r_enc.nro_documento_soporte, 19, 10);

           IF r_enc.tipo_documento_soporte = 'B' THEN

              pck_epsga_grb.seq_tipb(nmdoc);

              IF nmdoc = 'XX' THEN
                RAISE error_grabacion;
              ELSE
                d_ndoc := nmdoc;
              END IF;
            ELSIF r_enc.tipo_documento_soporte = 'O' THEN

              pck_epsga_grb.seq_tipo(nmdoc);

              IF nmdoc = 'XX' THEN
                RAISE error_grabacion;
              ELSE
                d_ndoc := nmdoc;
              END IF;
            ELSIF r_enc.tipo_documento_soporte NOT IN ('V', 'C') THEN  -- 08/05/2009 No debe calcular seq si es V

             pck_epsga_grb.seq_docm(p_cia,r_enc.tipo_documento_soporte,nmdoc);

              IF nmdoc = 'XX' THEN
                RAISE error_grabacion;
              ELSIF nmdoc <> 'XX' THEN
                --08/10/2008 se agrega esta consulta para hacer la conversion del numero de doc y pasar el año como parametro
                BEGIN
                  SELECT to_number(nmdoc), To_Number(to_char(sysdate, 'yyyy'))
                  INTO   v_nnmdoc, v_annosys
                  FROM   dual;
                EXCEPTION
                  WHEN value_error THEN
                     RAISE error_grabacion;
                END;
                pck_epsga_upd.act_docm(v_nnmdoc,p_cia,r_enc.tipo_documento_soporte, v_annosys);
                d_ndoc := v_nnmdoc;
              END IF;
            END IF;
            --Fin Modificacion JaFarias


		    --Inicio JaFarias
			SELECT Decode(R_Enc.Lugar_Prestacion, 'H',NULL,R_Factura.Fecha_Ingreso),
                   decode(r_enc.lugar_prestacion, 'H', NULL,r_factura.fecha_salida)
            INTO   r_factura.fecha_ingreso, r_factura.fecha_salida
            FROM   Dual;
            --Fin JaFarias



           BEGIN
             INSERT INTO mgrabcue (cdunieco, --p_cia
                                   cdpresta, --p_prestador
                                   cdsocio,  --r_factura.codigo_prestador_socio
                                   nmradica, --rad
                                   cdtiphon, --r_factura.tipo_honorario
                                   nmfactur, --numero_factura
                                   fedocsop, --r_enc.fecha_documento_soporte
                                   cddocsop, --r_enc.tipo_documento_soporte
                                   nmdocsop, --r_enc.nro_documento_soporte
                                   nmsecsop, --v_nmsecsop
                                   cdtipaut, --v_tipo_autorizacion
                                   cdcencos, --v_cdcencos
                                   nmautori, --v_nmautori
                                   nmsecaut, --v_nmsecaut
                                   cdramo,   --r_enc.plan
                                   nmpoliza, --r_enc.contrato
                                   nmsituac, --v_nmsituac
                                   nmsuplem, --v_nmsuplem
                                   cdpresor, --r_enc.prestador_ordena
                                   cdtipser, --v_cdtipser
                                   cdclaser, --v_cdclaser
                                   cdlupres, --r_enc.lugar_prestacion
                                   fecaptur, --fec_captura
                                   cdfuncre, --p_user
                                   feultmod, --fec_ultmodificacion
                                   cdfuncmo, --func_modifica
                                   estado,   --estado_reg
                                   swmaluti, --ind_mala_util
                                   cdclacta, --clase_cuenta
                                   swcierre, --ind_cierre
                                   feiniest, --r_factura.fecha_ingreso
                                   fefinest, --r_factura.fecha_salida
                                   swpercon, --ind_per_proceso
                                   cdcuaser, --v_cdcuaser
                                   nmsolvol, --r_enc.numero_solicitud
                                   cdalias)  --catalog_codif
                  VALUES (p_cia,
                          p_prestador,
                          r_factura.codigo_prestador_socio,
                          rad,
                          r_factura.tipo_honorario,
                          numero_factura,
                          r_enc.fecha_documento_soporte,
                          r_enc.tipo_documento_soporte,
                          d_ndoc, --JaFarias
                          v_nmsecsop,
                          v_tipo_autorizacion,
                          centro_costo,
                          v_nmautori,
                          v_nmsecaut,
                          r_enc.PLAN,
                          r_enc.contrato,
                          v_nmsituac,
                          v_nmsuplem,
                          r_enc.prestador_ordena,
                          v_cdtipser,
                          v_cdclaser,
                          r_enc.lugar_prestacion,
                          fec_captura,
                          v_usuario_eps,
                          fec_ultmodificacion,
                          func_modifica,
                          nvl(estado_reg,'A'),
                          nvl(ind_mala_util,'N'),
                          nvl(clase_cuenta, 'M'),
                          ind_cierre,
                          r_factura.fecha_ingreso,
                          r_factura.fecha_salida,
                          ind_per_proceso,
                          v_cdcuaser,
                          r_enc.numero_solicitud,
                          v_cdalias);
           EXCEPTION
           WHEN OTHERS THEN
             msgError := SQLERRM;
             msg := 'GRABA_FACT Error insertando en MGRABCUE';
             RAISE error_grabacion;
           END;

          --118. DETALLE DE GRABACION
          --120. Compañia: p_cia
          --121. Prestador: p_prestador
          --122. Socio: r_factura.codigo_prestador_socio
          --123. Radicacion: rad
          --124. Tipo de honorario: r_factura.tipo_honorario
          --125. Tipo de documento: tipo_documento
          /*FOR r_det IN (SELECT * --19/06/2014 JaFarias
                          FROM geps_tb_detalle_malla
                          WHERE id_factura = r_factura.id_factura
                          --AND fecha_documento_soporte = r_enc.fecha_documento_soporte
                          AND tipo_documento_soporte = r_enc.tipo_documento_soporte
                          AND nro_documento_soporte = r_enc.nro_documento_soporte
                          --AND PLAN = r_enc.PLAN
                          --AND contrato = r_enc.contrato
                          --AND familia = r_enc.familia
                          --AND usuario = r_enc.usuario
                          --AND codigo_servicio_prestado = r_enc.codigo_servicio_prestado
                          --AND prestador_ordena = r_enc.prestador_ordena
                          --AND lugar_prestacion = r_enc.lugar_prestacion
                          --AND numero_solicitud = r_enc.numero_solicitud
                       )

          LOOP
		  */
            --126. Número de documento soporte --paso 90: r_det.nro_doc_soporte
            --127. Secuencia de documento soporte --paso 91 v_nmsecsop
            --128. Ordinal de documento soporte
            -->Ordinal de documento soporte. Se debe calcular una secuencia que inicie en uno, por cada  código de compañía,
            -->prestador, socio, radicación, honorario, tipo de documento, número de documento y secuencia en la factura.
            BEGIN
              SELECT nvl(max(nmordina),0)+1
              INTO   v_nmordina
              FROM   mfactser
              WHERE  cdunieco = to_number(p_cia)
              AND    cdpresta = p_prestador
              AND    cdsocio  = r_factura.codigo_prestador_socio
              AND    nmradica = rad
              AND    cdtiphon = r_factura.tipo_honorario
              AND    cddocsop = r_enc.tipo_documento_soporte
              AND    nmdocsop = substr(r_enc.nro_documento_soporte, 19, 10)
              AND    nmsecsop = v_nmsecsop;
            EXCEPTION
              WHEN no_data_found THEN
                v_nmordina := 1;
            END;
            --129. Código de servicio: r_det.cod_serv_prestado
            --130. Fecha de documento de soporte: r_det.fecha_doc_soporte
            --131. Número de días de estancias:
            IF r_enc.cantidad_servicio IN ('00', '01', '  ')      THEN
              v_cant_ser := 1;
            ELSE
              v_cant_ser := to_number(r_enc.cantidad_servicio);
            END IF;
            fgraba_ga.dat_vlte(r_enc.numero_solicitud,v_nmsecaut,vramo,vcto,vfmus,vtip,vcla,vdia,vccos,nmord,cdord);
            IF vdia IS NULL OR vdia = 0 THEN
              vdia := v_cant_ser;
            END IF;
            --132. Número de sesiones: r_det.numero_sesiones
            --133. Código de recargo o descuento: r_det.tipo_recargo
            --134. Valor unitario de tarifa utilización

            PL_TARISERV(p_prestador,
                        p_cia,
                        r_enc.codigo_servicio_prestado,
                        r_enc.fecha_documento_soporte,
                        v_cant_ser,
                        r_enc.tipo_recargo,
                        r_enc.lugar_prestacion,
                        r_factura.cuadro_medico,
                        v_cdtarifa, --IN OUT
                        v_ptivalor,
                        v_ptitarif,
                        v_porepres,
                        v_ptisiste,
                        v_swtarman);
            BEGIN
              v_ptitarifa := nvl(v_ptitarif, 0);

            EXCEPTION
            WHEN OTHERS THEN
              v_ptitarifa := 0;
            END;
			
			/*AAOL Si la el codigo de tarifa es cero, se envia el valor de la tarifa*/
            IF V_PTITARIFA = 0 THEN
                V_PTITARIFA := V_PTIVALOR;
            END IF;
			
            --135. Valor neto dado por el sistema: v_ptivalor
            --136. Valor bruto: v_ptisiste
            --137. Valor facturado por el prestador: r_det.valor_servicio
            --138. Proviene de paquete 'P'
            prov_paquete := NULL;
            --139. Motivo de ajuste
            motiv_ajuste := NULL;
            --140. Valor ajuste
            vlor_ajuste := NULL;
            --141,142. Indicador de Plan de Salud
            --P_Cdalias debe calcularse en el paso 13 del CU 10, pero hay problemas en el procedimiento que se debe utilizar

            pck_epsga_grb.cod_alia (p_cdalias,
                                    r_enc.codigo_servicio_prestado,
                                    cod_alea,
                                    trim (p_prestador));

            pck_epsga_grb.ver_atri (to_number(p_cia),
                                    r_enc.PLAN,
                                    r_enc.contrato,
                                    r_enc.familia,
                                    r_enc.usuario,
                                    '2',
                                    to_char(r_enc.fecha_documento_soporte,'YYYYMMDD'),
                                    p_cua_ser);

            BEGIN
               SELECT swplnsal
                 INTO ind_pl_salud
                 FROM mtipauts
                WHERE     cdunieco = p_cia
                      AND cdcuaser = p_cua_ser
                      AND cdsermed = cod_alea;
            EXCEPTION
               WHEN no_data_found
               THEN
                  ind_pl_salud := ' ';
            END;

            --143. Fecha de captura --Paso 27,104
            --144. Observaciones
            obs := NULL;

            --145. Tipo de grabación --paso 40

			--Inicio Inclusion Ajuste Automatico cuando el valor convenido diferente al valor del plano JaFarias 27/05/2014
			IF v_swtarman = 'S' THEN
             v_ptivalor := r_enc.valor_servicio;
            END IF;

            vlor_ajuste := Nvl(v_ptivalor,0) - Nvl(r_enc.valor_servicio,0);

            motiv_ajuste := NULL;
            IF vlor_ajuste = 0 THEN
              motiv_ajuste := NULL;
            ELSE
              pck_epsga_grb.cod_ajuste_tar(r_enc.codigo_servicio_prestado,motiv_ajuste);
            END IF;
			--Fin Inclusion Ajuste Automatico cuando el valor convenido diferente al valor del plano JaFarias 27/05/2014

            BEGIN
               INSERT INTO mfactser (cdunieco, --p_cia
                                     cdpresta, --p_prestador
                                     cdsocio,  --r_factura.codigo_prestador_socio
                                     nmradica, --rad
                                     cdtiphon, --r_factura.tipo_honorario
                                     cddocsop, --r_enc.tipo_documento_soporte
                                     nmdocsop, --r_det.nro_doc_soporte
                                     nmsecsop, --v_nmsecsop
                                     nmordina, --v_nmordina
                                     cdsermed, --r_det.cod_serv_prestado
                                     feservpr, --r_det.fecha_doc_soporte
                                     nmdiaest, --v_dia
                                     nmsesion, --r_det.numero_sesiones
                                     cdrepres, --r_det.tipo_recargo
                                     ptitarif, --v_ptitarifa
                                     ptivalor, --v_ptivalor
                                     ptisiste, --v_ptisiste
                                     ptifactu, --r_det.valor_servicio
                                     sworigen, --prov_paquete
                                     cdmotaju, --motiv_ajuste
                                     ptiajust, --vlor_ajuste
                                     swplnsal, --ind_pl_salud
                                     swcontab, --ind_pl_salud
                                     fecaptur, --fec_captura
                                     dsobserv,
                                     cdtipgra)
                    VALUES (to_number(p_cia),
                            p_prestador,
                            r_factura.codigo_prestador_socio,
                            rad,
                            r_factura.tipo_honorario,
                            r_enc.tipo_documento_soporte,
                            d_ndoc, --JaFarias
                            v_nmsecsop,
                            v_nmordina,
                            r_enc.codigo_servicio_prestado,
                            r_enc.fecha_documento_soporte,
                            vdia,
                            r_enc.numero_sesiones,
                            r_enc.tipo_recargo,
                            v_ptitarifa,
                            v_ptivalor,
                            v_ptisiste,
                            r_enc.valor_servicio,
                            prov_paquete,
                            motiv_ajuste,
                            vlor_ajuste,
                            ind_pl_salud,
                            ind_pl_salud,
                            fec_captura,
                            obs,
                            'A');
            EXCEPTION
            WHEN OTHERS THEN
               msgError := SQLCODE || '-' || SQLERRM;
               msg := 'GRABA_FACT Error insertando en MFACTSER';
               RAISE error_grabacion;
            END;
          --END LOOP;  --r_det grab 19/06/2014 JaFarias
        END LOOP; --r_enc grab

        --172. REGISTRO PARA SABANA DE GRABACIÓN
        BEGIN

          INSERT INTO zwsabgra (cdunieco,
                               cdpresta,
                               nmradica,
                               cdfuncre,
                               cdestado,
                               feestado)
              VALUES (p_cia,
                      p_prestador,
                      rad,
                      v_usuario_eps,
                      'G',
                      sysdate);
        EXCEPTION
        WHEN OTHERS THEN
           msgError := SQLERRM;
           msg := 'GRABA_FACT Error insertando en ZWSABGRA';
           RAISE error_grabacion;
        END;
         --174. REGISTRO CONTABILIDAD
         reg_cont :=
            pl_recfact (p_cia,
                        p_prestador,
                        rad,
                        p_cuamed,
                        '0');

        --170. BALANCEO FACTURAS
        pck_gador_malla_graba_facturas.pr_gador_malla_balanceo_fact (
           to_number (p_cia),
           p_cuamed,
           p_prestador,
           r_factura.codigo_prestador_socio,
           p_archivo,
           numero_factura,
           rad,
           r_factura.tipo_honorario);
           --r_enc.tipo_documento_soporte,
           --r_enc.nro_documento_soporte,
           --v_nmsecsop,
           --v_nmordina);


      END LOOP;
      CLOSE c_fact;



      --75. ACTUALIZAR HORA_FIN
      BEGIN
        UPDATE tgrabctl
           set horafinc = to_char (sysdate, 'hh24:mi')
         WHERE     nmsecuen = num_proceso
          AND nmfactur = numero_factura;
      EXCEPTION
      WHEN OTHERS THEN
         msgError := SQLERRM;
         msg := 'GRABA_FACT Error actualiza hora fin TGRABCTL';
         RAISE error_grabacion;
      END;
      --178. FINALIZACION
      msg := 'Proceso de Grabación ha finalizado';
   EXCEPTION
   WHEN error_grabacion THEN
     ROLLBACK;
     BEGIN
       SELECT nvl(max(secuencia), 0)+1
        INTO v_secError
       FROM plano_ga_error
       WHERE nom_archivo = p_archivo;
     EXCEPTION WHEN NO_DATA_FOUND THEN
       v_secError := 1;
     END;
     pck_epsga_ins.ins_perr(p_archivo,
                         v_secError,
                         substr(msgError,1,299),
                         substr(msg, 1, 49),
                         numero_factura);
   END pr_gador_malla_graba_fact;

   -- Versión  Autor                       Fecha        Comentario
   -- 1.0.000  jlrodriguez-SoftManagement  23/09/2013   Creación - Procedimiento encargado de realizar el balanceo de facturas
   PROCEDURE pr_gador_malla_balanceo_fact (p_cia            number,
                                           p_cuamed_p       varchar2,
                                           p_prestador_p    varchar2,
                                           p_socio_p        varchar2,
                                           p_archivo_p      varchar2,
                                           p_nmfactur       varchar2,
                                           p_nmradica       number,
                                           p_cdtiphon       varchar2)
   IS
      t_soci_f      number (14, 2);
      t_valor_ant   number (14, 2);
      t_serv_f      number (14, 2);
      t_serv_l      number (14, 2);
      t_serv_a      number (14, 2);
      t_ajus_s      number (14, 2);
      t_aser_p      number (14, 2);
      t_aser_n      number (14, 2);
      t_manf_p      number (14, 2);
      t_manf_n      number (14, 2);
      t_glosa_p     number (14, 2);
      t_glosa_n     number (14, 2);
      reg_maj       number (3);
      --
      p_cuamed      varchar2 (5);
      p_prestador   varchar2 (15);
      p_archivo     varchar2 (30);
      p_socio       varchar2(15);
      error_balanceo EXCEPTION;
      msg            varchar2(500);
      msgError       varchar2(2000);
      v_secError     number(10);

   BEGIN
      p_cuamed := trim (p_cuamed_p);
      p_prestador := trim (p_prestador_p);
      p_archivo := trim (p_archivo_p);
      p_socio := trim(p_socio_p);


     --1. MPRESFAC--> PTIFACTU y PTIVALOR (T_Soci_F y T_Valor_Ant)
     BEGIN
        SELECT nvl (ptifactu, 0), nvl (ptivalor, 0) --JaFarias 29/05/2014: Acorde a primer parrafo de Anexo 1 CU19 se intercambia consulta T_SOCIF debe almacenar el PTIFACTU y no el PTIVALOR de MPRESFAC
          INTO t_soci_f, t_valor_ant
          FROM mpresfac
         WHERE     cdunieco = p_cia
               AND cdpresta = p_prestador
               AND cdsocio = p_socio
               AND nmradica = p_nmradica
               AND cdtiphon = p_cdtiphon;
     EXCEPTION
     WHEN no_data_found THEN
         t_soci_f := 0;
         t_valor_ant := 0;
     END;

     --2. MFACTSER--> PTIFACTU, PTIVALOR y PTIAJUST (T_Serv_F, T_Serv_L y T_Serv_A)
     BEGIN
        SELECT sum (nvl(ptifactu, 0)),
               sum (nvl(ptivalor, 0)),
               sum (nvl(ptiajust, 0))
          INTO t_serv_f, t_serv_l, t_serv_a
          FROM mfactser
         WHERE     cdunieco = p_cia
               AND cdpresta = p_prestador
               AND cdsocio = p_socio
               AND nmradica = p_nmradica
               AND cdtiphon = p_cdtiphon;
               --AND cddocsop = p_cddocsop
               --AND nmdocsop = p_nmdocsop
               --AND nmsecsop = p_nmsecsop
               --AND nmordina = p_nmordina;
     EXCEPTION
     WHEN no_data_found
     THEN
        t_serv_f := 0;
        t_serv_l := 0;
        t_serv_a := 0;
     END;

     --3. MAJUSFAC-->PTIAJUST (T_Ajus_S)
     BEGIN
        SELECT sum (nvl(ptiajust, 0))
          INTO t_ajus_s
          FROM majusfac
         WHERE     cdunieco = p_cia
               AND cdpresta = p_prestador
               AND cdsocio = p_socio
               AND nmradica = p_nmradica
               AND cdtiphon = p_cdtiphon;
     EXCEPTION
     WHEN no_data_found
     THEN
       t_ajus_s := 0;
     END;

     --4. MFACTSER-->PTIAJUST>0 (T_Aser_P) --REVISAR WHERE
     BEGIN
        SELECT sum (nvl(ptiajust, 0))
          INTO t_aser_p
          FROM mfactser
         WHERE     cdunieco = p_cia
               AND cdpresta = p_prestador
               AND cdsocio = p_socio
               AND nmradica = p_nmradica
               AND cdtiphon = p_cdtiphon
               --AND cddocsop = i.cddocsop
               --AND nmdocsop = i.nmdocsop
               --AND nmsecsop = i.nmsecsop
               AND ptiajust > 0;
     EXCEPTION
     WHEN no_data_found
     THEN
       t_aser_p := 0;
     END;

     --5. MFACTSER-->PTIAJUST<0 (T_Aser_N) --REVISAR WHERE
     BEGIN
        SELECT sum (nvl(ptiajust, 0))
          INTO t_aser_n
          FROM mfactser
         WHERE     cdunieco = p_cia
               AND cdpresta = p_prestador
               AND cdsocio = p_socio
               AND nmradica = p_nmradica
               AND cdtiphon = p_cdtiphon
               --AND cddocsop = i.cddocsop
               --AND nmdocsop = i.nmdocsop
               --AND nmsecsop = i.nmsecsop
               AND ptiajust < 0;
     EXCEPTION
        WHEN no_data_found
        THEN
           t_aser_n := 0;
     END;

     --6. MAJUSFAC-->PTIAJUST>0 (T_Manf_P) --REVISAR WHERE
     BEGIN
        SELECT sum (nvl(ptiajust, 0))
          INTO t_manf_p
          FROM majusfac
         WHERE     cdunieco = p_cia
               AND cdpresta = p_prestador
               AND cdsocio = p_socio
               AND nmradica = p_nmradica
               AND cdtiphon = p_cdtiphon
               AND ptiajust > 0;
     EXCEPTION
        WHEN no_data_found
        THEN
           t_manf_p := 0;
     END;

     --7. MAJUSFAC-->PTIAJUST<0 (T_Manf_N) --REVISAR WHERE
     BEGIN
        SELECT sum (nvl(ptiajust, 0))
          INTO t_manf_n
          FROM majusfac
         WHERE     cdunieco = p_cia
               AND cdpresta = p_prestador
               AND cdsocio = p_socio
               AND nmradica = p_nmradica
               AND cdtiphon = p_cdtiphon
               AND ptiajust < 0;
     EXCEPTION
        WHEN no_data_found
        THEN
           t_manf_n := 0;
     END;

     --9. REVISAR BALANCEO
     IF     Nvl(t_soci_f,0) = Nvl(t_serv_f,0) - Nvl(t_ajus_s,0)
        AND Nvl(t_serv_l,0) = Nvl(t_soci_f,0) + Nvl(t_serv_a,0) + Nvl(t_ajus_s,0)
     THEN
        --10. valor total de ajustes positivos
        t_glosa_p := t_aser_p + t_manf_p;

        --11. valor total de ajustes negativos
        t_glosa_n := t_aser_n + t_manf_n;

        --12. Actualizar campo PTIVALOR de la tabla MFACTPRE
        BEGIN
          UPDATE mfactpre mfp
             set mfp.ptivalor = nvl(mfp.ptifactu,0) + t_glosa_n
           WHERE     mfp.cdunieco = p_cia
                 AND mfp.cdpresta = p_prestador
                 AND mfp.nmradica = p_nmradica;
        EXCEPTION
        WHEN OTHERS THEN
          msgError := SQLERRM;
          msg := 'GRABA_FACT_BAL Error actualizando PTIVALOR en MFACTPRE';
          RAISE error_balanceo;
        END;

        --13. Actualizar campo PTIVALOR de la tabla MPRESFAC --REVISAR Mpf.Ptifactu Ó Mfp.Ptifactu
        BEGIN
          UPDATE mpresfac mpf
             set mpf.ptivalor = nvl(mpf.ptifactu,0) + t_glosa_n
           WHERE     mpf.cdunieco = p_cia
                 AND cdpresta = p_prestador
                 AND cdsocio = p_socio
                 AND nmradica = p_nmradica
                 AND cdtiphon = p_cdtiphon;
        EXCEPTION
        WHEN OTHERS THEN
          msgError := SQLERRM;
          msg := 'GRABA_FACT_BAL Error actualizando PTIVALOR en MPRESFAC';
          RAISE error_balanceo;
        END;

        --14. Actualizar campo PTIBALANCE de la tabla MPRESFAC --REVISAR Mpf.Ptifactu Ó Mfp.Ptifactu, PTIBALANCE no existe en la tabla MPRESFAC
        BEGIN
          UPDATE mpresfac mpf
             set mpf.ptibalance = nvl(mpf.ptifactu,0) + t_glosa_p
           WHERE     mpf.cdunieco = p_cia
                 AND cdpresta = p_prestador
                 AND cdsocio = p_socio
                 AND nmradica = p_nmradica
                 AND cdtiphon = p_cdtiphon;
        EXCEPTION
        WHEN OTHERS THEN
          msgError := SQLERRM;
          msg := 'GRABA_FACT_BAL Error actualizando PTIBALANCE en MPRESFAC';
          RAISE error_balanceo;
        END;

        --15. Actualizar campo PTIGLOSAPOS de la tabla MPRESFAC --PTIGLOSAPOS no existe en la tabla MPRESFAC
        BEGIN
          UPDATE mpresfac mpf
             set mpf.ptiglosapos = t_glosa_p
           WHERE     mpf.cdunieco = p_cia
                 AND cdpresta = p_prestador
                 AND cdsocio = p_socio
                 AND nmradica = p_nmradica
                 AND cdtiphon = p_cdtiphon;
        EXCEPTION
        WHEN OTHERS THEN
          msgError := SQLERRM;
          msg := 'GRABA_FACT_BAL Error actualizando PTIGLOSAPOS en MPRESFAC';
          RAISE error_balanceo;
        END;
        --16. Actualizar campo PTIGLOSANEG de la tabla MPRESFAC --PTIGLOSAPOS no existe en la tabla MPRESFAC
        BEGIN
          UPDATE mpresfac mpf
             set mpf.ptiglosaneg = t_glosa_n
           WHERE     mpf.cdunieco = p_cia
                 AND cdpresta = p_prestador
                 AND cdsocio = p_socio
                 AND nmradica = p_nmradica
                 AND cdtiphon = p_cdtiphon;
        EXCEPTION
        WHEN OTHERS THEN
          msgError := SQLERRM;
          msg := 'GRABA_FACT_BAL Error actualizando PTIGLOSANEG en MPRESFAC';
          RAISE error_balanceo;
        END;
        --17. Si no hay registros en MAJUSFAC, actualizar MFACTPRE
        SELECT count (1)
          INTO reg_maj
          FROM majusfac
         WHERE     cdunieco = p_cia
              AND cdpresta = p_prestador
               AND cdsocio = p_socio
               AND nmradica = p_nmradica
               AND cdtiphon = p_cdtiphon;

        IF reg_maj = 0
        THEN
           BEGIN
             UPDATE mfactpre mfp
                set mfp.cdestado = '2', mfp.swindfac = 'P'
              WHERE     mfp.cdunieco = p_cia
                    AND mfp.cdpresta = p_prestador
                    AND mfp.nmradica = p_nmradica;
           EXCEPTION
           WHEN OTHERS THEN
              msgError := SQLERRM;
              msg := 'GRABA_FACT_BAL Error actualizando MFACTPRE';
              RAISE error_balanceo;
           END;
        ELSE
          --18.1. Si hay registros en MAJUSFAC la factura no esta balanceada
          BEGIN
            UPDATE mfactpre mfp
              set mfp.cdestado = '2', mfp.swindfac = 'I'
            WHERE     mfp.cdunieco = p_cia
                  AND mfp.cdpresta = p_prestador
                  AND mfp.nmradica = p_nmradica;
          EXCEPTION
          WHEN OTHERS THEN
            msgError := SQLERRM;
            msg := 'GRABA_FACT_BAL Error actualizando MFACTPRE';
            RAISE error_balanceo;
          END;
        END IF;
     ELSE
       -->18.2.La factura no esta balanceada
       BEGIN
            UPDATE mfactpre mfp
              set mfp.cdestado = '2', mfp.swindfac = 'I'
            WHERE     mfp.cdunieco = p_cia
                  AND mfp.cdpresta = p_prestador
                  AND mfp.nmradica = p_nmradica;
          EXCEPTION
          WHEN OTHERS THEN
            msgError := SQLERRM;
            msg := 'GRABA_FACT_BAL Error actualizando MFACTPRE';
            RAISE error_balanceo;
          END;
     END IF;
   EXCEPTION
   WHEN error_balanceo THEN
     BEGIN
       SELECT nvl(max(secuencia), 0)+1
        INTO v_secError
       FROM plano_ga_error
       WHERE nom_archivo = p_archivo;
     EXCEPTION WHEN NO_DATA_FOUND THEN
       v_secError := 1;
     END;

     pck_epsga_ins.ins_perr(p_archivo,
                           v_secError,
                           substr(msgError, 1, 300),
                           substr(msg, 1, 50),
                           p_nmfactur);
   END pr_gador_malla_balanceo_fact;
END PCK_GADOR_MALLA_GRABA_FACTURAS;
/

spool off;
ed LOG_02_PAQUETES_EPS.log