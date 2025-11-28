#!/usr/bin/env python3
import rclpy
from rclpy.node import Node
from std_msgs.msg import Bool


class LightActuator(Node):
    def __init__(self):
        super().__init__("light_actuator")
        self.sub = self.create_subscription(Bool, "light_on", self.light_cb, 10)

    def light_cb(self, msg: Bool):
        if msg.data:
            self.get_logger().info("Light actuator: LIGHT ON")
        else:
            self.get_logger().info("Light actuator: LIGHT OFF")


def main(args=None):
    rclpy.init(args=args)
    node = LightActuator()
    try:
        rclpy.spin(node)
    except KeyboardInterrupt:
        pass
    node.destroy_node()
    rclpy.shutdown()


if __name__ == "__main__":
    main()
