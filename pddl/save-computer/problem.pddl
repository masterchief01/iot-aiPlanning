(define (problem save-computer12) 
	(:domain save-computer) 
	(:objects ROOM1 ROOM2 ROBBY COMP1)
	(:init 	(ROOM ROOM1)
		(ROOM ROOM2)
		(COMP COMP1)
		(POWER COMP1)
		(CONNECTED COMP1)
		(ROBOT ROBBY)
		(FREE ROBBY)
		(AT COMP1 ROOM1)
		(AT ROBBY ROOM2)
		(ALARM ROOM1)
	)
	(:goal 	(SAFE COMP1)
	)
)