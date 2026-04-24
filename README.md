# DigitalFingerJointTwin

A physics-based digital twin of a tendon-driven finger joint, developed for the **Digital Twin Engineering** course at **Karlsruhe Institute of Technology (KIT)**, WS 2025/26.

## Motivation

Understanding and replicating the mechanics of a human finger has applications across **prosthetics**, **surgical robotics**, **rehabilitation engineering**, and **industrial grippers**. This project builds a modular digital twin in Modelica that captures the key biomechanical phenomena — tendon actuation, passive tissue stiffness, anatomical limits, gravity, and object contact — all within a single reusable library.

The same model structure, with only parameter changes, represents a human finger, a prosthetic device, and a robotic gripper — demonstrating the power of physics-based digital twins for cross-domain design.

## Simulation Results

### Joint Angle — All 5 Cases
![Joint Angle](docs/images/joint_angle_all.png)

### Case 1 — Free Motion: Torque Breakdown
![Torque Breakdown](docs/images/case1_torque_breakdown.png)

### Case 2 vs Case 3 — Soft vs Hard Object
![Case 2 vs Case 3](docs/images/case2_vs_case3.png)
The hard object (k=10) produces higher contact forces and restricts joint motion earlier than the soft object (k=2).

### Human vs Prosthetic vs Robotic Finger
![Human vs Prosthetic vs Robotic](docs/images/human_vs_prosthetic_vs_robotic.png)
The robotic finger reaches contact ~5× faster and generates up to 10× higher grip forces than the human configuration.

### Contact Force — Cases 2–5
![Contact Force](docs/images/contact_force_all.png)

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
| Case 5 | **Robotic** finger — fast actuation, high grip force (~25 N) |

## Physics Model

Each component contributes a torque to the shared rotational joint node (Kirchhoff torque summation):

| Component | Equation |
|---|---|
| Finger Segment | `J · dω/dt = Στ` |
| Flexor Tendon | `τ = +τ_max · u` |
| Extensor Tendon | `τ = −τ_max · u` |
| Joint Spring | `τ = k · (φ − φ₀)` |
| Joint Damper | `τ = d · φ̇` |
| Gravity Torque | `τ = −m·g·r·sin(φ)` |
| Contact Load | `τ = −(k·pen + d·ṗen)` via `smoothMax` |

Contact force is estimated as `F_contact = |τ_contact| / L` where L = 0.05 m (fingertip lever arm).

## How to Run

1. Open **OpenModelica** (OMEdit)
2. Load `FingerJointTwin/package.mo` from the repo root (File → Load Model)
3. Navigate to `FingerJointTwin.Examples`
4. Start with `Case1_FreeMotion`, simulate for 10 seconds
5. Plot `sys.segment.joint.phi` and `sys.F_contact_abs`

## Authors

Cris Cyrus, Athul Sunilkumar, Bergin Sucil Dhas — KIT Digital Twin Engineering WS 2025/26
