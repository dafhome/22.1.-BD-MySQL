
/* EJERCICIOS cap 5: */

/* 1- Cree una consulta SQL que devuelva las personas que son altas, o bien son rubias con gafas (usar paréntesis) */
SELECT NOMBRE FROM sql_facil_libro.personas
WHERE ALTA = 'S' OR (RUBIA = 'S' AND GAFAS='S');

/* 2- Cree una consulta SQL que devuelva los empleados que son mujer y cobran más de 1300 euros (en la tabla de empleados se guarda una 'H' 
 * en el campo SEXO para indicar que es hombre, o una 'M' para indicar que es mujer. */
SELECT * FROM sql_facil_libro.empleados 
WHERE SEXO = 'M' AND SALARIO > 1300;

/* 3- De la tabla personas: usando solo expresiones (ALTA='S'), (RUBIA='S'), (GAFAS='S') combinadas con el operador NOT resuelva: ¿Quién es quién? Lleva gafas y no es alta ni rubia. */
SELECT NOMBRE FROM sql_facil_libro.personas
WHERE ALTA = 'N' AND GAFAS = 'S' AND RUBIA = 'N';


/* EJERCICIOS cap 6: */

/* 1- Construya una consulta, donde necesitará establecer una condición en la claúsula WHERE, que devuelva el salario medio de los empleados que son hombres. 
 * Renombre la cabecera del resultado con un título que deje claro qué dato se está mostrando. */
SELECT AVG(SALARIO) AS SALARIO_MEDIO_HOMBRES FROM sql_facil_libro.empleados
WHERE SEXO = 'H';


/* 2- Cree una consulta que devuelva en la misma fila el salario minimo y máximo de entre todos los empleados. 
 * Renombre la cabecera del resultado con un título que deje claro qué datos se está mostrando. */
SELECT MIN(SALARIO) AS SalarioMinimo, MAX(SALARIO) AS SalarioMaximo FROM sql_facil_libro.empleados;


/* 3- De la tabla empleados: cree una consulta que responda a lo siguiente: ¿qué cuesta pagar a todas las mujeres en total? 
 * Renombre la cabecera del resultado con un título que deje claro qué dato se está mostrando. */
SELECT SUM(SALARIO) AS TotalSalarioMujeres FROM sql_facil_libro.empleados
WHERE SEXO = 'M';