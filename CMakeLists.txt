cmake_minimum_required(VERSION 2.8.3)
project(mapping_with_lidar)

catkin_package()

install(DIRECTORY launch meshes robots rviz urdf
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
  USE_SOURCE_PERMISSIONS
)
