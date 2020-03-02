(setf 
	(current-problem)
	(create-problem
		(name problema1)
		(objects

			(c1 c2 COCHE)
			(Plz1 Plz2 Plz3 Plz4 PLAZA)
			(Plnt-0 Plnt-1 Plnt-2 PLANTA)
			(asc ASCENSOR)

		)
		(state
			(and;static
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

				(CocheEn c1 Plz4)
				(CocheEn c2 Plz2)

			)
		)
		(goal
			(and
				(CocheEn c1 Plnt-0)
				(CocheEn c2 Plnt-0)

				;(CocheEn c1 asc)
				;(CocheEn c2 asc)
				;(AscensorEn asc Plnt-0)
			)
		);goal
	)
);setf
