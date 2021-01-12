.data
result: .asciiz "The average is: "
A: .word 1,2,3,4,5,6,7,8,9,10
length: .word 10
sum: .word 0
average: .word 0

.text
main:
#load address of variables/data
la $a1,A # load address of array
la $a2,length # load address of array
lw $t3,sum # load address of sum variable
la $t4,average # load address of average
#create counter for loop 
li $t5,0
#load value of length and store in $t6
lw $t6,0($a2)
#intialize temporary sum value
#lw $t8,sum

loop:
#read from array A
lw $t7,0($a1)
# add value in array index to sum
add $t3,$t3,$t7
# add 1 to loop counter
addi $t5,$t5,1
#increment pointer address for array 'A'
addi $a1,$a1,4
#if counter less than length, re-enter loop
blt $t5,$t6,loop

#if counter = length
sw $t3,sum #store sum value in $t3
div $t2,$t3,$t6 #get average. divide sum by length

sw $t2,average #store average value for printing

#print result variable
li $v0,4
la $a0,result
syscall
li $v0, 1
la $a0, 0($t2)#could not get it to work with average as second parameter
syscall
