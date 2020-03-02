(define (domain aparcador)
	(:predicates)
	(:action MOVER-ASCENSOR 
		:parameters (?ascensor ?origen ?destino)
		:precondition 
		(and
			(AscensorEn ?ascensor ?origen)
			(Adyacente ?origen ?destino)

		)
		:effect
		(and
			(AscensorEn ?ascensor ?destino)
			(not 
				(AscensorEn ?ascensor ?origen)
			)
		)
	)
	(:action MOVER-COCHE-ASCENSOR 
		:parameters (?ascensor ?coche ?planta)
		:precondition 
		(and
			(AscensorEn ?ascensor ?planta)
			(CocheEn ?coche ?planta )
			(Libre ?ascensor)
		)
		:effect
		(and
			(CocheEn ?coche ?ascensor)
			(not 
				(CocheEn ?coche ?planta)
			)
			(not 
				(Libre ?ascensor) 
			)
		)
	)

	(:action MOVER-COCHE-PLAZA
		:parameters (?ascensor ?coche ?planta ?plaza)
		:precondition 
		(and
			(AscensorEn ?ascensor ?planta)
			(CocheEn ?coche ?ascensor)
			(Plaza-en ?plaza ?planta)	
		)	
		:effect
		(and
			(CocheEn ?coche ?plaza)
			(not
				(CocheEn ?coche ?ascensor)
			)
			(Libre ?ascensor)
		)
	)
)

(define (problem aparcar)
	(:domain aparcador)
	(:objects  coche plaza planta ascensor)
	(:init
		(coche c1)
		(coche c2)
		(planta Plnt-0)
		(planta Plnt-1)
		(planta Plnt-2)
		(plaza Plz1)
		(plaza Plz2)
		(plaza Plz3)
		(plaza Plz4)
		(ascensor asc)
		(Libre asc)
		(Plaza-en Plz1 Plnt-1)
		(Plaza-en Plz2 Plnt-1)
		(Plaza-en Plz3 Plnt-2)
		(Plaza-en Plz4 Plnt-2)
		(Adyacente Plnt-0 Plnt-1)
		(Adyacente Plnt-1 Plnt-0)
		(Adyacente Plnt-2 Plnt-1)
		(Adyacente Plnt-1 Plnt-2)
		;dinamic
		(AscensorEn asc Plnt-0)
		(CocheEn c1 Plnt-0)
		(CocheEn c2 Plnt-0)
	)
	(:goal
		(and
			(CocheEn c1 Plz4)
			(CocheEn c2 Plz2)
		)
	)
)
