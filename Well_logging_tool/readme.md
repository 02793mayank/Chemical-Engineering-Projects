# Interactive Well Log Visualization System

A Python-based interactive visualization tool for exploring and comparing well-log measurements across user-defined depth intervals. The project uses Pandas, NumPy, Matplotlib, and IPyWidgets to display multiple borehole logging curves in a synchronized, six-track layout.

## Overview

Well-log data contains measurements recorded at different depths within a borehole. Visualizing these measurements together helps users examine variations in subsurface properties and compare different logging responses.

This project provides an interactive plotting interface where users can adjust the starting and ending measured depths to explore selected intervals of a well.

## Features

- **Interactive depth selection:** Adjust the starting and ending depths using sliders.
- **Six-track visualization:** Display multiple well-log measurements in a shared-depth layout.
- **Caliper analysis:** Visualize borehole diameter measurements alongside a reference bit size.
- **Gamma Ray and SP logs:** Plot natural gamma-ray response and spontaneous potential measurements.
- **Resistivity comparison:** Compare deep, medium, and shallow resistivity curves on a logarithmic scale.
- **Neutron–Density visualization:** Overlay neutron and bulk-density measurements using separate horizontal axes.
- **Sonic log visualization:** Examine sonic transit-time measurements across the selected depth interval.

## Technology Stack

| Technology | Purpose |
|---|---|
| Python | Core programming language |
| Pandas | Loading and filtering well-log data |
| NumPy | Numerical data handling |
| Matplotlib | Multi-track plotting and visualization |
| IPyWidgets | Interactive depth-range sliders |
| Jupyter Notebook | Interactive execution environment |
| Excel | Source data storage |

## Visualized Well Logs

The tool organizes the measurements into six main tracks:

| Track | Measurements | Purpose |
|---|---|---|
| 1. Caliper | `CLXF (INCH)` | Visualizes borehole diameter against the reference bit size |
| 2. Gamma Ray | `GRF (GAPI)` | Displays gamma-ray response with depth |
| 3. Spontaneous Potential | `SP (MV)` | Displays spontaneous potential variation |
| 4. Resistivity | `RILD`, `RILM`, `RMSF` | Compares deep, medium, and shallow resistivity responses |
| 5. Neutron–Density | `CNS`, `RHOB (G/C3)` | Compares neutron response and bulk-density measurements |
| 6. Sonic | `Delta T (MSEC)` | Displays sonic transit-time variation |

The resistivity track uses a logarithmic horizontal axis, while the neutron–density track uses two horizontal axes to display both measurements together.

## Dataset

The project reads well-log data from an Excel workbook named `Well_Log_Data.xlsx`, using the worksheet `Sheet1`.

The dataset includes measurements such as:

- `Measured Depth (M)` — depth coordinate used for plotting and interval selection
- `CLXF (INCH)` — caliper measurement
- `GRF (GAPI)` — gamma-ray measurement
- `SP (MV)` — spontaneous potential
- `RILD Deep Resistivity Log (Laterolog Deep) (OHMM)`
- `RILM Medium Resistivity Log (Laterolog Medium) (OHMM)`
- `RMSF Shallow Resistivity Log (Micro Spherically Focused Log) (OHMM)`
- `RHOB (G/C3)` — bulk-density measurement
- `CNS` — neutron measurement
- `Delta T (MSEC)` — sonic transit time

**Note:** The workbook must contain the column names expected by the plotting code. If your Excel file uses different names or units, update the corresponding column references in the script.

## Installation

### 1. Clone the repository

```bash
git clone <YOUR_GITHUB_REPOSITORY_URL>
cd <YOUR_PROJECT_FOLDER>
```

Replace the placeholders with your actual repository URL and project folder name.

### 2. Install dependencies

```bash
pip install pandas numpy matplotlib ipywidgets openpyxl jupyter
```

### 3. Add the dataset

Place `Well_Log_Data.xlsx` in the same working directory as your notebook or Python script, or update the file path in the code.

### 4. Launch Jupyter Notebook

```bash
jupyter notebook
```

Open your project notebook and run the cells.

## How to Use

1. Load the Excel dataset into the notebook.
2. Run the cells that define the depth limits and plotting function.
3. Execute the interactive widget cell to display the depth sliders.
4. Choose a starting depth and an ending depth.
5. Examine the corresponding well-log curves across the selected interval.

The notebook requires an environment that supports IPyWidgets. If the sliders do not appear, check that the widget extension and Jupyter environment are configured correctly.

## Project Structure

A suggested repository layout is:

```text
interactive-well-log-visualization/
├── Well_Log_Data.xlsx
├── well_Log_Plot.ipynb
├── README.md
├── Plotting_procedure.docx
└── Output.png
```

The notebook filename is illustrative; replace it with your actual filename. Keep the dataset out of the public repository if you do not have permission to redistribute it.

## Implementation Notes

- The depth sliders are configured with integer steps.
- The plots share the measured-depth axis to support vertical comparison.
- The resistivity curves use a logarithmic scale.
- The neutron and density curves are overlaid using Matplotlib's `twiny()` functionality.
- The plotting function checks whether the selected depth interval contains any data.

For the selected depth range to affect all displayed curves, the plotting calls should use the filtered DataFrame (`df`) rather than the complete dataset (`well_data`).

## Future Improvements

- Add automatic validation for invalid or reversed depth intervals.
- Display the selected depth range and number of data points.
- Add configurable curve colors, axis limits, and reference lines.
- Export selected depth intervals and plots as image files.
- Add missing-value handling and dataset validation.
- Improve the layout for clearer axis labels and legends.

## Disclaimer

This project is intended for well-log data visualization and exploratory comparison. It does not independently determine lithology, calculate formation properties, or provide automated reservoir predictions.

## Author

**Mayank Sahu**

[GitHub Profile](https://github.com/02793mayank)
