# crack1 Readme File

## Overview

This is a *very* early attempt at an agent based model. In this document I will try to decide some of the issues a model would need to address.
I will also attempt to design objects that might be of some utility in that regard.

Other topics will need to be considered as well:

1. Model - SIR, SEIR, etc
2. Objects:
	1. Humans
		- sex
		- age (5 categories? like ONT data)
		- family  (an ID number or pointer)
		- COVID-19 (1,0)
		- status (S, E, I, R)
		- vaccination status (0,1,2)
		- vaccine (1,2,3 - Pfizer, Moderna, AstraZeneca)
		- vaccine effectiveness (0-100)
		- days since vaccination
		- weeks since vaccination (?)
		- day of illness (0 if not infected) 
	2. Families
		- ID #
	3. Global Variables
		- deaths
		- current_disease
		- recovered
	4. Vaccines
		- nDoses (required doses)
		- effectiveness (effectiveness for weeks 1-20)
		- ?others?
	5. Model Parameters
		-  

		