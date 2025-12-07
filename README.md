# Mobility Engineering Lab Course

This repository contains my study materials, implementations, and lab projects for the Mobility Engineering Lab course at Inha University. The course focuses on **ROS 2, robotics, and autonomous systems development**.

## Repository Structure

```markdown
course.mobility-engineering/
├── assignments/                   # Weekly course assignments
│   ├── w2-vmware-ubuntu-setup.md
│   ├── w3-ros2-setup.md
│   ├── w4-turtlesim-setup.md
│   ├── w5-pub-sub.md
│   └── w6-smart-lighting.md
├── lab-projects/                  # Hands-on laboratory projects
│   ├── w3-ubuntu-cli/             # Ubuntu command-line exercises
│   └── w6-smart-light/            # ROS 2 smart lighting system
├── projects/                      # Major course projects
│   └── module.ros2-automation/    # TurtleBot3 automation suite
├── public/                        # Documentation images and assets
└── resources/                     # Reference materials and datasets
```

## Course Topics

### ROS 2 Fundamentals
- ROS 2 Foxy installation and setup
- Publisher-subscriber architecture
- Launch files and node composition
- Package creation and management

### Robotics Development
- TurtleBot3 simulation and control
- Autonomous navigation with Nav2
- SLAM mapping and localization
- Sensor integration and processing

### Intelligent Systems
- Computer vision and object detection
- IoT sensor integration (motion sensors, actuators)
- Real-time monitoring and diagnostics
- Custom behavior development (QR following)

## Development Environment

- **OS**: Ubuntu 20.04 (VMware/Native)
- **ROS**: ROS 2 Foxy Fitzroy
- **Python**: 3.8
- **IDE**: VS Code with ROS extensions and GitHub Copilot

## Key Technologies

- **ROS 2**: Foxy Fitzroy, rclpy, launch system
- **Robotics**: TurtleBot3, Nav2, SLAM Toolbox
- **Computer Vision**: OpenCV, YOLOv8, vision_msgs
- **Development**: colcon, rosdep, Python packaging
- **IoT**: Smart sensors and actuators integration

## Featured Projects

### TurtleBot3 Automation Suite (ROS 2)

A comprehensive automation toolkit for TurtleBot3 robotics platform built on ROS 2 Foxy. This project demonstrates practical mobile robotics and autonomous systems development.

**Key Features:**
- Autonomous navigation with SLAM and Nav2 stack
- Real-time object detection using YOLOv8
- System health and maintenance monitoring
- Custom QR-following behavior for guided navigation

**Location**: [`projects/module.ros2-automation/`](./projects/module.ros2-automation/)

**Technologies**: ROS 2 Foxy, Python 3.8, OpenCV, YOLOv8, Nav2, SLAM Toolbox

## Notes

- All projects are built on ROS 2 Foxy (Ubuntu 20.04)
- Weekly assignments document setup and learning progress
- Lab projects focus on practical ROS 2 node development
- Major project demonstrates full-stack autonomous robotics implementation

---

*This repository serves as a comprehensive study guide for ROS 2 robotics and autonomous systems development.*
