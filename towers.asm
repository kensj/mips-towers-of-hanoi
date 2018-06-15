.data
	Start:	.asciiz	"\nStarting number of disks: "
	AB:	.asciiz	"Transfer disk from A to B\n"
	AC:	.asciiz	"Transfer disk from A to C\n"
	BA:	.asciiz	"Transfer from disk B to A\n"
	BC:	.asciiz	"Transfer disk from B to C\n"
	CA:	.asciiz	"Transfer from disk C to A\n"
	CB:	.asciiz	"Transfer from disk C to B\n"
	Done:	.asciiz	"Done\n"
	
.text
main:
	li  $v0, 4	# System call for print string
	la  $a0, Start	# Ask for the number of disks
	syscall
	
	li $v0, 5	# System call for read integer
    	syscall
    	move $t0, $v0	# Move result to temporary register
    	
    	li $v0, 10	# System call for exit program
    	syscall
    	