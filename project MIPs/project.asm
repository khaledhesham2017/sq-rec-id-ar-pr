# Start .text segment (program code)
	.text
	.globl	main
main:
	# Get inputs from user 
    # First input
    # Prints 'Enter the shape width: '
	li $v0, 4		# print_string syscall code = 4
	la $a0, msg1	# load the address of msg
	syscall
    # Get width from user and save
	li $v0, 7		# read_double  syscall code = 7
	syscall	        # system_call
	mov.d $f14, $f0	# syscall results returned in $f14
	# Second input
    # Prints 'Enter the shape length: '
	li $v0, 4		# print_string syscall code = 4
	la $a0, msg2	# load the address of msg
	syscall         # system_call
    # Get length from user and save
	li $v0, 7		# read_double syscall code = 7
	syscall         # system_call
	mov.d $f16, $f0	# syscall results returned in $f16
	#-------------------------------------------------------
    jal printLine   # just  print  new  line 
	#------------------------------------------------------  
	# Call detect function
    jal detect					# Call detect function 
	 bne $v1, 0, square			# if $v1 != $zero this is square 
    	j rec					# else this is rectangle
        	square:				# square label 
				li $v0, 4       # print_string syscall code = 4
	            la $a0, msg3	# Prints 'The shape type is: square'
	            syscall    		# return system  call
	            j end_if 		# jump to end_if
            rec:				# rectangle  lable 
            	li $v0, 4  		# print_string syscall code = 4
	            la $a0, msg4 	# Prints 'The shape type is: rectangle
	            syscall    		# return system  call
	#------------------------------------------------------------------------------------------
	end_if: 					# exit label
	       jal printLine   		# Prints a new line
	#--------------------------------------------------------------------
	# Calculate perimeter 
	jal perimeter 				# Call perimeter function
	li $v0, 4    				# print_string syscall code = 4
	la $a0, msg5 				# Prints 'The perimeter is: '
	syscall     				# return system call
	# Print perimeter
	li $v0, 3     				# print_double syscall code = 3
	mov.d $f12, $f0  			# Prints 'The perimeter is: '
	syscall 					# return system call
    #----------------------------------------------------------------------------------------------
	jal printLine   			# just  call function print  line
	#---------------------------------------------------------------------------------------------- 
    # Calculate area 
	jal area   					# Call area function
	li $v0, 4 					# print_string syscall code = 4
	la $a0, msg6  				# Prints 'The area is: ' 
	syscall      				# return system  call
    # Print area
	li $v0, 3    				# print_double syscall code = 3
	mov.d $f12 ,$f0  			# Prints 'The area is: '
	syscall        				# return system call
	#-----------------------------------------------------------
	# Exit the program
	li $v0, 10					# Exit
	syscall 					# return system call
#---------------------------------------------------------------------------------------------------
detect:
	# Detect whether the shape is square or rectangle, given width and length
		c.eq.d $f14, $f16 	# if f14 equals f16 make code = 1
		bc1t   d_square     # if code equal 1 true
		li $v1,0 			# else the code will continue till 'jr'
		jr $ra				# return so the code stop excuting at this point
	d_square: 
		   li $v1, 1      	# load 1 in $v1 
		   jr $ra       	# Return to the caller

perimeter:
	# Calculate the shape perimeter
	add.d $f0, $f14, $f16 	# add $f14, $f16 in $f0
    add.d $f0, $f0, $f14  	# add $f14, $f0 in $f0
    add.d $f0, $f0, $f16  	# add $f16, $f0 in $f0  
    jr $ra                  # Return to the caller
area:
	# Calculate the shape area
	mul.d $f0, $f14, $f16 	# Multiply the width by the length and assign the result to $f0
    jr $ra 					# Return to the caller
printLine:
	#Prints a new line
	li $v0, 4				# print_string syscall code = 4
	la $a0, newline  		# print new  line
	syscall          		# call system function 
	jr $ra           		# return to the  caller
#--------------------------------------------------------------          
# Start .data segment (data!)
	.data
msg1:	.asciiz	"Enter the shape width: "
msg2:	.asciiz	"Enter the shape length: "
msg3:	.asciiz	"The shape type is: square"
msg4:	.asciiz	"The shape type is: rectangle"
msg5:	.asciiz	"The perimeter is: "
msg6:	.asciiz	"The area is: "
newline:   .asciiz	"\n"
