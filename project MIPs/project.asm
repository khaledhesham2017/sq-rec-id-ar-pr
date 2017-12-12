# Start .text segment (program code)
	.text
	.globl	main
main:
	# Get inputs from user 
    # First input
    # Print messege  'Enter the shape width: ''
	li $v0, 4		# print_string syscall code = 4
	la $a0, msg1	# load the address of msg
	syscall
    # Get width from user and save
	li $v0, 5		# read_int syscall code = 5
	syscall	
	move $a1, $v0	# syscall results returned in $v0
    # Second input
    # Prints 'Enter the shape length: '
	li $v0, 4		# print_string syscall code = 4
	la $a0, msg2	# load the address of msg
	syscall
    # Get length from user and save
	li $v0, 5		# read_int syscall code = 5
	syscall
	move $a2, $v0	# syscall results returned in $v0
    jal printLine   # just  print  new  line 
	#------------------------------------------------------  
	# Call detect function
    jal detect		# call detect function 
	 bne $v1, 0, square		# if $v1 != $zero this is square 
    	j rec						# else this is rectangle
        	square:	#square label 
				li $v0, 4       # print_string syscall code = 4
	            la $a0, msg3   # Print message 'The shape type is: square'
	            syscall    #return system  call
	            j exit #jump to exit
            rec:		#rectangle  lable 
            	li $v0, 4  # print_string syscall code = 4
	            la $a0, msg4  # Print message 'The shape type is: rectangle
	            syscall    #return system  call
	#------------------------------------------------------------------------------------------
	exit : #exit label
	       jal printLine   # just  print  new  line
	#--------------------------------------------------------------------
	# calculate perimeter 
	jal perimeter #just  call  perimeter funcation
    # Prints "The perimeter is: "
	li $v0, 4    # print_string syscall code = 4
	la $a0, msg5 #print  message 'the perimeter is :'
	syscall     #return system  call
	# Print perimeter
	li $v0, 1     # print_string syscall code = 1
	move $a0, $v1  #print   the  area
	syscall #return system call
    #----------------------------------------------------------------------------------------------
	jal printLine   # just  call function print  line
	#---------------------------------------------------------------------------------------------- 
    # calculate area 
	jal area   #just call  area function
    # Prints 'The area is: ' 
	li $v0, 4 # print_string syscall code = 4
	la $a0, msg6  #print  message 'the area is :'
	syscall      #return system  call
    # Print area
	li $v0, 1    # print_string syscall code = 1
	move $a0 ,$v1  #print   the  area 
	syscall        #return system call
	#-----------------------------------------------------------
	# Exit the program
	li $v0, 10		# exit
	syscall #return system call
#---------------------------------------------------------------------------------------------------
detect:
        #TODO  put  here  detect  function  it  take two  paramters  $a1,$a2  and  return  in $v1 if  sqr  -1 if  rec  0
		beq $a1, $a2, d_square 	#if a1 and a2 are equal jump to equal
		li $v1,0 				#else the code will continue till 'jr'
		jr $ra					#return so the code stop excuting at this point
	d_square: 
		   li $v1, 1      # load 1 in  $v1 
		   jr $ra       # Return to the caller

perimeter:
         #TODO  put  function   perimeter  take  input  in $a1 , $a2  and  return in  $v1
	add $v1 , $a1 , $a2   # add the width to the length and assign the value to $v1
    sll $v1 , $v1 , 1	  # shift the sum value 1 bit (left shift) as multiply by 2
	jr $ra
area:
	mul $v1, $a1, $a2 		# Multiply the width by the length and assign the result to $v1
    jr $ra 					# Return to the caller
printLine:
      #Print \n
	li $v0, 4		# print_string syscall code = 4
	la $a0, newline  # print new  line
	syscall          #call system function 
	jr $ra           # return to the  caller
#--------------------------------------------------------------          
# Start .data segment (data!)
	.data
#TODO if any one need print message put this here 
msg1:	.asciiz	"Enter the shape width: "
msg2:	.asciiz	"Enter the shape length: "
msg3:	.asciiz	"The shape type is: square"
msg4:	.asciiz	"The shape type is: rectangle"
msg5:	.asciiz	"The perimeter is: "
msg6:	.asciiz	"The area is: "
newline:   .asciiz	"\n"
