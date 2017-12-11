# Start .text segment (program code)
	.text
	
	.globl	main
main:
      # get  input  from  user 

      #frist input
      # Print  please  enter  width
	   li	$v0,4		# print_string syscall code = 4
	   la	$a0, msg1	# load the address of msg
	   syscall

	  # Get width from user and save
	   li	$v0,5		# read_int syscall code = 5
	   syscall	
	   move  	$t0,$v0		# syscall results returned in $v0
     
      
      #second input
      # Print please  enter  height
	   li	$v0,4		# print_string syscall code = 4
	   la	$a0, msg2	# load the address of msg
	   syscall

	  # Get height from user and save
	  li	$v0,5		# read_int syscall code = 5
	  syscall	
	  move  	$t1,$v0		# syscall results returned in $v0


	  # Print \n
	  li	$v0,4		# print_string syscall code = 4
	  la	$a0, newline
	    syscall
	  #------------------------------------------------------  
	  #detect funcation call
	  # TODO  delete  #-  if  any  one  want  try  your  funcation 
	   #-move $a1,$t0 #  send   $t1  to detact funcation in  a1
	   #-move $a2 ,$t1  #  send   $t2  to detact funcation in  a2
	  
	   #-jal detect # call  detect  funcation 
	   #-move $t2 ,$v1 # assign  return  value  to $t2
	    
	   #-bne $t2, $zero , square   # if   $t2  != $zero   this  is square 
       #- j rec   # else   this  is  rectangle
           #-square:   #square  lable 
                 # Print this  square 
	              #- li	$v0, 4
	               #- la	$a0 ,msg3
	               #- syscall
	               #- j  exit  #jump tp exit
           #- rec:  #rectangle  lable 
                # -Print string  this is  rectangle
	             #- li	$v0, 4
	              #- la	$a0 ,msg4
	              #- syscall
	      #------------------------------------------------------------------------------------------
	      #to print  new  line   
	   #- exit :
	       #- Print \n
	         #-   li	$v0,4		# print_string syscall code = 4
	           #- la	$a0, newline
	            #- syscall
	        #--------------------------------------------------------------------
	        # perimeter  funcation call
	         # TODO  delete  #-  if  any  one  want  try  your  funcation
          #-jal  perimeter
          #- Print    perimeter   = 
	             # - li	$v0, 4
	              #- la	$a0 ,msg5
	               #-syscall
	       # Print  perimeter
	           #- li	$v0, 1
	              #-  move	$a0 ,$v1
	               #- syscall
          #----------------------------------------------------------------------------------------------
	        # Print \n
	            li	$v0,4		# print_string syscall code = 4
	            la	$a0, newline
	             syscall
	       
	      #---------------------------------------------------------------------------------------------- 
          # area  funcation call
	         # TODO  delete  #-  if  any  one  want  try  your  funcation
         #-  jal   area
          # Print area  = 
	               #- li	$v0, 4
	               #- la	$a0 ,msg6
	               #- syscall
	       # Print  area

	               #- li	$v0, 1
	               #- move	$a0 ,$v1
	               #- syscall
	      #-----------------------------------------------------------


      #Exit
	  li	$v0,10		# exit
	   syscall
#---------------------------------------------------------------------------------------------------
#plz  all  comment  all  line   in funcation 
#detect funcation take  for side   in  $a0 ,$a1,$a2and $a3
detect :
           #TODO  put  here  detect  funcation  it  take tow  parenter  in $a1,$a2  and  return  in $v1 if  sqr  -1 if  rec  0
perimeter:
         #TODO  put  funcation   perimeter  take  input  in $a1 , $a2  and  return in  $v1
area: 
     #TODO  put  funcatuin area take  input  in $a1 ,$a2  and  return  in $v1

#--------------------------------------------------------------          
         # Start .data segment (data!)
	.data
	#TODO   if  any  one  need  print   message  put  this  here 
msg1:	.asciiz	"Enter the width :   "
msg2:	.asciiz	"Enter the height  :   "
msg3:	.asciiz	"this  shape  is  square  "
msg4:	.asciiz	"this  shape  is  rectangle "
msg5:	.asciiz	"perimeter   =   "
msg6:	.asciiz	"area = "
newline:   .asciiz	"\n"