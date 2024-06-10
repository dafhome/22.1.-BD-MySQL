/* 1. Obtener los datos completos de los empleados. */
SELECT * FROM empleadoss_departamentoss.empleados;

/* 2. Obtener los datos completos de los departamentos. */
SELECT * FROM empleadoss_departamentoss.departamentos;

/* 3. Obtener los datos de los empleados con cargo ‘Secretaria’. */
SELECT * FROM empleadoss_departamentoss.empleados WHERE cargoE = 'Secretaria';

/* 4. Obtener el nombre y salario de los empleados. */
SELECT nomEmp, salEmp FROM empleadoss_departamentoss.empleados;

/* 5. Obtener los datos de los empleados vendedores, ordenado por nombre. */
SELECT * FROM empleadoss_departamentoss.empleados 
WHERE cargoE = 'Vendedor'
ORDER BY nomEmp ASC;

/* 6. Listar el nombre de los departamentos. */
SELECT DISTINCT(nombreDpto) FROM empleadoss_departamentoss.departamentos ;

/* 7. Obtener el nombre y cargo de todos los empleados, ordenado por salario. */
SELECT nomEmp, cargoE, salEmp FROM empleadoss_departamentoss.empleados
ORDER BY salEmp ASC;

/* 8. Listar los salarios y comisiones de los empleados del departamento 2000, ordenado por comisión. */
SELECT salEmp, comisionE FROM empleadoss_departamentoss.empleados
ORDER BY comisionE ASC;

/* 9. Listar todas las comisiones. */
SELECT DISTINCT (comisionE) FROM empleadoss_departamentoss.empleados ;

/* 10. Obtener el valor total a pagar que resulta de sumar a los empleados del departamento 3000 una bonificación de 500.000, en orden alfabético del empleado */
SELECT nomEmp, salEmp, (salEmp+500000) as salEstimado FROM empleadoss_departamentoss.empleados
WHERE codDepto = '3000'
ORDER BY nomEmp ;

/* 11. Obtener la lista de los empleados que ganan una comisión superior a su sueldo. */
SELECT nomEmp, salEmp, comisionE FROM  empleadoss_departamentoss.empleados
WHERE comisionE > salEmp;

/* 12. Listar los empleados cuya comisión es menor o igual que el 30% de su sueldo. */
SELECT nomEmp, salEmp, comisionE FROM  empleadoss_departamentoss.empleados
WHERE comisionE < (30*salEmp/100);

/* 13.Elabore un listado donde para cada fila, figure ‘Nombre’ y ‘Cargo’ antes del valor respectivo para cada empleado. */
SELECT nomEmp AS 'Nombre', cargoE AS 'Cargo' FROM  empleadoss_departamentoss.empleados;

/* 14. Hallar el salario y la comisión de aquellos empleados cuyo número de documento de identidad es superior al ‘19.709.802’. */

SELECT nDIEmp, salEmp, comisionE FROM empleadoss_departamentoss.empleados
WHERE nDIEmp > '19.709.802';

/*15. Muestra los empleados cuyo nombre empiece entre las letras J y Z (rango).
 * Liste estos empleados y su cargo por orden alfabético.  */
SELECT nomEmp, cargoE FROM empleadoss_departamentoss.empleados
WHERE nomEmp > 'J%' AND nomEmp < 'Z%'
ORDER BY nomEmp ASC;

/* 16. Listar el salario, la comisión, el salario total (salario + comisión), documento de identidad del empleado y nombre, de aquellos empleados que tienen comisión superior a 1.000.000, 
 * ordenar el informe por el número del documento de identidad */

SELECT salEmp as Salario, comisionE as Comision, (salEmp+comisionE) as SalarioTotal, nDIEmp as DocumentoIdentidad, nomEmp as Nombre FROM empleadoss_departamentoss.empleados
WHERE  comisionE > 1000000
ORDER  BY nDIEmp ASC;

/* 17. Obtener un listado similar al anterior, pero de aquellos empleados que NO tienen comisión */
SELECT salEmp as Salario, comisionE as Comision, (salEmp+comisionE) as SalarioTotal, nDIEmp as DocumentoIdentidad, nomEmp as Nombre FROM empleadoss_departamentoss.empleados
WHERE  comisionE = 0
ORDER  BY nDIEmp ASC;

/* 18. Hallar los empleados cuyo nombre no contiene la cadena «MA» */
SELECT nomEmp as Nombre FROM empleadoss_departamentoss.empleados
WHERE nomEmp NOT LIKE '%MA%';








/* 24. Obtener los nombres, salarios y comisiones de los empleados que reciben un salario situado entre la mitad de la comisión la propia comisión. */
SELECT nomEmp as Nombre, salEmp as Salario, comisionE as Comisiones FROM empleadoss_departamentoss.empleados
WHERE salEmp BETWEEN (comisionE/2) AND comisionE ;

/* 25. Mostrar el salario más alto de la empresa. */
SELECT nomEmp as Nombre, MAX(salEmp) as SalarioMaximo FROM empleadoss_departamentoss.empleados;

/* 26. Mostrar cada una de las comisiones y el número de empleados que las reciben. Solo si tiene comisión. */
SELECT comisionE as comisionE, COUNT(*) as NumeroEmpleados FROM empleadoss_departamentoss.empleados
GROUP BY comisionE
HAVING comisionE > 0;

/* 27. Mostrar el nombre del último empleado de la lista por orden alfabético. */
SELECT MAX(nomEmp) FROM empleadoss_departamentoss.empleados;

/* 28. Hallar el salario más alto, el más bajo y la diferencia entre ellos.*/
SELECT MAX(salEmp) AS SalarioMayor, MIN(salEmp) AS SalarioMenor, (MAX(salEmp) - MIN(salEmp)) AS Diferencia FROM empleadoss_departamentoss.empleados;


/* 29. Mostrar el número de empleados de sexo femenino y de sexo masculino, por departamento. */
SELECT codDepto as Departamento, sexEmp as Sexo, COUNT(*) as NumeroEmpleados FROM empleadoss_departamentoss.empleados
GROUP BY codDepto , sexEmp 
ORDER BY codDepto ASC;

/* 30. Hallar el salario promedio por departamento. */
SELECT codDepto as Departamento, AVG ( salEmp) as SalarioPromedio FROM empleadoss_departamentoss.empleados
GROUP BY codDepto 
ORDER BY codDepto ASC;

/* 31. Mostrar la lista de los empleados cuyo salario es mayor o igual que el promedio de la empresa. Ordenarlo por departamento. */
SELECT nDIEmp as ID_Empleado, salEmp as Salario FROM empleadoss_departamentoss.empleados
WHERE salEmp > (SELECT AVG(salEmp) FROM empleadoss_departamentoss.empleados)
