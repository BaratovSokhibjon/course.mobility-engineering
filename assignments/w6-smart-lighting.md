# Week 6 - Smart Lighting System using ROS2

### Overview
This assignment shows how to design and implement a simple Smart Lighting System using ROS2 (Foxy / later). The system demonstrates basic ROS2 concepts (publishers, subscribers, services) and a small example controller that turns a light on when motion is detected.

**Learning goals**
- Create a ROS2 Python package and nodes.
- Connect sensor, controller and actuator nodes using topics.
- Test nodes using `ros2 topic pub` and `ros2 topic echo`.
- Package, build and run the system with `colcon`.

---

### Prerequisites
- Ubuntu 20.04 with ROS2 Foxy installed and sourced (`source /opt/ros/foxy/setup.bash`).
- `colcon` and `rosdep` installed.
- Basic familiarity with Python and ROS2 concepts.

---

### 1) Create the ROS2 package
```bash
# Create a Python-based package
ros2 pkg create --build-type ament_python py_smart_light
```

This creates the `py_smart_light` package with a `package.xml` and `setup.py`.

### 2) Package configuration
Open `py_smart_light/package.xml` and set the metadata and dependencies:
```xml
<description>Smart Lighting example with motion sensor, controller and light actuator</description>
<maintainer email="you@example.com">Your Name</maintainer>
<license>MIT</license>

<depend>rclpy</depend>
<depend>std_msgs</depend>
```

Edit `setup.py` to expose entry points for your nodes (examples below).

---

### 3) Node design
We use three simple nodes:
- `motion_sensor` — publishes `std_msgs/msg/Bool` on topic `/motion_detected` when motion is simulated/detected.
- `light_controller` — subscribes to `/motion_detected`, contains the controller logic and publishes `std_msgs/msg/Bool` to `/light_on`.
- `light_actuator` — subscribes to `/light_on` and simulates turning a light on/off.

Topics and message types:
- `/motion_detected` : `std_msgs/Bool` (True when motion)
- `/light_on` : `std_msgs/Bool` (True to switch light on)

---

### 4) Example node: `motion_sensor` (publisher)
Create `py_smart_light/py_smart_light/motion_sensor.py` with this content:
```py
#!/usr/bin/env python3
import rclpy
from rclpy.node import Node
from std_msgs.msg import Bool
import random
import time

class MotionSensorNode(Node):
    def __init__(self):
        super().__init__('motion_sensor')
        self.pub = self.create_publisher(Bool, 'motion_detected', 10)
        self.timer = self.create_timer(1.0, self.timer_cb)

    def timer_cb(self):
        msg = Bool()
        # Simulate motion randomly
        msg.data = random.random() > 0.8
        self.pub.publish(msg)
        self.get_logger().info(f'Published motion: {msg.data}')

def main(args=None):
    rclpy.init(args=args)
    node = MotionSensorNode()
    try:
        rclpy.spin(node)
    except KeyboardInterrupt:
        pass
    node.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()
```

---

### 5) Example node: `light_controller` (subscriber + publisher)
Create `py_smart_light/py_smart_light/light_controller.py`:
```py
#!/usr/bin/env python3
import rclpy
from rclpy.node import Node
from std_msgs.msg import Bool

class LightController(Node):
    def __init__(self):
        super().__init__('light_controller')
        self.sub = self.create_subscription(Bool, 'motion_detected', self.motion_cb, 10)
        self.pub = self.create_publisher(Bool, 'light_on', 10)
        self.light_state = False

    def motion_cb(self, msg: Bool):
        if msg.data:
            # Turn light on when motion detected
            if not self.light_state:
                self.light_state = True
                out = Bool()
                out.data = True
                self.pub.publish(out)
                self.get_logger().info('Motion detected -> turning light ON')
        else:
            # Optionally, implement timeout/debounce to turn off after no motion
            pass

def main(args=None):
    rclpy.init(args=args)
    node = LightController()
    try:
        rclpy.spin(node)
    except KeyboardInterrupt:
        pass
    node.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()
```

Notes: in a real deployment, add debouncing or a timer to turn the light off after inactivity.

---

### 6) Example node: `light_actuator` (subscriber)
Create `py_smart_light/py_smart_light/light_actuator.py`:
```py
#!/usr/bin/env python3
import rclpy
from rclpy.node import Node
from std_msgs.msg import Bool

class LightActuator(Node):
    def __init__(self):
        super().__init__('light_actuator')
        self.sub = self.create_subscription(Bool, 'light_on', self.light_cb, 10)

    def light_cb(self, msg: Bool):
        if msg.data:
            self.get_logger().info('Light actuator: LIGHT ON')
        else:
            self.get_logger().info('Light actuator: LIGHT OFF')

def main(args=None):
    rclpy.init(args=args)
    node = LightActuator()
    try:
        rclpy.spin(node)
    except KeyboardInterrupt:
        pass
    node.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()
```

---

### 7) Add entry points to `setup.py`
Example `setup.py` entry points section:
```py
entry_points={
    'console_scripts': [
        'motion_sensor = py_smart_light.motion_sensor:main',
        'light_controller = py_smart_light.light_controller:main',
        'light_actuator = py_smart_light.light_actuator:main',
    ],
},
```

---

### 8) Install dependencies, build and source
```bash
# Install package deps
rosdep update
rosdep install -i --from-path src --rosdistro foxy -y

# Build
colcon build --packages-select py_smart_light

# Source the overlay
. install/setup.bash
```

---

### 9) Run the system
Open three terminals (or use tmux) and run each node:
```bash
# terminal 1
source /opt/ros/foxy/setup.bash
source install/setup.bash
ros2 run py_smart_light motion_sensor

# terminal 2
source /opt/ros/foxy/setup.bash
source install/setup.bash
ros2 run py_smart_light light_controller

# terminal 3
source /opt/ros/foxy/setup.bash
source install/setup.bash
ros2 run py_smart_light light_actuator
```

You should see logs indicating motion and light actuator state changes.

---

### 10) Quick testing using CLI
You can simulate motion manually without the sensor node:
```bash
# Publish a True (motion detected)
ros2 topic pub /motion_detected std_msgs/msg/Bool "data: true" -1

# Observe light state
ros2 topic echo /light_on
```

To publish ``false``:
```bash
ros2 topic pub /motion_detected std_msgs/msg/Bool "data: false" -1
```

---

### 11) Optional: Launch file
Create a simple launch file to start all three nodes together using `launch` (Python) or a shell wrapper. This is left as an exercise.

---

### Conclusion
This assignment demonstrates the full flow from sensor input to actuator using ROS2 topics. Extend the controller with timers, light dimming (using a Float message), or use the `Parameter` API to tune timeouts.

---

### Next steps / Exercises
- Add an automatic timeout: turn off light 30s after last motion.
- Replace random motion with a real sensor input (GPIO or simulated sensor).
- Implement a `service` to query current light state.
- Add images/screenshots to `public/images/w6-smart-lighting/` and reference them in this document.

