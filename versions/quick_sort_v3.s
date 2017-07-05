.data
a:	.byte 	3, 2, 7, 9, 1	;carica in a l'array
sx:	.byte 	0               ;inizio array   
dx:	.byte	4		;lunghezza array -1

.text
start:	
	LB r1, sx(r0)		;carica in r1, il valore di sx
	LB r2, dx(r0)		;carica in r2, il valore di dx
	
	ADD r6, r0, r1		;assegna ad i il valore di sx
	ADD r7, r0, r2		;assegna a j il valore di dx
        ADD r3, r1, r2		;il valore di sx+dx va in r3
	ADDI r4, r0, 2		;carica il valore 2 in r4
	DIV r3, r4		;dividi r3 per r4
	MFLO r5			;sposta il registo LO in r5
	LB r5, a(r5)		;carica il valore del pivot in r5

 	ADDI r6, r6, 1		;incrementa i
	ADDI r6, r6, 1		;incrementa i

	LB r13, a(r6)		;carica in r13 il valore dell'array nella posizione 'i'
	LB r14, a(r7)		;carica in r14 il valore dell'array nella posizione 'j'
	SB r13, a(r7)		;scrive su r13 il valore dell'array nella posizione 'i'
	SB r14, a(r6)		;scrive su r14 il valore dell'array nella posizione 'j'

	ADDI r6, r6, 1		;incrementa i
	ADDI r7, r7, -1		;decrementa j
        ADDI r7, r7, -1		;decrementa j

        ADD r3, r1, r7		;il valore di sx+dx va in r3
	ADDI r4, r0, 2		;carica il valore 2 in r4
	DIV r3, r4		;dividi r3 per r4
	MFLO r5			;sposta il registo LO in r5
	LB r5, a(r5)		;carica il valore del pivot in r5

	LB r13, a(r1)		;carica in r13 il valore dell'array nella posizione 'i'
	LB r14, a(r7)		;carica in r14 il valore dell'array nella posizione 'j'
	SB r13, a(r7)		;scrive su r13 il valore dell'array nella posizione 'i'
	SB r14, a(r1)		;scrive su r14 il valore dell'array nella posizione 'j'

        ADD r3, r6, r2		;il valore di sx+dx va in r3
	ADDI r4, r0, 2		;carica il valore 2 in r4
	DIV r3, r4		;dividi r3 per r4
	MFLO r5			;sposta il registo LO in r5
	LB r5, a(r5)		;carica il valore del pivot in r5
        
	LB r13, a(r6)		;carica in r13 il valore dell'array nella posizione 'i'
	LB r14, a(r2)		;carica in r14 il valore dell'array nella posizione 'j'
	SB r13, a(r2)		;scrive su r13 il valore dell'array nella posizione 'i'
	SB r14, a(r6)		;scrive su r14 il valore dell'array nella posizione 'j'

	HALT                    ;interruzione programma

