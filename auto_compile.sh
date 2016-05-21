#!/bin/bash
# USE : ./grading.sh c_files/*.c
# We need three folders :
# c_files - containing c files
# output - containing output files(stdout)
# diff_output - contining output files that results from "diff" command


# 인자가 {directory}/xxx.c 형태일 때, xxx를 구한다.
# 상대 경로 또는 절대 경로 형태로, (오직 상대 경로로만 하도록 이라고 영어로 바꾸기!)
# directory에 /까지 포함시킬 것.
cur_dir="./"
assign_dir="submitted-assignments/"
assign_dir_len=${#assign_dir}
diff_dir="diff-output/"
compile_dir="compile-error-output/"


# set result filename
result_filename="result.txt"
temp_filename="temp.txt"

# full format : ds_hw_1_20140000.c
front_file_format="ds_hw_1_"
front_format_len=${#front_file_format}


# if a directory doesn't exist, then make one!
if [ ! -d "$assign_dir" ]; then
	mkdir $assign_dir
fi

if [ ! -d "$diff_dir" ]; then
	mkdir $diff_dir
fi

if [ ! -d "$compile_dir" ]; then
	mkdir $compile_dir
fi

if [ ! -d "output" ]; then
	mkdir output
fi


# make an empty file, result.txt
echo -n "" | cat > result.txt

for i in $@; do
	# bad substitution 을 방지하기 위해 temp_file에 인자를 넣는다.
	# filename은 format이 xxx.c 이다.
	temp_file=$i
	filename=${temp_file:assign_dir_len}

	# get student number
	student_number=${filename:front_format_len:8}

	# relative paths
	# : c_file - c파일 접근 / output - output file 접근 / answer - answer-접근
	path_c_file=$assign_dir$filename
	path_output=$cur_dir"output/"$student_number"-output.txt"
	path_answer=$cur_dir"answer.txt"
	path_diff=$diff_dir"$student_number""-diff.txt"
	path_compile=$compile_dir$student_number"-compile-output.txt"

	# compile c files
	# meaning of 2>&1 - (1)
	gcc $path_c_file 2>&1 | cat >  $temp_filename

	# if there is compile warning or error, make a output file containing a message(warning or error)
	# check file size --> if file size is not zero, then there is compile warning or error
	if [ -s $temp_filename ]; then	
		echo "compile error or warning occurs - $student_number" >> $result_filename
		echo "compile error or warning occurs - $student_number"
		cat $temp_filename > $path_compile
	fi


	# a.out file exists!
	if [ ! -e "a.out" ]; then
		echo "$student_number - fail(compile error)" >> $result_filename
		echo "$student_number - fail(compile error)"
		continue
	fi

	./a.out > $path_output
	diff $path_answer $path_output > $path_diff

	# there is no difference -> correct!
	if [ $? -eq 0 ]
	then
		echo "$student_number - success" >> $result_filename
		echo "$student_number - success"
	else
		echo "$student_number - fail(wrong answer)" >> $result_filename
		echo "$student_number - fail(wrong answer)"
	fi
	
	# remove a.out file for checking that there is a compile error
	rm a.out
done

# clear
rm -f a.out $temp_filename

# (1) - reference : http://unix.stackexchange.com/questions/99263/what-does-21-in-this-command-mean
# 2 refers to the second file descriptor of the process,that is, "stderr"
# > means redirection
# &1 means the target of the redirection should be the same location as the first file descriptor,that is,"stdout"
