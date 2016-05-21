#!/bin/bash
# USE : ./grading.sh c_files/*.c
# We need three folders :
# c_files - containing c files
# output - containing output files(stdout)
# diff_output - contining output files that results from "diff" command


# 인자가 {directory}/xxx.c 형태일 때, xxx를 구한다.
# 상대 경로 또는 절대 경로 형태로,
# directory에 /까지 포함시킬 것.
c_dir=c_files/
c_dir_len=${#c_dir}
cur_dir=./
diff_dir=diff_output/

result_filename="result.txt"
trash_filename="trash.txt"

front_file_format=ds_hw_1_
front_format_len=${#front_file_format}

# make an empty file, result.txt
echo -n "" | cat > result.txt

for i in $@; do
	# bad substitution 을 방지하기 위해 temp_file에 인자를 넣는다.
	# filename은 format이 xxx.c 이다.
	temp_file=$i
	filename=${temp_file:c_dir_len}

	# get student number
	student_number=${filename:front_format_len:8}

	# relative paths
	# : c_file - c파일 접근 / output - output file 접근 / answer - answer-접근
	path_c_file=$c_dir$filename
	path_output=$cur_dir"output/"$student_number"-output.txt"
	path_answer=$cur_dir"answer.txt"
	path_diff=$diff_dir"$student_number""-diff.txt"


	# compile c files
	# meaning of 2>&1 - (1)
	gcc $path_c_file 2>&1 | cat >  $trash_filename

	# a.out file exists!
	if [ ! -e "a.out" ]; then
		echo "fail - compile error $filename" >> $result_filename
		continue
	fi

	./a.out > $path_output
	diff $path_answer $path_output > $path_diff

	# there is no difference -> correct!
	if [ $? -eq 0 ]
	then
		echo "success : $filename" >> $result_filename
	else
		echo "fail - wrong answer $filename" >> $result_filename
		echo "$i failed"
	fi
done

rm -f a.out $trash_filename

# (1) - reference : http://unix.stackexchange.com/questions/99263/what-does-21-in-this-command-mean
# 2 refers to the second file descriptor of the process,that is, "stderr"
# > means redirection
# &1 means the target of the redirection should be the same location as the first file descriptor,that is,"stdout"
