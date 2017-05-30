import os
import config


def build_file(path):
    command_build = config.info['command'] + ' '

    # command line that will be executed
    command_build += path
    command_build += " 2>&1"

    print("build_file :" + command_build)
    os.popen(command_build)  # execute command line # TODO: error check
    # TODO: error check
    os.popen(command_build)


def execute_file(path):
    filename = os.path.basename(str(path))
    command_execute = './a.out'
    command_execute += " < " + config.file_info['input_file']
    command_execute += " > " + config.file_info['output_format'] + filename

    print("execute_file: " + command_execute)
    os.popen(command_execute)
    # TODO: diff
    # clear
    os.system("rm a.out")
