.data
a:	.byte 	3, 2, 7, 9, 1	;carica in a l'array
sx:	.byte 	0              	;inizio array
dx:	.byte	4		;lunghezza array -1

.text
start:	
	ADDI r20, r0, 1        	;registro valore 1
	LB r1, sx(r0)		;carica in r1, il valore di sx
	LB r2, dx(r0)		;carica in r2, il valore di dx

loop0:  
	ADD r6, r0, r1		;assegna ad i il valore di sx
	ADD r7, r0, r2		;assegna a j il valore di dx
        ADD r3, r1, r2		;il valore di sx+dx va in r3
	ADDI r4, r0, 2		;carica il valore 2 in r4
	DIV r3, r4		;dividi r3 per r4 
	MFLO r5			;sposta il registo LO in r5
	LB r5, a(r5)		;carica il valore del pivot in r5

loop1: 	
	BEQ r6, r7, loop2	;se la condizione i=j e' vera passa a loop2
	SLT r8, r6, r7		;controlla se i<j il risultato (booleano) viene inserito in r8
	BEQ r8, r20, loop2	;se la condizione r8=1 è vera passa a loop2
        J loop7			;salto incondizionato

loop2: 
	LB r9, a(r6)		;carica in r9 il valore dell'array nella posizione 'i'
	SLT r10, r9, r5		;controlla se a[i]<pivot il risultato (booleano) viene inserito in r10
	BEQ r10, r0, loop3	;se la condizione r10=0 è vera passa a loop3  
	ADDI r6, r6, 1		;incrementa i
	J loop2			;salto incondizionato 

loop3:	
	LB r9, a(r7)          	;carica in r9 il valore dell'array nella posizione 'j'
        SLT r11, r5, r9        	;controlla se il pivot>a[j] il risultato (booleano) viene inserito in r11
        BNE r11, r20, loop4      	;se la condizione r11=1 è falsa passa a loop4
        ADDI r7, r7, -1		;decrementa j
	J loop3			;salto incondizionato

loop4: 	
	BEQ r6, r7, loop6	;se la condizione i=j e' vera passa a loop6
	SLT r12, r6, r7		;controlla se i<j, il risultato (booleano) viene inserito in r12
	BNE r12, r20, loop7	;se la condizione r12=1 passa a loop7
            
loop5:	
	LB r13, a(r6)		;carica in r13 il valore dell'array nella posizione 'i'
	LB r14, a(r7)		;carica in r14 il valore dell'array nella posizione 'j'
	SB r13, a(r7)		;scrive su r13 il valore dell'array nella posizione 'i'
	SB r14, a(r6)		;scrive su r14 il valore dell'array nella posizione 'j'

loop6:	
	ADDI r6, r6, 1		;incrementa 'i' 
	ADDI r7, r7, -1		;decrementa 'j'
        J loop1 		;salto incondizionato

loop7:	
	SLT r15, r1, r7		;controlla se sx<j il risultato booleano viene inserito in r15
	BEQ r15, r20, loop8	;se la condizione r15=1 è vera passa a loop8
        J loop9			;salto incondizionato

loop8:	
	ADD r19, r0, r1        	;backup del valore di sx in r19
        ADD r17, r0, r2        	;backup del valore di dx in r17
        ADD r2, r0, r7		;sostituisci il valore di dx con j
	J loop0			;salto incondizionato

loop9:	
	ADD r2, r0, r17		;sostituisci il valore di r17 con dx
        SLT r16, r6, r17	;controlla se i<dx il risultato booleano vieneinserito in r16
    	BEQ r16, r0, end	;se la condizione r16=0 passa a end        
          
loop10:	
	ADD r1, r0, r6		;sostituisci il valore di 'sx' con 'i'
        J loop0			;salto incondizionato

end:	
	HALT			;interruzione programma
