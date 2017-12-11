# Start .text segment (program code)
	.text
	.globl	main
main:
	# Get inputs from user 

	# First input
    # Prints 'Enter the shape width: ''
	li $v0, 4		# print_string syscall code = 4
	la $a0, msg1	# load the address of msg
	syscall

	# Get width from user and save
	li $v0, 5		# read_int syscall code = 5
	syscall	
	move $t0, $v0	# syscall results returned in $v0

    # Second input
    # Prints 'Enter the shape length: '
	li $v0, 4		# print_string syscall code = 4
	la $a0, msg2	# load the address of msg
	syscall

	# Get length from user and save
	li $v0, 5		# read_int syscall code = 5
	syscall
	move $t1, $v0	# syscall results returned in $v0

	jal printLine   # just  print  new  line 
	move $a1, $t0		# send $t0 to detact function in a1
	move $a2 ,$t1		# send $t1 to detact function in a2
    #------------------------------------------------------  
	# Call detect function

	# TODO delete #- if anyone wants to try his function

	
	#-jal detect		# call detect function 
	#-move $t2 ,$v1		# assign the return value to $t2
	    
	#-bne $t2, $zero, square		# if $t2 != $zero this is square 
    	#-j rec						# else this is rectangle
        	#-square:	#square label 
				# Prints 'The shape type is: square'
				#-li $v0, 4
	            #-la $a0, msg3
	            #-syscall
	            #-j exit #jump to exit

			#-rec:		#rectangle  lable 
            	# Prints 'The shape type is: rectangle'
	            #-li $v0, 4
	            #-la $a0, msg4
	            #-syscall
	#------------------------------------------------------------------------------------------
	 jal printLine   # just  print  new  line
	#--------------------------------------------------------------------

	# perimeter function call
	# TODO delete #- if anyone wants to try his function
    jal perimeter
    # Prints "The perimeter is: "
	li $v0, 4
	la $a0, msg5
	syscall
	
	# Print perimeter
	li $v0, 1
	move $a0, $v1
	syscall
    #----------------------------------------------------------------------------------------------
	
	jal printLine
	       
	#---------------------------------------------------------------------------------------------- 
    # area  function call
	# TODO delete #- if anyone wants to try his function
    jal area
    # Prints 'The area is: ' 
	li $v0, 4
	la $a0, msg6
	syscall

	# Print area
	li $v0, 1
	move $a0 ,$v1
	syscall
	#-----------------------------------------------------------

    # Exit the program
	li $v0, 10		# exit
	syscall

#---------------------------------------------------------------------------------------------------
#plz  all  comment  all  line   in function 
#detect function take  for side   in  $a0 ,$a1,$a2and $a3
detect:
           #TODO  put  here  detect  function  it  take tow  parenter  in $a1,$a2  and  return  in $v1 if  sqr  -1 if  rec  0
perimeter:
         #TODO  put  function   perimeter  take  input  in $a1 , $a2  and  return in  $v1
	add $v1 , $a1 , $a2   # add the width to the length and assign the value to $v1
    sll $v1 , $v1 , 1	  # shit the sum value 1 bit (left shift) as multiply by 2
	jr $ra
area:
	mul $v1, $a1, $a2 		# Multiply the width by the length and assign the result to $v1

	jr $ra 					# Return to the caller
printLine:
      #Print \n
	li $v0, 4		# print_string syscall code = 4
	la $a0, newline
	syscall
	jr $ra 
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
