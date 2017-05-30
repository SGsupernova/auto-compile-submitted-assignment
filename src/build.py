import os
import config


def build_file(path):
    filename = os.path.basename(str(path))
    command_line = dict(
            build=config.info['command'] + ' ',
            execute='./a.out')
    # command line that will be executed
    command_line['build'] += filename + " 2>&1"
    # TODO: error check
    os.popen(command_line['build'])  # execute command line

    command_line['execute'] += " < " + config.info['input_file'] + " > "
    command_line['execute'] += config.info['output_format'] + filename

    # TODO: error check
    os.popen()

    # clear
    os.system("rm a.out")
