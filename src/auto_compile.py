#!/usr/bin/env python
if __name__ == "__main__":
    import sys
    from build import build_file

    for argv in sys.argv[1:]:
        build_file(argv)
