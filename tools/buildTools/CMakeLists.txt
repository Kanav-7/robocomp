cmake_minimum_required( VERSION 2.6 )


INSTALL(FILES "workspace.py" DESTINATION /opt/robocomp/python)
INSTALL(PROGRAMS "rcworkspace.py" DESTINATION /opt/robocomp/bin RENAME rcworkspace )
INSTALL(PROGRAMS "rcbuildvalidator/rcbuildvalidator.py" DESTINATION /opt/robocomp/bin RENAME rcbuildvalidator )
INSTALL( DIRECTORY "rcbuildvalidator/resources" DESTINATION /opt/robocomp/share/rcbuildvalidator )
INSTALL(PROGRAMS "rcrun.py" DESTINATION /opt/robocomp/bin RENAME rcrun )
INSTALL(PROGRAMS "rced.py" DESTINATION /opt/robocomp/bin RENAME rced )
INSTALL(PROGRAMS "rcbuild.py" DESTINATION /opt/robocomp/bin RENAME rcbuild )
INSTALL(PROGRAMS "rccomp.py" DESTINATION /opt/robocomp/bin RENAME rccomp )
INSTALL(PROGRAMS "rccd_utils.py" DESTINATION /opt/robocomp/bin RENAME rccd_utils )
INSTALL(PROGRAMS "rccd.sh" DESTINATION /opt/robocomp/share ) #source this in .bashrc
INSTALL(CODE "message(STATUS \"Installing rccd in ~./bashrc\")
execute_process(COMMAND sh \"${CMAKE_CURRENT_LIST_DIR}/setup.sh\")")
INSTALL(CODE "message(STATUS \"Installing autocompletion in ~./bashrc\")
execute_process(COMMAND activate-global-python-argcomplete)")
INSTALL(CODE "message(STATUS \"First execution of rcworkspace\")
execute_process(COMMAND /opt/robocomp/bin/rcworkspace ${RoboComp_SOURCE_DIR}/components/ --accept-all) ")

