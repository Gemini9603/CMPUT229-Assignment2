#
# CMPUT 229 Student Submission License
# Version 1.0
#
# Copyright 2019 <student name>
#
# Redistribution is forbidden in all circumstances. Use of this
# software without explicit authorization from the author or CMPUT 229
# Teaching Staff is prohibited.
#
# This software was produced as a solution for an assignment in the course
# CMPUT 229 - Computer Organization and Architecture I at the University of
# Alberta, Canada. This solution is confidential and remains confidential 
# after it is submitted for grading.
#
# Copying any part of this solution without including this copyright notice
# is illegal.
#
# If any portion of this software is included in a solution submitted for
# grading at an educational institution, the submitter will be subject to
# the sanctions for plagiarism at that institution.
#
# If this software is found in any public website or public repository, the
# person finding it is kindly requested to immediately report, including 
# the URL or other repository locating information, to the following email
# address:
#
#          cmput229@ualberta.ca
#
#---------------------------------------------------------------
# CCID:                 
# Lecture Section:      
# Instructor:           J. Nelson Amaral
# Lab Section:          
# Teaching Assistant:   
#---------------------------------------------------------------
# 

.include "common.s"

#----------------------------------
#        STUDENT SOLUTION
#----------------------------------

.text

rsa:
addi sp, sp, -4
sw s0, 0(sp)
add s0, zero, zero

mv s1, a0       #Copy the address of the input string into s1
li t1, 0x00028
li t2, 0x00029
li t3, 0x00000
ecall

jal loop

jr ra

loop:
add t4, s1, s0
lbu t5, 0(t4)
beq t5, t3, Exit
beq t5, t1, push
beq t5, t2, pop
addi s0, s0, 1
jal loop

push:
addi sp, sp, -4
addi s0, s0, 1
add t4, s1, s0
lbu t5, 0(t4)
sb t5, 0(sp)
jal loop

pop:
lb t0, 0(sp)
li a7, 11
add a0, t0, zero
ecall 

addi sp, sp, 4

Exit:
lw s0, 0(sp)
addi sp, sp, 4
jalr zero, ra, 0
 

