;;
;;~/domains/aparcamiento2/domain.lisp

(in-package "USER")

(create-problem-space 'aparcamiento2 :current t)

(ptype-of PLAZA :top-type)
(ptype-of COCHE :top-type)
(ptype-of PLANTA :top-type)
(ptype-of ASCENSOR :top-type)

(OPERATOR MOVER-ASCENSOR
	(params <ascensor> <origen> <destino>)
	(preconds 
		(
			(<ascensor> ASCENSOR)
			(<origen> PLANTA)
			(<destino> PLANTA)
		)
		(and 
			(AscensorEn <ascensor> <origen>)
			(Adyacente <origen> <destino>)
		)
	)
	(effects 
	()
		(
			(add 
				(AscensorEn <ascensor> <destino>)
			)
			(del
				(AscensorEn <ascensor> <origen>)
			)
		
		)
	)
)
(OPERATOR MOVER-COCHE-ASCENSOR
	(params <ascensor> <coche> <planta> )
	(preconds 
		(
			(<ascensor> ASCENSOR)
			(<coche> COCHE)
			(<planta> PLANTA)
			(<plaza> PLAZA)
		)
		(or
			(and 
				(AscensorEn <ascensor> <planta>)
				(CocheEn <coche> <planta>)
			)
			(and	
				(AscensorEn <ascensor> <planta>)
				(CocheEn <coche> <plaza>)
				(Plaza-en <plaza> <planta>)
			)
		)
	)
	(effects 
	()
		(
			(add 
				(CocheEn <coche> <ascensor>)
			)
			(del
				(CocheEn <coche> <planta>)
			)
			(del
				(CocheEn <coche> <plaza>)
			)
		
		)
	)
)
(OPERATOR MOVER-COCHE-PLAZA
	(params <ascensor> <coche> <planta> <plaza>  )
	(preconds 
		(
			(<ascensor> ASCENSOR)
			(<coche> COCHE)
			(<planta> PLANTA)
			(<plaza> PLAZA)
		)
		(and 
			(AscensorEn <ascensor> <planta>)
			(CocheEn <coche> <ascensor>)
			(Plaza-en <plaza> <planta>)
		)
	)
	(effects 
	()
		(
			(add 
				(CocheEn <coche> <plaza>)
			)
			(del
				(CocheEn <coche> <ascensor>)
			)
		)
	)
)
(OPERATOR MOVER-COCHE-PLANTA
	(params <ascensor> <coche> <planta>  )
	(preconds 
		(
			(<ascensor> ASCENSOR)
			(<coche> COCHE)
			(<planta> PLANTA)
		)
		(and 
			(AscensorEn <ascensor> <planta>)
			(CocheEn <coche> <ascensor>)
		)
	)
	(effects 
	()
		(
			(add 
				(CocheEn <coche> <planta>)
			)
			(del
				(CocheEn <coche> <ascensor>)
			)
		)
	)
)
