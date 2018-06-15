.data
	start:	.asciiz	"\nStarting Number of Disks: "
	trans:	.asciiz	"\nMove Disk From "
	to:	.asciiz	"to"
	done:	.asciiz	"Done\n"
	
.text
main:
	li  $v0, 4	# System call for print string
	la  $a0, start	# Ask for the number of disks
	syscall
	
	li $v0, 5	# System call for read integer
    	syscall
    	
end:
	li $v0, 10	# System call for exit program
    	syscall
	