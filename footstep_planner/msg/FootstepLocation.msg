## FootstepLocation

# Specifies which foot of the robot
uint8 robot_side

# Specifies the position and orientation of the footstep. It is expressed in world frame.
geometry_msgs/Pose pose

# "robot_side" enum values:
uint8 LEFT=0 # refers to the LEFT side of a robot
uint8 RIGHT=1 # refers to the RIGHT side of a robot
