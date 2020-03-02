# aparcamiento
Objetivo de la práctica es resolver un problema de planificación, y plantear otro con similares características, incluso con el mismo dominio, con los dos planificadores Prodigy y SGP


A continuación pasamos a comentar como se ha resuelto el problema de planificaciones
en Prodigy

Utilización de Prodigy para la resolución de la práctica

Primero resolveremos el problema planteado de la practica con el prodigy 
Se describe los elementos del problema

La para solucionar el problema del aparcador automático pasamos a definir cada uno de los elementos de la practica. 


Las constantes del dominio son: 
para las plaza: {Plz1, Plz2, Plz3, Plz4} 
para los 2 coches {c1, c2} 
para las plantas {Pln-0,Plnt-1,Plnt-2} 
para el ascensor {asc} 

La topología del dominio se representa usando los siguientes predicados instanciados: 
el  nombre del dominio es aparcamiento

Predicados estáticos 
Plaza-en:
se define una plaza su posición en la planta del aparcamiento 
				(Plaza-en Plz1 Plnt-1) 
				(Plaza-en Plz2 Plnt-1) 
				(Plaza-en Plz3 Plnt-2) 
				(Plaza-en Plz4 Plnt-2) 
Adyacente: 
Se define una planta que esta pegada o se comunica con la otra 
Se ha definido tanto la relación de arriba a abajo y viceversa. 

				(Adyacente Plnt-0 Plnt-1) 
				(Adyacente Plnt-1 Plnt-0) 
				(Adyacente Plnt-2 Plnt-1) 
				(Adyacente Plnt-1 Plnt-2) 
Los predicados dinámicos son 
Ascensoren 
la planta donde esta situado el ascensor, evidentemente el ascensor se mueve de arriba a abajo 
				(AscensorEn asc Plnt-0) 

CocheEn
define en que planta está situado el coche. También lo usaremos para situarlos en el asensor o en la plaza
				(CocheEn c1 Plnt-0) 
				(CocheEn c2 Plnt-0) 

Las operaciones o acciones que pueden llevarse a cabo en el planificador son las siguientes 

MOVER-ASCENSOR 
Desplaza en ascensor entre las plantas para ello preguntará si una planta es adyacente a otra 


MOVER-COCHE-ASCENSOR 
Mueve el coche desde la planta de salida al ascensor. 


MOVER-COCHE-PLAZA 
mueve el coche desde el ascensor a la plaza de destino. 

Estado Inicial
El problema se instancia con los estados dinámicos 
el ascensor en la planta-0 
el coche1 en la planta-0 
el coche2 en la planta-0 

El estado final del coche es en 
el coche1 en la plaza4 y el coche2 en la plaza2 





os resutados del problema son:

	<mover-coche-ascensor asc c1 plnt-0>
	<mover-ascensor asc plnt-0 plnt-1>
	<mover-ascensor asc plnt-1 plnt-2>
	<mover-coche-plaza asc c1 plnt-2 plz4>
	<mover-ascensor asc plnt-2 plnt-1>
	<mover-ascensor asc plnt-1 plnt-0>
	<mover-coche-ascensor asc c2 plnt-0>
	<mover-ascensor asc plnt-0 plnt-1>
	<mover-coche-plaza asc c2 plnt-1 plz2>


El numero de nodos es de 893

Practica propuestas
El 2º problema planteado sin cambiar mucho el dominio es el de llevar un vehículo de las plazas a la planta-0 o de salida. Hacer el camino inverso. 
El nombre del dominio es aparcamiento2

Estado Inicial
El problema se instancia con los estados dinámicos 
el ascensor en la planta-0 
el coche1 en la plaza4 y el coche2 en la plaza2 

El estado final 
el coche1 en la planta-0 
el coche2 en la planta-0 

Obsevaciones
En un principio parece que no hay que hacer ningún cambio en el domino de operaciones, ya que el movimiento del ascensor no cambia. Una posible solución es decir que la planta 0 tiene una plaza 0. No me parece la mejor opción, como ejemplo didáctico, así que planteo la modificación del problema para que se pueda mover un vehículo entre plantas y plazas. Hay que tener en cuenta que tanto la planta-1 como la planta 2 como objetivo del problema no tiene ningún sentido. Hay que descartar decirle al planificador que un coche esté en la planta-1 o planta-2 ya que no tiene razón de ser.
Al observar que la operación de: 

