.data
result: .asciiz "Negative numbers present in array: "
A: .word -16,58,-43,-675,456,-354,3,76,89,7
length: .word 10

.text
main:
#load address of variables/data
la $a1,A # load address of array
la $a2,length # load address of array

#create counter for loop 
li $t3,0
#load value of length and store in $t4
lw $t4,0($a2)
#create counter for negative numbers
li $v1,0

loop:
#read from array A
lw $t4,0($a1)
# add 1 to loop counter
addi $t3,$t3,1
#increment pointer address for array 'A'
addi $a1,$a1,4
# add value in array index to sum
bltz $t4, negCount 
#if counter less than length, re-enter loop
blt $t3,$t4,loop
j end

negCount:
# add 1 to negative counter
addi $v1,$v1,1
#if counter less than length, re-enter loop
j loop

end:
#print result variable
li $v0,4
la $a0,result
syscall
li $v0, 1
la $a0, 0($v1)
syscall
