#!/usr/bin/env python
if __name__ == "__main__":
    import sys
    from build import build_file, execute_file

    for path in sys.argv[1:]:
        build_file(path)
        execute_file(path)
