<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Multistage Batch Distillation</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 20px;
      max-width: 900px;
      background: #f7f9fc;
      color: #333;
    }

    h1, h2 { color: #023e8a; }
    label { font-weight: bold; display:block; margin-top:10px; }
    input, select { width: 100%; padding: 8px; margin: 6px 0 12px; box-sizing: border-box; }
    button { padding: 10px 20px; background: #0077b6; color: white; border: none; border-radius: 6px; cursor: pointer; font-weight: bold; margin-top: 10px; }
    button:hover { background: #023e8a; }

    pre { background:#f6f6f6; padding: 10px; white-space: pre-wrap; word-wrap: break-word; border-radius: 6px; }
  </style>
</head>
<body>

<h1>Multistage Batch Distillation Calculator</h1>
<p>Enter feed composition, relative volatility, number of stages, and final residue for multistage batch distillation.</p>

<form id="multiBatchForm">
  <label>Feed (mol):</label>
  <input type="number" id="F" value="100">

  <label>Feed Composition (xF):</label>
  <input type="number" id="xF" value="0.5">

  <label>Relative Volatility (α):</label>
  <input type="number" id="alpha" value="2">

  <label>Number of Stages (N):</label>
  <input type="number" id="N" value="5">

  <label>Final Residue Composition (xW):</label>
  <input type="number" id="xW" value="0.2">

  <button type="button" onclick="calculateMultiBatch()">Calculate</button>
</form>

<h2>Results</h2>
<pre id="result"></pre>

<script>
function equilibriumY(x, alpha) {
    return (alpha*x)/(1+(alpha-1)*x);
}

function calculateMultiBatch() {
    const F = parseFloat(document.getElementById("F").value);
    const xF = parseFloat(document.getElementById("xF").value);
    const alpha = parseFloat(document.getElementById("alpha").value);
    const N = parseInt(document.getElementById("N").value);
    const xW = parseFloat(document.getElementById("xW").value);

    // Numerical integration of Rayleigh equation
    let steps = 1000;
    let dx = (xF - xW) / steps;
    let integral = 0;

    for (let i = 0; i < steps; i++) {
        let x = xW + i * dx;
        let y = equilibriumY(x, alpha);
        integral += dx / (y - x);
    }

    let ln_FW = integral;
    let W = F / Math.exp(ln_FW);
    let D = F - W;
    let recovery = (D / F) * 100;

    document.getElementById("result").textContent =
        `Final Residue (W): ${W.toFixed(2)} mol\n` +
        `Distillate (D): ${D.toFixed(2)} mol\n` +
        `Recovery: ${recovery.toFixed(2)} %\n` +
        `Estimated Stages: ${N}`;
}
</script>

</body>
</html>
