#!/usr/bin/env python3
import rclpy
from rclpy.node import Node
from std_msgs.msg import Bool
import random


class MotionSensorNode(Node):
    def __init__(self):
        super().__init__("motion_sensor")
        self.pub = self.create_publisher(Bool, "motion_detected", 10)
        self.timer = self.create_timer(1.0, self.timer_cb)

    def timer_cb(self):
        msg = Bool()
        # Simulate motion randomly (20% chance)
        msg.data = random.random() > 0.8
        self.pub.publish(msg)
        self.get_logger().info(f"Published motion: {msg.data}")


def main(args=None):
    rclpy.init(args=args)
    node = MotionSensorNode()
    try:
        rclpy.spin(node)
    except KeyboardInterrupt:
        pass
    node.destroy_node()
    rclpy.shutdown()


if __name__ == "__main__":
    main()
