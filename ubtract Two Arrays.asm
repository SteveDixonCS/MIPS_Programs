.data
result: .asciiz "Result is "
format: .asciiz " "

A: .word 10,5,6,15,17,19,25,30,12,56
B: .word 4,15,16,5,7,9,15,10,22,6
C: .word 0,0,0,0,0,0,0,0,0,0
length: .word 10

.text
main:
#load address of variables/data
la $t0,A
la $t1,B
la $t2,C
la $t3,length

#create counter for loop 
li $t4,0
#load vaule of length and store in $t5
lw $t5,0($t3)

#print result variable
li $v0,4
la $a0, result
syscall

loop:
#read from array A
lw $t6,0($t0)
#read from array B
lw $t7,0($t1)
#subtract A for B (A-B); store subtraction result in $t8
sub $t8, $t6, $t7
#store $t8 value in array C index
sw $t8,0($t2)

#print subraction result
li $v0,1
la $a0, 0($t8)
syscall
#to add formatting between each number/result to improve readability
li $v0,4
la $a0, format
syscall
#increment pointer address for arrays A, B, and C
addi $t0,$t0,4
addi $t1,$t1,4
addi $t2,$t2,4
#increment counter 
addi $t4,$t4,1

#invoke loop until length value reached
#if counter less than length, re-enter loop
blt $t4,$t5,loop

