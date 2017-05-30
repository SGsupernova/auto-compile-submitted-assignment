# auto-check-assignment
By Taeseung Lee
 
## Description
**Auto compile program for grading assignments**<br />
This program compiles each c file(submitted assignment) and executes correspoinding a executable file "a.out". After the normal execution, make a output file.<br />
If there is a compile error or warning, make a file that is composed of error messages.<br />
If diff command finds differences between the answer text file and the output file, then make a diff file.

**Cases of Standard Output This program**<br />
Case 1 : If an output of a program match an answer, print out a message "student number - success"
Case 2 : If an output of a program dose not match the answer, print out a message "student number - fail(compile error)"<br />
Case 3 : If there is an compile error or warning, print out a message "student number - fail(compile error)"<br />
Case 4 : If assignment makes a wrong answer, print out a message "student number - fail(wrong answer)"<br />

One assumption is formats of all c files is ds_hw_1_20140000.c

# Files and Directories Description
- "submitted_ assignments/" is a directory containing a collection of homwork assignments
- "output/" is a directory that contains the outputs following a execution
- "diff-output/" is a directory that contains the results of "diff" command
- "compile-error-output/" is a directory containing files that consist of warning or error message
- "answer.txt" is the correct answer file
- "result.txt" consists of stdout(standard output)

## Usage

Type this line on your shell.<br />
``
./auto_compile.sh submitted_assignments/*.c
``

## TODO list
* [x] Arrange directory structure
* [ ] When I exectue python script, make a "src/build"-directory for storing products.
* [ ] Let __init__.py init files and check whether there is an error.
* [ ] Enable an user to set a path about executable file(a.out)
* [ ] Remake README.md

