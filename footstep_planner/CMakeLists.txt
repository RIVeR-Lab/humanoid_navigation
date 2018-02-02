cmake_minimum_required(VERSION 2.8.3)
project(footstep_planner)

find_package(catkin REQUIRED COMPONENTS actionlib angles gridmap_2d humanoid_nav_msgs map_server message_generation roscpp rospy tf visualization_msgs)

find_package(OpenCV REQUIRED)
find_package(PkgConfig REQUIRED)
pkg_check_modules(SBPL REQUIRED sbpl)
include_directories(${SBPL_INCLUDE_DIRS})
link_directories(${SBPL_LIBRARY_DIRS})

add_message_files(
   FILES
   FootstepLocation.msg
   FootstepLocationsArray.msg
)

generate_messages(DEPENDENCIES geometry_msgs)

catkin_package(
  CATKIN_DEPENDS message_runtime
  INCLUDE_DIRS include
  LIBRARIES ${PROJECT_NAME}
)

set(FOOTSTEP_PLANNER_FILES src/FootstepPlanner.cpp
    src/FootstepNavigation.cpp
    src/FootstepPlannerNode.cpp
    src/FootstepPlannerEnvironment.cpp 
    src/Footstep.cpp
    src/PlanningState.cpp
    src/Heuristic.cpp 
    src/helper.cpp
    src/PathCostHeuristic.cpp
    src/PlanningStateChangeQuery.cpp
    src/State.cpp
)

include_directories(include ${catkin_INCLUDE_DIRS})

add_library(${PROJECT_NAME} ${FOOTSTEP_PLANNER_FILES})
add_dependencies(footstep_planner ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})

add_executable(footstep_planner_node src/footstep_planner.cpp)
target_link_libraries(footstep_planner_node ${PROJECT_NAME} ${catkin_LIBRARIES} ${SBPL_LIBRARIES})

#add_executable(footstep_planner_walls src/footstep_planner_walls.cpp)
#target_link_libraries(footstep_planner_walls ${PROJECT_NAME} ${catkin_LIBRARIES} ${SBPL_LIBRARIES} ${OpenCV_LIBS})

#add_executable(footstep_navigation_node src/footstep_navigation.cpp)
#target_link_libraries(footstep_navigation_node ${PROJECT_NAME} ${catkin_LIBRARIES} ${SBPL_LIBRARIES})
