Feature: code-breaker submits a guess

	The code-breaker submits a guess of four numbers.
	The game marks the guess with + and - signs.
	For each number in the guess that matches the number 
	and position of a number in the secret code, the mark
	includes one + sign. For each number in the guess that 
	matches the number but not the position of a number in 
	the secret code, the mark includes one - sign.

	As a code breaker
	I would submit a guess
	so that i can break the code.

	Scenario Outline: submit guess
		Given the secret code is "<code>"
		When i guess "<guess>"
		Then the mark should be "<mark>"

		Scenarios: no matches
		| code | guess | mark |
		| 1234 | 5555  | 	    |

		Scenarios: 1 number matches
		| code | guess | mark |
		| 1234 | 1555  | +	  |		
		| 1234 | 2555  | -	  |		

		Scenarios: 2 numbers match
		| code | guess | mark |
		| 1234 | 1255  | ++   |
		| 1234 | 2155  | --   |
		| 1234 | 1535  | ++   |
		| 1234 | 1525  | +-   |

		Scenarios: 3 numbers match
		| code | guess | mark |
		| 1234 | 1235  | +++  |
		| 1234 | 1253  | ++-  | 
		| 1234 | 2135  | +--  |
		| 1234 | 1325  | +--  |
		| 1234 | 3125  | ---  |

		Scenarios: All numbers match
		| code | guess | mark |
		| 1234 | 1234  | ++++ |
		| 1234 | 4321  | ---- |
		| 1234 | 1243  | ++-- |
		| 1234 | 1324  | ++-- |
		| 1234 | 3214  | ++-- |