CREATE OR REPLACE FUNCTION pxp.f_delete_tfuncion (
  par_nombre varchar,
  par_subsistema varchar
)
RETURNS varchar AS
$body$
DECLARE
	v_id_subsistema integer;
BEGIN
	select id_subsistema into v_id_subsistema
    from segu.tsubsistema s
    where s.codigo = par_subsistema;
    
    update segu.tfuncion set estado_reg = 'inactivo'
    where nombre = par_nombre and  id_subsistema = v_id_subsistema and estado_reg = 'activo';
    return 'exito';
END;
$body$
LANGUAGE 'plpgsql'
VOLATILE
CALLED ON NULL INPUT
SECURITY INVOKER
COST 100;