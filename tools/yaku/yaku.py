#!/usr/bin/env python3
# -*- coding: utf-8 -*-


import sys
import argparse
sys.path.append("/opt/robocomp/python")
import yaku_lib

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('-a', '--append', action='store_true', dest="append",
                        help="Append the given name to the directory name for the Tab title")
    parser.add_argument('-e', '--every', action='store_true', dest="every",
                        help="Rename every open tab to the directory the session is in.")
    parser.add_argument('name', nargs='?', help="Alternative name for the tab")
    parser.add_argument('-s', '--save', action='store_true', dest="save",
                        help="Save all the current tabs_by_name information to an script to restore session.")
    args = parser.parse_args()
    yaku = yaku_lib.Yaku()
    if args.save:
        yaku.create_yakuake_start_shell_script()
    elif args.every:
        yaku.rename_all_tabs(args.name, args.append)
    else:
        yaku.rename_current_tab(args.name, args.append)