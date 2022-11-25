(define (domain save-computer) 
	(:predicates (at ?obj ?room)
		(carry ?obj ?robby)
		(room ?room)
		(robot ?robby)
		(comp ?comp)
		(power ?comp)
		(connected ?comp)
		(alarm ?room)
		(free ?robby)
		(safe ?comp)

	)

	(:action markSafe
		:parameters (?comp ?room)
		:precondition (and (comp ?comp) (room ?room) (at ?comp ?room) (not (alarm ?room)) (power ?comp) (connected ?comp))
		:effect (safe ?comp)
	)

	(:action poweron
		:parameters (?comp)
		:precondition (not (power ?comp))
		:effect (power ?comp)
	)

	(:action poweroff
		:parameters (?comp ?robby ?room)
		:precondition (and (power ?comp) (robot ?robby) (room ?room) (at ?comp ?room) (at ?robby ?room))
		:effect (and (not (power ?comp)) (not (connected ?comp)))
	)

	(:action connect
		:parameters (?comp ?robby ?room)
		:precondition (and (power ?comp) (robot ?robby) (room ?room) (at ?comp ?room) (at ?robby ?room)) 
		:effect (connected ?comp)
	)



	(:action pick
		:parameters (?comp ?room ?robby)
		:precondition (and  (comp ?comp) (not (power ?comp)) (room ?room) (robot ?robby) (at ?comp ?room) (at ?robby ?room) (free ?robby))
		:effect (and (carry ?comp ?robby) (not (at ?comp ?room)) (not (free ?robby)))
	)

	(:action move
		:parameters (?from ?to ?robby)
		:precondition (and (robot ?robby) (room ?from) (room ?to) (at ?robby ?from))
		:effect (and  (at ?robby ?to) (not (at ?robby ?from)))
	)

	(:action drop
		:parameters (?comp  ?room ?robby)
		:precondition (and  (comp ?comp) (room ?room) (robot ?robby) (carry ?comp ?robby) (at ?robby ?room))
		:effect (and (at ?comp ?room) (free ?robby) (not (carry ?comp ?robby)))
	)

)