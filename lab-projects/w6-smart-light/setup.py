from setuptools import setup
import os
from glob import glob

package_name = "py_smart_light"

setup(
    name=package_name,
    version="0.0.0",
    packages=[package_name],
    data_files=[
        (
            ("share/ament_index/resource_index/packages", ["resource/" + package_name])
            if False
            else ()
        ),
    ],
    install_requires=["setuptools"],
    zip_safe=True,
    maintainer="Your Name",
    maintainer_email="you@example.com",
    description="Smart Lighting example with motion sensor, controller and light actuator",
    license="MIT",
    tests_require=["pytest"],
    entry_points={
        "console_scripts": [
            "motion_sensor = py_smart_light.motion_sensor:main",
            "light_controller = py_smart_light.light_controller:main",
            "light_actuator = py_smart_light.light_actuator:main",
        ],
    },
)
