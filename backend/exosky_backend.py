"""Backend for exoplanet app."""

from pathlib import Path
from typing import TypedDict

import cv2
import numpy as np
import numpy.typing as npt

TOI_700d = Path(r"resources\pictures\toi-700d.png")

ROSS_128b = Path(r"resources\pictures\ross-128b.png")

TRAPPIST_1e = Path(r"resources\pictures\trappist-1e.png")

#galactic_core = 

class SelectionData(TypedDict):
    """Allow the user to select planet."""

    planet: str


def read_image(img_path: Path) -> npt.NDArray[np.uint8]:
    """Read png image."""
    return cv2.imread(str(img_path), cv2.IMREAD_UNCHANGED)


def read_log(discovery_path: Path) -> str:
    """Read text."""
    file = open(discovery_path, "r")
    return file.read()


class ExoSkyBakend:
    """Backend to display information."""

    def __init__(self) -> None:
        """Initialize the backend."""

    def display_planets(self, user_data: SelectionData) -> npt.NDArray[np.uint8]:
        """Display the planet (hypothetical) images."""
        if user_data["planet"] == "TOI-700 d":
            image = read_image(TOI_700d)
        if user_data["planet"] == "ROSS-128 b":
            image = read_image(ROSS_128b)
        if user_data["planet"] == "TRAPPIST-1 e":
            image = read_image(TRAPPIST_1e)
        return np.array(image)

