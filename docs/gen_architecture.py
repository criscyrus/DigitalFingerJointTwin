"""Generate system architecture diagram showing star-topology connection of all components."""
import matplotlib.pyplot as plt
import matplotlib.patches as mpatches
import numpy as np

fig, ax = plt.subplots(figsize=(12, 9))
ax.set_xlim(-1.6, 1.6)
ax.set_ylim(-1.5, 1.5)
ax.set_aspect('equal')
ax.axis('off')

fig.patch.set_facecolor('#FAFAFA')

# Component definitions: (label, angle_deg, color, category)
components = [
    ("FingerSegment\n(J·dω/dt = Στ)",  90,  "#4A90D9", "dynamics"),
    ("FlexorTendon\n(τ = +τmax·u)",    150, "#E05555", "active"),
    ("ExtensorTendon\n(τ = −τmax·u)",  210, "#3A7EC9", "active"),
    ("JointSpring\n(τ = k·(φ−φ₀))",   270, "#4CAF50", "passive"),
    ("JointDamper\n(τ = d·φ̇)",        330, "#FF9800", "passive"),
    ("JointLimits\n(smoothMax)",          30, "#9C27B0", "passive"),
    ("GravityTorque\n(τ = −mgr·sinφ)", 330-360+60, "#795548", "environment"),
    ("ContactLoad\n(Kelvin-Voigt)",     270-180,   "#F44336", "environment"),
    ("ExternalLoad\n(τ = τload)",       150-180,   "#607D8B", "environment"),
]

# Re-lay out evenly at fixed angles
angles_deg = [90, 35, 340, 295, 250, 205, 155, 110, 68]
labels_data = [
    ("FingerSegment\n(J·dω/dt = Στ)",  "#4A90D9", "dynamics"),
    ("FlexorTendon\n(τ = +τmax·u)",    "#E05555", "active"),
    ("ExtensorTendon\n(τ = −τmax·u)",  "#5588CC", "active"),
    ("JointSpring\n(τ = k·(φ−φ₀))",   "#4CAF50", "passive"),
    ("JointDamper\n(τ = d·φ̇)",        "#FF9800", "passive"),
    ("JointLimits\n(smoothMax)",        "#9C27B0", "passive"),
    ("GravityTorque\n(τ = −mgr·sinφ)","#795548", "environment"),
    ("ContactLoad\n(Kelvin-Voigt)",    "#F44336", "environment"),
    ("ExternalLoad\n(τ = τload)",      "#607D8B", "environment"),
]

# Evenly space all 9 components
n = len(labels_data)
angles_deg = [90 + i * (360 / n) for i in range(n)]

r_node = 1.1   # radius of component boxes
r_center = 0.28  # central node radius

# Category colors for legend
cat_colors = {
    "dynamics":    "#4A90D9",
    "active":      "#E05555",
    "passive":     "#4CAF50",
    "environment": "#795548",
}
cat_labels = {
    "dynamics":    "Dynamics (FingerSegment)",
    "active":      "Active actuation (tendons)",
    "passive":     "Passive properties (spring/damper/limits)",
    "environment": "Environmental forces",
}

# Draw central node
central = plt.Circle((0, 0), r_center, color="#1A237E", zorder=5)
ax.add_patch(central)
ax.text(0, 0.06, "RotationalPort", ha='center', va='center',
        fontsize=8.5, fontweight='bold', color='white', zorder=6)
ax.text(0, -0.08, "(φ, τ)", ha='center', va='center',
        fontsize=8, color='#BBDEFB', zorder=6)

box_w, box_h = 0.44, 0.22

for i, (label, color, cat) in enumerate(labels_data):
    a = np.radians(angles_deg[i])
    cx = r_node * np.cos(a)
    cy = r_node * np.sin(a)

    # Line from center to box edge
    # Shorten line to stop at central node radius
    dx, dy = cx / r_node, cy / r_node
    x0 = r_center * dx
    y0 = r_center * dy
    # Stop at box border
    if abs(dx) > 1e-6:
        t_x = (box_w / 2) / abs(dx)
    else:
        t_x = 1e9
    if abs(dy) > 1e-6:
        t_y = (box_h / 2) / abs(dy)
    else:
        t_y = 1e9
    t = min(t_x, t_y)
    x1 = cx - dx * t
    y1 = cy - dy * t

    ax.annotate("", xy=(x0, y0), xytext=(x1, y1),
                arrowprops=dict(arrowstyle="-", color=color, lw=2.0, zorder=3))

    # Component box
    rect = mpatches.FancyBboxPatch(
        (cx - box_w / 2, cy - box_h / 2), box_w, box_h,
        boxstyle="round,pad=0.02",
        linewidth=2, edgecolor=color,
        facecolor=color + "22",  # 13% opacity approximation via hex
        zorder=4
    )
    ax.add_patch(rect)
    ax.text(cx, cy, label, ha='center', va='center',
            fontsize=7.5, fontweight='bold', color=color, zorder=5,
            linespacing=1.4)

# Legend
legend_patches = [
    mpatches.Patch(facecolor=cat_colors[c], edgecolor=cat_colors[c], label=cat_labels[c])
    for c in cat_colors
]
ax.legend(handles=legend_patches, loc='lower center', bbox_to_anchor=(0.5, -0.04),
          ncol=2, fontsize=9, framealpha=0.9, edgecolor='#CCCCCC')

ax.set_title("FingerJointTwin — System Architecture\n"
             "All components share one RotationalPort node (Kirchhoff torque summation)",
             fontsize=12, fontweight='bold', color='#1A237E', pad=14)

plt.tight_layout()
plt.savefig("images/system_architecture.png", dpi=150, bbox_inches='tight',
            facecolor=fig.get_facecolor())
print("Saved: docs/images/system_architecture.png")
