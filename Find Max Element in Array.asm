.data
result: .asciiz "Largest in given array is "

arr: .word 0,3,45,90,12
max: .word 1
length: .word 5

.text

main:
#load address of array
la $t0,arr
la $t1,length
la $t7,max
#create counter for loop 
li $t2,0

#load value of length and store in $t5
lw $t5,0($t1)

#initilize value of max
lw $t7,0($t0)

loop:
blt $t2,$t5,if #loop counter less than length
beq $t2,$t5,end

if:
#load value stored in array
lw $t4, 0($t0)

#increment array index
addi $t0,$t0,4
#increment loop counter
addi $t2,$t2,1

#check for greater than max
bgt $t4, $t7, changeMax
j loop

changeMax: 
addi $t0,$t0,-4
lw $t7,($t0)
sw $t7,max
addi $t0,$t0,4
j loop

end:
#print result variable
li $v0,4
la $a0, result
syscall
li $v0,1
la $a0, 0($t7)
syscall


