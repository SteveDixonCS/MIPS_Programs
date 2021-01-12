.data
prompt: .asciiz "Please enter an integer value: "
result: .asciiz "Index of integer is: "
A: .word -16,58,-43,-675,456,-354,3,76,89,7,234,65,-567,325,34,-58,4,-66,5,87
length: .word 20

.text
main:

#load address of variables/data
la $a1,A # load address of array
la $a2,length # load address of array
#create counter for loop 
li $t3,0
#create counter for index
li $t5,-1
#load value of length and store in $t7
lw $t7,0($a2)

#prompt user
li $v0,4
la $a0, prompt
syscall
#read input
li $v0,5
syscall
#store in $t6
move $t6, $v0

loop:
#read from array A
lw $t4,0($a1)
#if user int equals value at index go to "found" instruction set
beq $t6,$t4,found
# add 1 to loop counter
addi $t3,$t3,1
#increment pointer address for array 'A'
addi $a1,$a1,4
#if counter less than length, re-enter loop
blt $t3,$t7,loop
j end

found:
# set index variable to current loop index
move $t5,$t3
j end

end:
#print result variable and index
li $v0,4
la $a0,result
syscall
li $v0, 1
la $a0, 0($t5)
syscall
