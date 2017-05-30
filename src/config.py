info = dict(
    command='gcc',
    build_dir='./build/',
    res_dir='../resource/',
    input_dir_name='input/',
    answer_dir_name='answer/',
    output_dir_name='output/',
)

filename = dict(
    input_filename='1_in.txt',
    answer_filename='1_ans.txt',
    output_front_format='output_',
)

option = dict(
    is_input=False,
)

# you don't need to edit below code
file_info = dict(
    input_file=(info['res_dir'] + info['input_dir_name'] +
                filename['input_filename']),
    answer_file=(info['res_dir'] + info['answer_dir_name'] +
                 filename['answer_filename']),
    output_format=(info['build_dir'] + info['output'] +
                   filename['output_front_format']),
)
