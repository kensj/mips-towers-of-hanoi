.data
	start:	.asciiz	"\nStarting # of Disks: "
	to:	.asciiz	" -> "
	done:	.asciiz	"Done\n"
	newline:.asciiz "\n"
	
.text
main:
	li  $v0, 4	# System call for print string
	la  $a0, start	# Ask for the number of disks
	syscall
	li $v0, 5	# System Call for Read Integer
    	syscall

    	move $s0, $v0	# Save Number of Disks
	li $s1, 1	# Tower 1
	li $s2, 2	# Tower 2
	li $s3, 3	# Tower 3
	jal tower

	li $v0, 10	# System Call for Exit Program
    	syscall
tower:
	# if Number of Disks > 1
	bne $s0, 1, towerloop

    	li $v0, 1	# Tower 1
    	move $a0, $s1
    	syscall
    	li $v0, 4	# to
    	la $a0, to
    	syscall
    	li $v0, 1	# Tower 3
    	move $a0, $s3
    	syscall
    	li $v0, 4	# newline
    	la $a0, newline
    	syscall
   
	jr $ra
towerloop:
	addiu $sp, $sp, -20	# Start of the Stack
				# Store in the Stack
	sw $ra, 16($sp)		# Store Return Register
    	sw $s3, 12($sp)		# Store Tower 3
    	sw $s2, 8($sp)		# Store Tower 2
    	sw $s1, 4($sp)		# Store Tower 1
	sw $s0, 0($sp)		# Store Number of Disks
	
	# Towers (n-1) recursive call
	move $t0, $s2 
	move $s2, $s3		# Tower 2 = Tower 3
	move $s3, $t0		# Tower 3 = Tower 2
	addiu $s0, $s0, -1
	jal tower
	
	lw $ra, 16($sp)		# Load Return Address
    	lw $s3, 12($sp)		# Load Tower 3
    	lw $s2, 8($sp)		# Load Tower 2
    	lw $s1, 4($sp)		# Load Tower 1
    	lw $s0, 0($sp)		# Load Number of Disks

    	li $v0, 1 		# Disk 1
    	move $a0, $s1
    	syscall
    	li $v0, 4		# To
    	la $a0, to
    	syscall
    	li $v0, 1		# Disk 3
    	move $a0, $s3
    	syscall
    	li $v0, 4		# newline
    	la $a0, newline
    	syscall
    	
    	# Towers (n-1) recursive call
	move $t0, $s2
	move $s2, $s1		# Tower 2 = Tower 1
	move $s1, $t0		# Tower 1 = Tower 2
	addiu $s0, $s0, -1
    	jal tower  
    	
    	lw $ra, 16($sp)
    	addiu $sp, $sp, 20

    	jr $ra
