#!/usr/bin/env python3
import rclpy
from rclpy.node import Node
from std_msgs.msg import Bool
from rclpy.qos import QoSProfile
import threading
import time


class LightController(Node):
    def __init__(self):
        super().__init__("light_controller")
        qos = QoSProfile(depth=10)
        self.sub = self.create_subscription(
            Bool, "motion_detected", self.motion_cb, qos
        )
        self.pub = self.create_publisher(Bool, "light_on", qos)
        self.light_state = False
        self._last_motion_time = None
        self._auto_off_seconds = 30.0  # default auto-off timeout
        # start background timer to check for auto-off
        self._timer = self.create_timer(1.0, self._check_auto_off)

    def motion_cb(self, msg: Bool):
        now = time.time()
        if msg.data:
            self._last_motion_time = now
            if not self.light_state:
                self.light_state = True
                out = Bool()
                out.data = True
                self.pub.publish(out)
                self.get_logger().info("Motion detected -> turning light ON")
        else:
            # record lack of motion - still rely on timeout to turn off
            self.get_logger().debug("Motion message: False")

    def _check_auto_off(self):
        if self.light_state and self._last_motion_time is not None:
            if time.time() - self._last_motion_time > self._auto_off_seconds:
                self.light_state = False
                out = Bool()
                out.data = False
                self.pub.publish(out)
                self.get_logger().info("No motion -> turning light OFF (timeout)")


def main(args=None):
    rclpy.init(args=args)
    node = LightController()
    try:
        rclpy.spin(node)
    except KeyboardInterrupt:
        pass
    node.destroy_node()
    rclpy.shutdown()


if __name__ == "__main__":
    main()
