# DigitalFingerJointTwin

A physics-based digital twin of a tendon-driven finger joint, developed for the **Digital Twin Engineering** course at **Karlsruhe Institute of Technology (KIT)**, WS 2025/26.

## Overview

This library models a single finger joint with antagonistic tendon actuation (flexor and extensor), passive joint properties, anatomical limits, gravity, external loads, and object contact. It is implemented in **Modelica** and tested with **OpenModelica**.

The same model structure is used to represent three different finger types by changing parameters:
- Human finger
- Prosthetic finger
- Robotic finger

## Library Structure

| Package | Description |
|---|---|
| `Components` | Physical components: segment, tendons, spring, damper, limits, gravity, loads, contact |
| `Systems` | `FingerJointSystem` — complete system connecting all components |
| `Sources` | Activation signal generators: human, prosthetic, robot, zero |
| `Interfaces` | `RotationalPort` connector (phi, tau) |
| `Functions` | `smoothMax` utility for contact and limit modeling |
| `Examples` | Five simulation cases (see below) |

## Simulation Cases

| Case | Description |
|---|---|
| Case 1 | Free motion — baseline joint dynamics, no contact |
| Case 2 | Human finger grasping a **soft** object (kContact = 2 Nm/rad) |
| Case 3 | Human finger grasping a **hard** object (kContact = 10 Nm/rad) |
| Case 4 | **Prosthetic** finger — higher inertia, stiffness, and damping |
| Case 5 | **Robotic** finger — fast actuation, high grip force (30–35 N) |

## Physics Model

Each component contributes a torque to the shared rotational joint node:

| Component | Equation |
|---|---|
| Finger Segment | `J · dω/dt = Στ` |
| Flexor Tendon | `τ = +τ_max · u` |
| Extensor Tendon | `τ = −τ_max · u` |
| Joint Spring | `τ = k · (φ − φ₀)` |
| Joint Damper | `τ = d · φ̇` |
| Gravity Torque | `τ = −m·g·r·sin(φ)` |
| Contact Load | `τ = −(k·pen + d·ṗen)` via `smoothMax` |

Contact force is estimated as: `F_contact = |τ_contact| / L` where L = 0.05 m.

## How to Run

1. Open **OpenModelica** (OMEdit)
2. Load `FingerJointTwin/package.mo` from the repo root (File → Load Model)
3. Navigate to `FingerJointTwin.Examples`
4. Start with `Case1_FreeMotion`, simulate for 10 seconds
5. Plot `sys.segment.joint.phi` and `sys.F_contact_abs`

## Authors

Cris Cyrus, Athul Sunilkumar, Bergin Sucil Dhas — KIT Digital Twin Engineering WS 2025/26