MOVE-COCHE-ASCENSOR 
solo es valida cuando se mueve un coche desde una planta y no desde una plaza. Por ello se debe introducir una precondición. Incluimos la nueva precondición con el operador OR.  El efecto también debe cambiar ya que debemos eliminar las aserciones tanto si el coche estaba en una plaza como si estaba en una planta.

MOVER-COCHE-PLAZA

Esta operación no sufre modificaciones, tampoco se va ha usar en en el problema. En un principio pensaba en modificarla para que valiera tanto para plaza como para planta. Ya que la modificacion de la precondicion era igual que la operación de MOVER-COCHE-ASCENSOR, pero  como sabría introducir el efecto de si afectaba a una planta o a una plaza.
Así que creo una nueva operación.

MOVER-COCHE-PLANTA
Desde el ascensor se puede mover el coche a la planta. Tenemos el peligro de que en el árbol de búsqueda pase por la planta-2 o por la planta-1 sin que tenga sentido de solución. Pero como el planificador estos bucles los elimina, no nos importa.



El planificador da distintas soluciones. Diferentes resoluciones con el mismo esquema de dominio y problema. En la solución del problema tanto en Prodigy como en SGP no he indicado que el ascensor debe estar libre para poder usarlo. En Prodigy al resolver el problema primero baja un coche a la plaza y después baja el segundo coche. En cambio en SGP sube los 2 coches a la vez al ascensor. Es mucho mas eficiente usar la respuesta de SGP. Aunque el planteamiento es erróneo se realiza en menos pasos.

El conjunto teórico utiliza operadores divididos por precondiciones,
efectos o estados añadido y efectos de borrado o de estados eliminados.
Esta representación es la utilizada por STRIPS, el cual instancia los
operadores, es decir, utiliza planificación lineal. 

La representación clásica utiliza operadores divididos en precondiciones
y efectos. Los estados en los efectos pueden ser negados, lo que
funciona como estados a eliminar. Esta representación es algo más
parecida a la que utiliza Prodigy.

Prodigy hace una búsqueda del primero el mejor. Expande una rama del árbol, selecciona 
la mejor opción (que normalmente es la mejor acción a instanciar) y expande la siguiente rama sólo del nodo seleccionado. Sin embargo, SGP hace una búsqueda en amplitud o por niveles, es decir, expande todos los nodos de una misma rama y después sigue expandiendo todas las ramas de todos los nodos. Por lo tanto, durante la búsqueda no se pueden comparar el concepto de nodo de cada uno de los planificadores, ya que los utilizan de formas distintas. Por ejemplo, Prodigy puede expandir las ramas de un nodo y al no alcanzar la solución deseada, vuelve atrás a expandir las ramas de otro nodo. SGP, al hacer la búsqueda en amplitud expandirá todos los nodos posibles hasta llegar a la solución, momento en el cual selecciona un camino, que son las acciones realizadas para pasar del estado inicial al final. Prodigy va proponiendo caminos y si se equivoca, vuelve atrás.



La principal diferencia entre las dos formas de hacer planificaciones es que mientras que en Prodigy son necesarios dos archivos, una para el dominio, y otro para el problema, en SGP todas las definiciones se hacen en un único fichero, aunque curiosamente la forma de definir el problema sea prácticamente igual. 
    Por lo demás, el formato del código cambia muy poco, de hecho para transformar un 
problema de una aplicación a otra, se ha copiado y pegado y modificado lo indispensable. 
    Las soluciones de ambos planificadores han sido exactamente iguales en los tres casos 
estudiados, por lo que a nivel práctico parece no importar cuál de los dos se use. 
    Personalmente me ha parecido más clara la forma de definir de Prodigy, aunque se 
agradece la comodidad de usar un interfaz GUI en el caso de Allegro CL. 
