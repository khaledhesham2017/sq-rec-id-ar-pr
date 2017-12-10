# Start .text segment (program code)
	.text
	
	.globl	main
main:
      # get  input  from  user 

      #frist input
      # Print string msg1
	   li	$v0,4		# print_string syscall code = 4
	   la	$a0, msg1	# load the address of msg
	   syscall

	  # Get input A from user and save
	  li	$v0,5		# read_int syscall code = 5
	  syscall	
	  move  	$t0,$v0		# syscall results returned in $v0
     
      
      #second input
      # Print string msg2
	   li	$v0,4		# print_string syscall code = 4
	   la	$a0, msg2	# load the address of msg
	   syscall

	  # Get input B from user and save
	  li	$v0,5		# read_int syscall code = 5
	  syscall	
	  move  	$t1,$v0		# syscall results returned in $v0


      #third input
      # Print string msg3
	   li	$v0,4		# print_string syscall code = 4
	   la	$a0, msg3	# load the address of msg
	   syscall

	  # Get input C from user and save
	  li	$v0,5		# read_int syscall code = 5
	  syscall	
	  move  	$t2,$v0		# syscall results returned in $v0


      #forth input
      # Print string msg4
	   li	$v0,4		# print_string syscall code = 4
	   la	$a0, msg4	# load the address of msg
	   syscall

	  # Get input D from user and save
	  li	$v0,5		# read_int syscall code = 5
	  syscall	
	  move  	$t3,$v0		# syscall results returned in $v0

	  # Print \n
	  li	$v0,4		# print_string syscall code = 4
	  la	$a0, newline
	    syscall
	  #detect funcation call
	   move $a0 ,$t0 #  send   $t0  to detact funcation in  a0
	   move $a1,$t1  #  send   $t1  to detact funcation in  a1
	   move $a2 ,$t2  #  send   $t2  to detact funcation in  a2
	   move $a3 ,$t3 #  send   $t3  to detact funcation in  a3
	   jal detect
	   move $t2 ,$v1
	    
	   bne $t2, $zero , square
       j rec
           square:
                 # Print string msg6
	               li	$v0, 4
	               la	$a0 ,msg6
	               syscall
	               j  exit
           rec: 
                # Print string msg7
	              li	$v0, 4
	              la	$a0 ,msg7
	              syscall
	   exit :
	       # Print \n
	            li	$v0,4		# print_string syscall code = 4
	            la	$a0, newline
	             syscall
	        move $a0 , $t0
          jal  perimeter
          # Print string msg8
	               li	$v0, 4
	               la	$a0 ,msg8
	               syscall
	       # Print  perimeter

	               li	$v0, 1
	               move	$a0 ,$v1
	               syscall
	        # Print \n
	            li	$v0,4		# print_string syscall code = 4
	            la	$a0, newline
	             syscall
	        
          jal   area
          # Print string msg8
	               li	$v0, 4
	               la	$a0 ,msg9
	               syscall
	       # Print  area

	               li	$v0, 1
	               move	$a0 ,$v1
	               syscall

      #Exit
	  li	$v0,10		# exit
	   syscall
#---------------------------------------------------------------------------------------------------
#detect funcation take  for side   in  $a0 ,$a1,$a2and $a3
detect :

           bne $a0,$a1 , Else  #if  $t0 != $t1  go to else 
           bne $a2,$a3 , Else    #if  $t2 != $t3  go to else 
           bne $a0,$a2 ,Else    #if  $t0 != $t2  go to else
           j Exit  #branch  to  exit
           Else:
                move  $v1 , $zero
                jr  $ra
            Exit :
                not  $v1,$zero
                jr  $ra
perimeter:
          add $v1 , $a1 , $a0
          add $v1 , $a2,$v1
          add $v1 , $a3 ,$v1
          jr  $ra
area: 
      mul $v1 , $a1 ,$a2
      jr  $ra

#--------------------------------------------------------------          
         # Start .data segment (data!)
	.data
msg1:	.asciiz	"Enter the first  side :   "
msg2:	.asciiz	"Enter the  second side  :   "
msg3:	.asciiz	"Enter the third  side :   "
msg4:	.asciiz	"Enter the  forth side :   "
msg5:	.asciiz	"A + B + C + D = "
msg6:	.asciiz	"this squre "
msg7:	.asciiz	"this rectangle "
msg8:	.asciiz	"perimeter = "
msg9:	.asciiz	"area =  "

newline:   .asciiz	"\n"